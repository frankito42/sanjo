let user
let alumnos=[]
const modalAcciones = document.getElementById('modalAcciones')
const modalAccionesObjet = new mdb.Modal(modalAcciones)
const modalPagos = document.getElementById('nuevoPago')
const modalPagosObjet = new mdb.Modal(modalPagos)
const modalEditEstudiante = document.getElementById('modalEdit')
const modalEditEstudianteObjet = new mdb.Modal(modalEditEstudiante)
const modalHistorial = document.getElementById('modalHistorialDePagos')
const modalHistorialObjet = new mdb.Modal(modalHistorial)

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
    document.getElementById("search").addEventListener("keyup",async (e)=>{
        filtrarTabla()
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
    document.getElementById('formEditarEstudiante').addEventListener('submit', async (e) => {
        e.preventDefault(); // Evita que el formulario se envíe automáticamente
        let form=new FormData(document.getElementById('formEditarEstudiante'))
        form.append("id",localStorage.getItem("idAccion"))

        let response = await fetch('php/editar.php', {
            method: 'POST',
            body: form,
        });
        response = await response.json();

        if(response=="ok"){
            modalEditEstudianteObjet.hide()
            toastr.success("Edicion exitosa","Guardado")
            document.getElementById('formEditarEstudiante').reset()
            await listarAlumnos()
            await listarPagos()
        }else{
            alert("ocurrio un error.")
        }

        console.log("holi")
        
    });
    document.getElementById('formNewAlum').addEventListener('submit', async (e) => {
        e.preventDefault(); // Evita que el formulario se envíe automáticamente
        let form=new FormData(document.getElementById('formNewAlum'))

        let response = await fetch('php/nuevoAlumno.php', {
            method: 'POST',
            body: form,
        });
        response = await response.json();

        if(response=="ok"){
            document.getElementById("cerrarModalNew").click()
            document.getElementById('formNewAlum').reset()
            toastr.success("Nuevo alumno registrado","Guardado")
            await listarAlumnos()
            await listarPagos()
        }else{
            alert("ocurrio un error.")
        }

        console.log("holi")
        
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
    alumnos=response
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
    let mesesPagos=[]
    let elementoMeses=""
    pagos.forEach(element => {

        mesesPagos=(element.mesesPagados)?element.mesesPagados.split(","):[]
        mesesPagos=mesesPagos.sort()
        mesesPagos.forEach(element => {
            elementoMeses+=`<span class="badge rounded-pill badge-success">${obtenerNombreMesIntl(element)}</span>`
        })
        if(mesesPagos.length==0){
            elementoMeses+=`<span class="badge rounded-pill badge-danger">Sin pagos</span>`
        }
        tr+=`
        <tr onclick="abrirModalAcciones(${element.id},'${element.nombreCompleto}')">
            <td>${element.curso}</td>
            <td>
            ${element.nombreCompleto}
            <br>
            ${elementoMeses}
            </td>
            <td>${element.dni}</td>
        </tr>
        `
        mesesPagos=[]
        elementoMeses=""
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
    let valor
    if(response){
        valor=response.mesPagoId+1
    }else{
        valor=1
    }
    seleccionarOpcionPorValor(valor)
}

function seleccionarOpcionPorValor(valor) {
    const selectElement = document.getElementById('meseSelect'); // Reemplaza 'tu-select' con el ID de tu select
    for (let i = 0; i < selectElement.options.length; i++) {
        if (selectElement.options[i].value === valor.toString()) {
            selectElement.selectedIndex = i;
            break;
        }
    }
}

function filtrarTabla() {
    const input = document.getElementById("search").value.toUpperCase();
    const table = document.getElementById("tablaPagos");
    const rows = table.getElementsByTagName("tr");

    for (const row of rows) {
        let visible = false; // Suponemos inicialmente que la fila no es visible
        const cells = row.getElementsByTagName("td");

        for (const cell of cells) {
            if (cell.textContent.toUpperCase().includes(input)) {
                visible = true; // Si alguna celda coincide, marcamos la fila como visible
                break; // No es necesario seguir evaluando las demás celdas
            }
        }

        row.style.display = visible ? "" : "none"; // Mostrar u ocultar la fila
    }
}

function abrirModalAcciones(id,nombre) {
    localStorage.setItem("idAccion",id)
    document.getElementById("nombreXd").innerHTML=nombre
    modalAccionesObjet.show()
}


function abrirModalPagosSelectMes() {
    modalAccionesObjet.hide()
    setTimeout(async () => {
        modalPagosObjet.show()
        seleccionarOpcionPorValorUsuario()
        await traerUltimoPago(localStorage.getItem("idAccion"))
    }, 500);
}

function seleccionarOpcionPorValorUsuario() {
    let valor=localStorage.getItem("idAccion")
    const selectElement = document.getElementById('selecAlumno'); // Reemplaza 'tu-select' con el ID de tu select
    for (let i = 0; i < selectElement.options.length; i++) {
        if (selectElement.options[i].value === valor.toString()) {
            selectElement.selectedIndex = i;
            break;
        }
    }
}
function abrirModalEdit() {
    modalAccionesObjet.hide()
    let estu
    setTimeout(async () => {
        modalEditEstudianteObjet.show()
        estu=buscarEstudiantePorId(localStorage.getItem('idAccion'))
        document.getElementById('nombreEdit').value=estu.nombreCompleto;
        document.getElementById('dniEdit').value=estu.dni;
        document.getElementById('cursoEdit').value=estu.curso;
        document.getElementById('userEdit').value=estu.user;
        document.getElementById('passEdit').value=estu.pass;

    }, 500);
}
function abrirModalHistorial() {
    modalAccionesObjet.hide()
    let estu
    setTimeout(async () => {
        modalHistorialObjet.show()
        await historialPagosAlum(localStorage.getItem("idAccion"))

    }, 500);
}

function buscarEstudiantePorId(id) {
    const estudianteEncontrado = alumnos.find(estudiante => estudiante.id == id);
    console.log(alumnos)
    return estudianteEncontrado;
  }
async function historialPagosAlum(id) {
    let response = await fetch('php/historial.php?id='+id);
    response = await response.json();
    console.log(response)

    let tr=``

    response.forEach(element => {
        tr+=`
        <tr>
            <td>${element.fechaPago}</td>
            <td><span class="badge rounded-pill badge-success">${obtenerNombreMesIntl(element.mesPagoId)}</span></td>
            <td>$${formatearNumero(element.monto)}</td>
        </tr>
        `    
    });
    if(response.length==0){
        tr=`
        <tr class="text-center">
            <td colspan="3"><span class="badge rounded-pill badge-danger">Sin pagos</span></td>
        </tr>
        ` 
    }

    document.getElementById("historial").innerHTML=tr
}

function obtenerFechaFormateada(fecha) {
    const date = new Date(fecha);
    const mes = date.toLocaleString('default', { month: 'long' });
    const año = date.getFullYear();
    const hora = `${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}`;
    return `${mes} ${año} ${hora}`;
}
function formatearNumero(numero) {
    return new Intl.NumberFormat('es-AR').format(numero);
}