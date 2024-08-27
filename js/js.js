async function listarPublicaciones() {
    let response = await fetch('alumno/assets/php/listarPublicaciones.php');
    response = await response.json();
    console.log(response)
    dibujarPublicaciones(response)

}
listarPublicaciones()

function dibujarPublicaciones(publicaciones) {
    let publicacionesCard=``
    publicaciones.forEach(element => {
        publicacionesCard+=`
          <div class="col-sm-6 col-lg-4 wow fadeIn">
              <!-- Post Minimal-->
              <div class="post-minimal">
                <figure class="post-minimal-media"><a href="#"><img class="post-minimal-image" src="admin/php/${element.direccion_archivo}" alt="" width="370" height="260"/></a></figure>
                <div class="post-minimal-meta">
                  <ul class="list-inline">
                    <li class="list-inline-itema">${element.texto}</li>
                  </ul>
                </div>
                <h4 class="post-minimal-title"><a href="#">${element.titulo}</a></h4>
                <a style="background: #e9e9e9;" class="reservaBtn btn btn-block" href="https://wa.me/3718416724?text=Hola, me gustaria reservar este uniforme: ${element.titulo}">Reservar por whatsApp</a>

              </div>
            </div>
         
        `
    });
    publicaciones=(publicacionesCard=="")?"<div class='col-md-12'><span>Sin publicacions.</span></div>":publicacionesCard
    document.getElementById("listarTienda").innerHTML=publicaciones
    
}