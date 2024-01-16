

<%@page import="Backend.CRUD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session= 'true' %>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);%>
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

    
        <script  src="JS/validacion.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/ventana.css">
    <link href="CSS/diseño.css" rel="stylesheet" type="text/css" />
	<title>
		Login
	</title>
</head>
<body class="login">
    <div class="centrar">
         <div class="party">
<div class="capsulas2">
<br>
		<h1 align="center">Aut-X</h1>
		<h5 align="center">Iniciar Sesión<hr>
        <form action="InicioSesion" method="POST">
                    <img  alt="Responsive image"src="img/u.png"width="30" height="30"/>
                    <input class="text1" type="text" placeholder="Usuario" required="required" name="NOMBRE" />
                    <br>
                    <br>
                     <img  alt="Responsive image"src="img/contrasena.png"width="30" height="30"/>
                     <input class="text1" type="password" placeholder="Contraseña" required="required" name="CONTRA" /><br><br>
            	<button type="submit"  class="btn btn-info btn-block" name="btn">Login</button>
        </form></h5>
                    <hr>
                    <p align="center">
        		<a href = "/aut/JSP/ValidarRegistro.jsp" class="btn btn-link"> Registrarse</a></p>
	</div>
</div>
    </div>
</body>
</html>
