let user
   
document.addEventListener('DOMContentLoaded', async ()=>{
    // Tu código aquí
    comprobarSesion()
    document.getElementById("cerrarSesion").addEventListener("click",()=>{
        localStorage.clear()
        location.href="../login/php/logout.php"
    })
    document.getElementById("selecAlumno").addEventListener("change",async (e)=>{
        console.log(e.target.value)
       await traerUltimoPago(e.target.value)
    })
    /* SALUDA AL USUARIO */
    saludar()

    mesesSelect()
    /* LISTA TODAS LAS PUBLICACIONES */
    await listarAlumnos()
    await listarPagos()
    /* GUARDAR PUBLICACION */
   
  
    document.getElementById('formNuevoPago').addEventListener('submit', async (e) => {
        e.preventDefault(); // Evita que el formulario se envíe automáticamente
        await registrarPago()
        
    });



});
function comprobarSesion() {
    if(localStorage.getItem("user")){
        console.log("Hola! "+JSON.parse(localStorage.getItem("user")).nombreCompleto)
    }else{
        location.href="../login/index.html"
    }
}


function saludar() {
    user=JSON.parse(localStorage.getItem("user"))
    // Display a success toast, with a title
    toastr.info("Biendenido! "+`<span style="font-weight: bold;">${user.user}</span>`)
}

async function listarAlumnos() {
    let response = await fetch('php/listarAlumnos.php');
    response = await response.json();
    dibujarAlumnos(response)

}
async function listarPagos() {
    let response = await fetch('php/listarPagos.php');
    response = await response.json();
    dibujarPagos(response)

}


function dibujarAlumnos(alumnos) {
    let options=`<option value="" selected>Seleccionar alumno</option>`
    alumnos.forEach(element => {
        options+=`<option value="${element.id}">${element.nombreCompleto}</option>`
    });
    document.getElementById("selecAlumno").innerHTML=options
}

function mesesSelect() {
    let months = [
      "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
      "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
    ];
    let options=`<option value="" selected>Seleccionar mes</option>`
    options+= months.map((month, index) => `<option value="${index + 1}">${month}</option>`).join("");
    document.getElementById("meseSelect").innerHTML=options
  }
  function dibujarPagos(pagos) {
    let tr=``
    pagos.forEach(element => {
        tr+=`
        <tr>
            <td>${element.nombreCompleto}</td>
            <td>${element.fechaPago}</td>
            <td>$${element.monto}</td>
            <td><span class="badge badge-success rounded-pill d-inline">${obtenerNombreMesIntl(element.mesPagoId)}</span></td>
            <td>${element.metodoPago}</td>
        </tr>
        `
    });
    document.getElementById("tablaPagos").innerHTML=tr
}
function obtenerNombreMesIntl(numeroMes) {
    return new Intl.DateTimeFormat('es', { month: 'long' }).format(new Date(`2023-${numeroMes}-01`));
}
async function registrarPago() {
    document.getElementById("cerrarModal").click()
    let formData = new FormData(document.getElementById('formNuevoPago')); // Captura los datos del formulario  
    let response = await fetch('php/registrarPago.php', {
        method: 'POST',
        body: formData,
    });
    response = await response.json();
    if(response!="ok"){
        // Display an error toast, with a title
        toastr.error(response, 'Error!')
    
    }else{
        toastr.success("Se guardo el pago con exito.", 'Exito!')
        document.getElementById('formNuevoPago').reset()
        await listarPagos()

    }

}

async function traerUltimoPago(id) {
    let response = await fetch('php/ultimoPago.php?id='+id);
    response = await response.json();
    console.log(response)
}