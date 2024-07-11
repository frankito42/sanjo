document.addEventListener("DOMContentLoaded", function(event) {
    // Your code to run since DOM is loaded and ready
    comprobarSesion()
    document.getElementById("cerrarSesion").addEventListener("click",()=>{
        cerrarSesion()
    })
});
function comprobarSesion() {
    if(localStorage.getItem("user")){
        console.log("Hola! "+JSON.parse(localStorage.getItem("user")).nombreCompleto)
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