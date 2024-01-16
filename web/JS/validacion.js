
function nombre(){
    var nombre = document.formulario.NOMBRE.value;
    var error=document.getElementById("error");
    var nombreRGEX = /^[a-zA-ZáÁéÉíÍóÓúÚñÑüÜ]+$/;
    var nombre1 = nombreRGEX.test(nombre);
        if(nombre1=== false){
            alert('!solo letras');
            return false;
        }else if(nombre === ""){
            alert('!Nombre vacio');
            return false;
        }else if(nombre.length>15){
            alert('!Nombre muy largo');
            return false;
        }else if(nombre.length<2 ){
            alert('!Nombre corto');
            return false;
    
        }else{
            return true;
        }
}
function correo(){
    var correo=document.formulario.correo.value;
    if(correo === ""){
        alert('!Ingrese su correo');
        return false;
    }else if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.\n\,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(correo)){
        return true;
    }else {
       alert('!ingrese bien su correo');
  }
}
function passwords(){
    var pass = document.formulario.CONTRA.value;
    var pass1 = document.formulario.contra1.value;
    if (pass == "" && pass1 =="") {
        alert('! ingrese su passwords')
    }else if (pass !== pass1) {
        alert('! passwords diferentes')
}
}
function Validartodo(){
    if(!nombres() || 
       !correo()||
       !passwords()){
        
       nombre();
       correo();
       passwords();
       
       return false;
    }else{
        return true;
        alert('!Exitosa Actualización');
       //window.open("img/Intro Bienvenida.mp4", "Bienvenido", "width=1200, height=400");
    }
}