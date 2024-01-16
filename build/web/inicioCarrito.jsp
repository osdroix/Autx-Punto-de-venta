<%@page import="Entidades.usuarios"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Entidades.Producto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%
    HttpSession sesion = request.getSession(true);
    usuarios u = (usuarios) sesion.getAttribute("user");
    if (sesion.getAttribute("user") != null) {
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <script src="https://kit.fontawesome.com/f46ce87315.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="CSS/diseño.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="container mt-2">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand">Carrito Aut-X</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
    <div class="row">
        <c:forEach var="p" items="${productos}">
            <c:if test="${p.num > 0}">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <label>${p.nombre}</label>
                        </div>
                        <div class="card-body">
                            <label>$ ${p.precio} MXN</label>
                        <label>Cant. ${p.getNum()} </label>
                        </div>
                        <div class="card-body">
                            <label>
                                <img src="${p.descripcion}" height="140" width="135">
                            </label>
                        </div>
                        <div class="card-footer text-center">
                            <div>
                                <a class="btn btn-outline-info" href="Controlador?accion=AgregarCarrito&id=${p.id}" class="hidden">Agregar al carrito</a>
                                <a class="btn btn-outline-danger" href="Controlador?accion=Comprar-cliente&id=${p.id}&cantidad=1">Comprar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
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
<%} else {
    response.sendRedirect("/aut/");
}%>
