
<%@page import="Entidades.Producto"%>
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
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%
    HttpSession sesion = request.getSession(true);
    usuarios u = (usuarios) sesion.getAttribute("user");
    Producto o = new Producto();
    if (sesion.getAttribute("user") != null) {


%>
<!DOCTYPE html>
<html>
    <head>
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

    </head>
    <body  class="l">
        <div class="Productos1">
            <h1 class="hy"align="center">Lista de productos<hr>
              <% 
                out.println(""
                + "<a href='/aut/Clientes/tablita.jsp?ID="+1+"'><img id='centro' alt='Responsive image'src='/aut/img/crema.jpg'></a>"
                +"<a href='/aut/Clientes/tablita.jsp?ID="+2+"' ><img  id='centro' alt='Responsive image'src='/aut/img/ver.jpg'></a>"
                +"<a href='/aut/Clientes/tablita.jsp?ID="+3+"' ><img id='centro' alt='Responsive image'src='/aut/img/chetoss.jpg'></a>"
                +"<a href='/aut/Clientes/tablita.jsp?ID="+4+"' ><img id='centro' alt='Responsive image'src='/aut/img/chile.jpg'></a><hr>"
                +"<a href='/aut/Clientes/tablita.jsp?ID="+5+"' ><img id='centro' alt='Responsive image'src='/aut/img/farma.jpg'></a>"
                +"<a href='/aut/Clientes/tablita.jsp?ID="+6+"'><img id='centro' alt='Responsive image'src='/aut/img/helado.webp'></a>"
                +"<a href='/aut/Clientes/tablita.jsp?ID="+7+"' ><img id='centro' alt='Responsive image'src='/aut/img/pan.jpg'></a>"
                +"<a href='/aut/Clientes/tablita.jsp?ID="+8+"' ><img id='centro' alt='Responsive image'src='/aut/img/limpe.jpg'></a><hr>"
                +"<a href='/aut/Clientes/tablita.jsp?ID="+9+"' ><img id='centro' alt='Responsive image'src='/aut/img/croqueta.webp'></a>"
                +"<a href='/aut/Clientes/tablita.jsp?ID="+10+"' ><img id='centro' alt='Responsive image'src='/aut/img/semi.jpg'></a>"
                +"<a href='/aut/Clientes/tablita.jsp?ID="+11+"' ><img id='centro' alt='Responsive image'src='/aut/img/refre.jpg'></a>"
                +"<a href='/aut/Clientes/tablita.jsp?ID="+12+"' ><img id='centro' alt='Responsive image'src='/aut/img/mas.png'></a>");
              %> 
        </h1></div>

        
            
              <div class="overlay" id="overlay">
            <div class="popup" id="popup">
                <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup"><img src="/aut/img/eli.png" width="30" height="30"><i class="fas fa-times"></i></a>
                <h2>Entrada de productos</h2><hr>
                <form action="/aut/Guardarproducto" method="post">
                    <div class="party">
                        <h6>Tipo de producto:</h6>
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
                          </select></div><br>
                        <input class="form-control" type="text"placeholder="Nombre" name="nombre"><br>
                    <div class="party">
                        <h6>Fecha de caducidad:</h6><br>
                        <input class="form-control" type="text"placeholder="dd" name="fecha">
                        <input class="form-control" type="text"placeholder="mm" name="fecha1">
                        <input class="form-control" type="text"placeholder="aa" name="fecha2">
                        </div><br>
                       <div class="party">
                           <h6>Producto o Kg:</h6><br>
                           <input class="form-control" type="text"placeholder="Cantidad" name="cant">
                            <input class="form-control" type="text"placeholder="$Precio$" name="prec"></div><br>
                        <input class="form-control" type="text"placeholder="Imagen Web" name="img"><br>
                <center><button type="submit"  class="btn btn-primary" name="btn">Aceptar</button></center>
               </form>
            </div>
        </div> 

        <script src="/aut/JS/ventnas.js"></script>
    </body>
</html>
<%   } else {

        response.sendRedirect("/aut/Clientes/CRUD_P.jsp");
    }
%>