

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Entidades.empleado"%>
<%@page import="Backend.CRUD"%>
<%@page import="Entidades.usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Backend.Conexion"%>
<%@page import="Entidades.administrador"%>
<%@page session= 'true' %>
 <%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
    %>
   <%
    HttpSession sesion=request.getSession(true);
    administrador u=(administrador)sesion.getAttribute("user");
   
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

    
        <script  src="JS/validacion.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/ventana.css">
    <link href="CSS/diseño.css" rel="stylesheet" type="text/css" />
	<title>
		Login
	</title>
</head>
<body class="bod7">
<div align="center" class="fondo">
	<br>
<article alt="Responsive image" >
<div id="capsulas">
<br>
		<h3 align="center">ASCENDER ADMIN</h3>
		<h5 align="center">
			<img class="img-fluid" alt="Responsive image"src="img/for.jpg"width="145" height="145"/>
				<br><br>Verifica Datos<hr>
        <form action="EditarAdm" method="POST">
                    <br>
                    <img  alt="Responsive image"src="img/u.png"width="30" height="30"/>
                    <input class="text1" type="text"  value="<% u.getNombre(); %>"  name="nombre" />
                    <br>
                    <img  alt="Responsive image"src="img/ca.png"width="30" height="30"/>
                    <input class="text1"  type="text"  value="<% u.getContra(); %>"  name="contra"/><br>
                    <img  alt="Responsive image"src="img/co.png"width="30" height="30"/>
                    <input class="text1"  type="text"  value="<% u.getCorreo(); %>"  name="correo"/><br><hr></h5>
                    <center><button  class="btn btn-success btn-block" onclick="alert('Acenso Exitoso')"target='der' name="btn">enviar</button>
        </form>
                    <A  class="btn btn-link btn-block" href="usuarios.jsp" >cancelar</A></center>
                  
	</div>
</article>


</body>
</html>
<%   }else{

response.sendRedirect("index.jsp");}
%>