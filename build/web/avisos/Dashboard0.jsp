<%-- 
    Document   : Dashboard
    Created on : 19/05/2019, 07:08:36 PM
    Author     : Aaron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int num = Integer.parseInt(request.getParameter("id"));
    if(num == 2){
%>
<html>
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
        <title>Mensaje</title>
    </head>
    <body class="bod7" >
        <div align="center">
      <div  class="ya">
            <div class="we">
            <h1 align="center" ><%out.println(request.getParameter("in"));%><br><hr>
        <img src="<%out.println(request.getParameter("img"));%>" width="200" height="200"/></h1><br>
        <h3 align="center"><%out.println(request.getParameter("error"));%>
        <hr>
        <a href = "/aut/Administrador/empleados.jsp" class="btn btn-link">lista Empleados</a>
        <a href = "/aut/JSP/formulario-emple.jsp" class="btn btn-success"> Formulario</a></h3>
      </div>
     </div>
        </div>
    </body>
</html>
<%
    }else if(num == 3){
%>
<html>
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
        <title>Mensaje</title>
    </head>
    <body class="bod7" >
        <div align="center">
      <div  class="ya">
            <div class="we">
            <h1 align="center" ><%out.println(request.getParameter("in"));%><br><hr>
        <img src="<%out.println(request.getParameter("img"));%>" width="200" height="200"/></h1><br>
        <h3 align="center"><%out.println(request.getParameter("error"));%>
        <hr>
        <a href = "/aut/Super-Admin/administradores.jsp" class="btn btn-link">lista Administradores</a>
        <a href = "/aut/JSP/formulario-admin.jsp" class="btn btn-success"> Formulario</a></h3>
      </div>
     </div>
        </div>
    </body>
</html>
<%
    }
%>
