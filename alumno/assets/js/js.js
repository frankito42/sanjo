let user
let pagos
let modalPago = new bootstrap.Modal('#modalPago')
document.addEventListener("DOMContentLoaded", async (event)=>{
    // Your code to run since DOM is loaded and ready
    comprobarSesion()
    document.getElementById("cerrarSesion").addEventListener("click",()=>{
        cerrarSesion()
    })
    document.getElementById("realizarPagoModalBtn").addEventListener("click",()=>{
        abrirModalPagar()
        console.log((pagos[0]))
        let mes=(pagos==[])?1:pagos[0].mesPagoId+1
        document.getElementById("mesPagar").innerHTML=obtenerNombreMesIntl(mes)
    })
    aosInit()
    inicializar()
    await traerPagos()
    await listarPublicaciones()
});
function aosInit() {
    AOS.init({
      duration: 600,
      easing: 'ease-in-out',
      once: true,
      mirror: false
    });
}
  
function comprobarSesion() {
    if(localStorage.getItem("user")){
        console.log("Hola! "+JSON.parse(localStorage.getItem("user")).nombreCompleto)
        user=JSON.parse(localStorage.getItem("user"))
        document.getElementById("nombre").innerHTML=JSON.parse(localStorage.getItem("user")).nombreCompleto
        document.getElementById("nombre2").innerHTML=JSON.parse(localStorage.getItem("user")).nombreCompleto
    }else{
        location.href="../login/index.html"
    }
}
function cerrarSesion() {
    localStorage.clear()
    location.href="../login/index.html"
}
async function listarPublicaciones() {
    let response = await fetch('assets/php/listarPublicaciones.php');
    response = await response.json();
    publicacionesDb=response
    dibujarPublicaciones(response)

}

function dibujarPublicaciones(publicaciones) {
    let publicacionesCard=``
    publicaciones.forEach(element => {
        publicacionesCard+=`
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
                <img src="../admin/php/${element.direccion_archivo}" class="img-fluid" alt="">
                <div class="portfolio-info">
                    <h4>${element.titulo}</h4>
                    <p>${element.texto}</p>
                    <a href="../admin/php/${element.direccion_archivo}" title="App 1" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                    <a style="display:none;" href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
                    <button class="reservaBtn">Reservar</button>
                </div>
            </div>  
        `
    });
    publicaciones=(publicacionesCard=="")?"<div class='col-md-12'><span>Sin publicacions.</span></div>":publicacionesCard
    document.getElementById("listarPublicaciones").innerHTML=publicaciones
    inicializar()
    
}

function inicializar() {
    document.querySelectorAll('.isotope-layout').forEach(function(isotopeItem) {
        let layout = isotopeItem.getAttribute('data-layout') ?? 'masonry';
        let filter = isotopeItem.getAttribute('data-default-filter') ?? '*';
        let sort = isotopeItem.getAttribute('data-sort') ?? 'original-order';
    
        let initIsotope;
        imagesLoaded(isotopeItem.querySelector('.isotope-container'), function() {
          initIsotope = new Isotope(isotopeItem.querySelector('.isotope-container'), {
            itemSelector: '.isotope-item',
            layoutMode: layout,
            filter: filter,
            sortBy: sort
          });
        });
    
        isotopeItem.querySelectorAll('.isotope-filters li').forEach(function(filters) {
          filters.addEventListener('click', function() {
            isotopeItem.querySelector('.isotope-filters .filter-active').classList.remove('filter-active');
            this.classList.add('filter-active');
            initIsotope.arrange({
              filter: this.getAttribute('data-filter')
            });
            if (typeof aosInit === 'function') {
              aosInit();
            }
          }, false);
        });
    
      });
}
async function traerPagos() {
    let response = await fetch('assets/php/listarPagos.php?id='+user.id);
    response = await response.json();
    console.log(response)
    pagos=response
    dibujarPagos(response)
}
function dibujarPagos(params) {
    let pagos=``
    params.forEach(element => {
        pagos+=`
            <div class="resume-item pb-0">
              <h4>${obtenerNombreMesIntl(element.mesPagoId)}</h4>
              <ul>
                <li>Monto $${element.monto}</li>
                <li>Periodo abonado</li>
                <li>Fecha de pago ${element.fechaPago}</li>
              </ul>
            </div><!-- Edn Resume Item -->`
    });
    pagos=(pagos=="")?"<div class='col-md-12'><h2 style='background: #3999dd;padding: 1%;border-radius: 5px;color: white;font-weight: bold;text-align: center;box-shadow: -1px 2px 1px 1px #0073c5;'>Sin pagos.</h2></div>":pagos
    document.getElementById("listarPagos").innerHTML=pagos
}

function obtenerNombreMesIntl(numeroMes) {
    return new Intl.DateTimeFormat('es', { month: 'long' }).format(new Date(`2023-${numeroMes}-01`));
}
function abrirModalPagar() {
    modalPago.show()
}