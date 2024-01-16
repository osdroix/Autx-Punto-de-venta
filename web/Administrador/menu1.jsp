
<%@page import="Entidades.empleado"%>
<%@page import="Backend.Conexion"%>
<%@page import="Entidades.administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
    %>
   <%
    HttpSession sesion=request.getSession(true);
    empleado u=(empleado)sesion.getAttribute("user");
   
    if (sesion.getAttribute("user")!=null){
       
      
%>
<!DOCTYPE html>
<html>
<head>
         <meta charset="UTF-8">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="expires" content="Wed, 01 Jan 1997 00:00:00 GMT">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="keywords" content="Art Sign Up Form Responsive Widget, 
              Audio and Video players, Login Form Web Template, Flat Pricing 
              Tables, Flat Drop-Downs, Sign-Up Web Templates, 
	Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone 
        Compatible Web Template, Free Web Designs for Nokia, Samsung, 
        LG, Sony Ericsson, Motorola Web Design"
    />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
         integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="/aut/CSS/ventana.css">
    <link href="/aut/CSS/diseño.css" rel="stylesheet" type="text/css" />
	<title>
		Main
	</title>
</head>
<body class="bodys"onLoad="redireccionar()" oncontextmenu="return false" >
         <script language="JavaScript">
  function redireccionar() {
    setTimeout("location.href='/aut/Administrador/menu1.jsp'", 18000000);
  }
  </script>
  <div class="main">
    <br>
    <h1 class="hy"align="center">
      Menú<br>
    </h1>
        <h4  align="center" class="hy">Administrador
      <hr>
      <img class="img-fluid" alt="Responsive image"src="/aut/img/ad.png"width="195" height="195"/></h4>
    <h3 align="center" class="hy"><%out.println(u.getUsuario());%></h3> 
      <h4 class="hy" align="center">
        <a class="hy" href = "/aut/Administrador/tiquet.jsp" target="der"  >Tiquet</a><br>
        <a class="hy" href = "/aut/Administrador/usuarios.jsp" target="der"> Usuarios</a><br>
        <a class="hy" href = "/aut/Administrador/reportes.jsp" target="der"> Reportes</a><br>
        <a class="hy" href = "/aut/JSP/CRUD_P.jsp" target="der" > Inventario</a><br>
        <a class="hy" href = "/aut/JSP/Horarios.jsp" target="der"  >Horarios</a><br>
        <hr>
      </h4>
      <h6 align="center" class="hy">
          
      <A  class="btn btn-success btn-block" href="/aut/cerrasesion" target="_top">Cerrar sesión</A><br>
    By Aut-X</h6>
    <!-- <h1 align="right"><A  class="btn btn-light" id="btn-abrir-popup">Chat</A></h1>-->
  </div>

  <div class="overlay" id="overlay">
  <div class="popup" id="popup">
  <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup"><img src="img/cerra.png" width="30" height="30"><i class="fas fa-times"></i></a>
  <h4><img  alt="Responsive image"src="/aut/img/me3.png"width="30" height="30"/>Chat </h4>
  <div>
  <br><br><br><br><br><br>
  <br><br><br><br><br><br><br>
  </div><hr>
  <div class="mensajes" align="center">
      <form action="enviar" method="POST">
                    <input class="text" type="text" placeholder="Mensaje" required="required" name="Mensaje" /><button type="submit" class="btn btn-link" onclick="" ><img  alt="Responsive image"src="img/me2.png"width="25" height="25"/></button>
        </form>
  </div>
  </div>
  <script src="/aut/JS/ventnas.js"></script>
  
</body>
</html>
<%   }else{

response.sendRedirect("/aut/index.jsp");}
%>
