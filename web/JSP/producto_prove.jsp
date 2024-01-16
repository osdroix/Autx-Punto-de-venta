
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
        empleado u = (empleado) sesion.getAttribute("user");
        if (sesion.getAttribute("user") != null) {
          String id_prove= request.getParameter("id_prove");
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
                    
                <%out.print(id_prove); %>
                    <div class="p">
                       <A  class="btn btn-success btn-block" href="/aut/cerrasesion" target="_top">
                        <img src='/aut/img/salida.png'width='40' height='40'/>Exit
                       </A>
                     </div>
                    <div class="p">
                       <a class="btn btn-success" href="/aut/JSP/CRUD_P.jsp">
                        <img  alt="Responsive image"src="/aut/img/olu.png"width="40" height="40"/> Regresar</a>
                     </div>
            </h3></div>   
        <div class="muro">  
            
               <p align="center"><div class="row" >
                    
                    <% 
                    ArrayList<Producto> us = new ArrayList();
                    us=CRUD.getMostarPRODUCTOCONPROVEEDORP(id_prove);
                    for(Producto o:us){%>
                         <div class="modelos-tiquet-adm">
                        <div align="center">
                            <h3 align="center">Aut-X</h3><hr>
                            <h5>
                                <img src='<%= o.getDescripcion() %>' width='150' height='150'>
                                <br>
                            </h5>

                        </div>
                            <h6 align="center"> 
                                 <%out.println(o.getNombre());%><hr>
                                Cant/KG: <%out.println(o.getNum_cantidad());%><br>
                                 Caducidad: <%out.println(o.getFecha());%><br>
                                 Precio: <%out.println(o.getPrecio());%><br>
                            </h6>
                         </div>
                        
                        
                   <% 
                                                 }
                    
                    
                    %>
        </div>
                   
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

            response.sendRedirect("/aut/Administrador/usuarios.jsp");
        }
    %>
