
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
        if (sesion.getAttribute("user") != null) {
         int  id = Integer.parseInt(request.getParameter("ID"));
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
        <body class="l">
          <div class="superiorr">
            <h3  class="hy" >
                    Productos
                    <div class="p">
                       <A  class="btn btn-success btn-block" href="/aut/Controlador?accion=cerrars" target="_top">
                        <img src='/aut/img/salida.png'width='40' height='40'/>Exit
                       </A>
                     </div>
                    <div class="p">
                       <a class="btn btn-success" href="/aut/Clientes/CRUD_P.jsp">
                        <img  alt="Responsive image"src="/aut/img/olu.png"width="40" height="40"/> Regresar</a>
                     </div>
            </h3></div>   
            <%
            if (id == 1) {
            %>
        <div class="muro">
                    <table class="table table-dark">
                        <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                    + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");



                        }
                        %>
                    </table></div>
                  <%
            }else if (id == 2) {
                  %> 
                      <div class="muro">
                    <table class="table table-dark">   
                         <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                     + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");



                        }
                        %>
                    </table></div>
                  <%
            }else if (id == 3) {
                  %> 
                      <div class="muro">
                    <table class="table table-dark">   
                         <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                   + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");



                        }
                        %>
                    </table></div>
                     <%
            }else if (id == 4) {
                  %> 
                      <div class="muro">
                    <table class="table table-dark">   
                        <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                 + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");


                        }
                        %>
                    </table></div>
                         <%
            }else if (id == 5) {
                  %> 
                      <div class="muro">
                    <table class="table table-dark">   
                         <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                    + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");



                        }
                        %>
                    </table></div>
                      <%
            }else if (id == 6) {
                  %> 
                      <div class="muro">
                    <table class="table table-dark">   
                         <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                     + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");



                        }
                        %>
                    </table></div>
                       <%
            }else if (id == 7) {
                  %> 
                      <div class="muro">
                    <table class="table table-dark">   
                         <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                    + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");



                        }
                        %>
                    </table></div>
                           <%
            }else if (id == 8) {
                  %> 
                      <div class="muro">
                    <table class="table table-dark">   
                       <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                    + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");



                        }
                        %>
                    </table></div>
                    <%
            }else if (id == 9) {
                  %> 
                      <div class="muro">
                    <table class="table table-dark">   
                         <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                     + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");



                        }
                        %>
                    </table></div>
                      <%
            }else if (id == 10) {
                  %> 
                      <div class="muro">
                    <table class="table table-dark">   
                         <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                   + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");



                        }
                        %>
                    </table></div>
                            <%
            }else if (id == 11) {
                  %> 
                      <div class="muro">
                    <table class="table table-dark">   
                         <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                     + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");



                        }
                        %>
                    </table></div>
                  <%
            }else if (id == 12) {
                  %> 
                      <div class="muro">
                    <table class="table table-dark">   
                       <% 
                         String parse = request.getParameter("ID");
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getproductos(parse);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h4 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h4></td><td>"
                                    + "<h3> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h3>"
                                    + "<h1 class='azul' align='center'>"+o.getPrecio()+"MXN</h1></td><td>"
                                    + "</tr>");



                        }
                        %>
                    </table></div>
                  <%
            }
                  %>
                    <%
          String POLLO= request.getParameter("pollo");
          String nom= request.getParameter("nom");
          if (POLLO == null) {
          %> 
      <div class="overlay" id="overlay">
      <div class="popup" id="popup">
          <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
      <h2 align="center">¡seleccione producto!</h2>
      <div >

      </div>
      <center><img  alt="Responsive image"src="/aut/img/falla.png"width="440" height="290"/></center>
      </div>
      </div>
      <%
          }       
      %>
       <div class="overlay" id="overlay">
      <div class="popup" id="popup">
          <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
      <h2 align="center">!Alerta¡</h2>
      <div >
            <form action="/aut/eliminar" method="post">
              <h5>Nombre<input type="text" readonly class="form-control-plaintext" value="<%out.println(nom);%>"></h5>
              <h5>Folio<input type="text" readonly class="form-control-plaintext" value="<%out.println(POLLO);%>"></h5>
            </form>
              <%

              out.println("<a class='btn  btn-danger btn-block 'href='/aut/eliminar?ID="+POLLO+"&NUM="+10001+"&ID2="+POLLO+"' >Eliminar</a>");

                          %>

      </div>

      </div>
      </div>

      <script src="/aut/JS/ventnas.js"></script>
        </body>

    </html>

    <%   } else {

            response.sendRedirect("/aut/Clientes/CRUD_P.jsp");
        }
    %>
