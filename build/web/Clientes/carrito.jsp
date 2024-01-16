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

<%
 HttpSession sesion=request.getSession(true);
    usuarios u=(usuarios)sesion.getAttribute("user");
    if (sesion.getAttribute("user")!=null){
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="https://kit.fontawesome.com/f46ce87315.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            <link href="CSS/diseño.css" rel="stylesheet" type="text/css" />

    </head>
    <body >
        
         <div class="container mt-2">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand">Carrito Aut-X</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="Controlador?accion=home">Inicio<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="Controlador?accion=Carrito">
                        <i class="fas fa-cart-plus">(<label style="color: orange"> ${contador} </label>)</i>Carrito de compras</a>
                </li>
                </ul>
                </div>
            </nav>
        </div>
        
        <div class="container mt-4">
            <h3>Compras</h3>
            <br>
            <div class="row">
                <div class="col-sm-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="car" items="${carrito}">
                                <tr>
                                    <th>${car.getItem()}</th>
                                    <th>${car.getNombres()}</th>
                                    <th>
                                        <p><img src="${car.getDescripcion()}" width="70" height="65"></p>
                                       
                                    </th>
                                    <th>${car.getPrecioCompra()}</th>
                                    <th>${car.getCantidad()}</th>
                                    <th>${car.getSubTotal()}</th>
                                    <th>
                                        <input type ="hidden" id="idp" value="${car.getIdProducto()}">
                                        <a href="#" id="btnDelete">Eliminar</a>
                                    </th>
                                </tr>
                            </c:forEach>
                                
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <h3>Generar compra</h3>
                        </div>
                        <div class="card-body">
                            <label>Subtotal:</label>
                            <input type="text" value="$ ${total}" readonly="" class="form-control">
                            <label>Total:</label>
                            <input type="text" value="$ ${total}" readonly="" class="form-control">
                        </div>
                        <div class="card-footer">
                            <a href="Controlador?accion=IniciarCompra&producto=${carrito}&<% out.println("id="+u.getRela()+"");%>&total=${total}" class="btn btn-danger btn-block">Generar Compra</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="JS/recurso2.js" type="text/javascript"></script>
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
        window.location.href = "Controlador?accion=home";
    }
</script>                 
    </body>
</html>
<%}else{
    response.sendRedirect("/aut/");}
%>