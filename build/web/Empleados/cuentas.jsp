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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session= 'true' %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!DOCTYPE html>
    <%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    %>
    <%
        HttpSession sesion = request.getSession(true);
        empleado u = (empleado) sesion.getAttribute("user");
        if (sesion.getAttribute("user") != null) {
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/f46ce87315.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/diseño.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand">Cuentas</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="Controlador?accion=home-empleado">Inicio<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="Controlador?accion=Carrito-empleado">
                       (<label style="color: blue"> ${contador} </label>)Lista de productos</a>
                </li>
                <li>
                   <form action="Controlador?accion=Buscar" method="POST">
                       <div class="party">
                     <select class="form-control" type="text" name="id_tipo">
                                    <option value="1">Cremeria</option>
                                    <option value="2">Verduras</option>
                                    <option value="3">Frituras Y Dulces</option>
                                    <option value="4">Chiles</option>
                                    <option value="5">Farmacia</option>
                                    <option value="6">Heladeria</option>
                                    <option value="7">Expendio de pan</option>
                                    <option value="8">Limpieza</option>
                                    <option value="9">Alimento de mascota</option>
                                    <option value="10">Semillas</option>
                                    <option value="11">Refrescos</option>
                                    <option value="12">otros</option>
                          </select>
                              <button type="submit"class="btn btn-link" onclick="" ><img  alt="Responsive image"src="/aut/img/lup.png"width="30" height="30"/></button>
                  </form>
                    </div>
                </li>
                
                <li class="nav-item active">
                    <h3 align="left" ><%out.println(u.getUsuario());%></h3>
                </li>
                </ul>
                </div>
            </nav>
                <div class="productos">       
    <p align="center">
        <div class="row">
            <c:forEach var="p" items="${productos}">
                <c:if test="${p.getNum() > 0}">
                    <div class="modelos">
                        <label>${p.getNombre()}</label>
                        <img src="${p.getDescripcion()}" height="150" width="150">
                        <label>$ ${p.getPrecio()} MXN</label>
                        <label>Cant. ${p.getNum()} </label>
                        <div class="align">
                            <a class="btn btn-primary" href="Controlador?accion=AgregarCarrito-empleado&id=${p.getId()}" class="hidden">Agregar</a>
                            <a class="btn btn-info" href="Controlador?accion=Comprar-empleado&id=${p.getId()}&cantidad=1"">Vender</a>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </p>
</div>

                
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                       <script>
    // Obtener el mensaje y el tipo de mensaje desde el servidor
    var mensaje = "<%= request.getAttribute("mensaje") %>";
    var tipoMensaje = "<%= request.getAttribute("tipoMensaje") %>";

    if (mensaje !== "null" && tipoMensaje !== "null") {
        // Mostrar la alerta utilizando JavaScript
        alert(mensaje);

        // Puedes personalizar la apariencia de la alerta según el tipo de mensaje
        if (tipoMensaje === "error") {
            // Personalizar la alerta para mensajes de error
            // Puedes, por ejemplo, cambiar el color o el estilo
            // Aquí puedes agregar código adicional para manejar la alerta de error
        }

        // Redireccionar de nuevo a la página principal o a donde desees
        window.location.href = "Controlador?accion=home-empleado";
    }
</script>                 

    </body>
</html>
   <%   } else {

            response.sendRedirect("/aut/Empleados/CRUD_P.jsp");
        }
    %>

