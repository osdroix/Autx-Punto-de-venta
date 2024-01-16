

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
<%@page import="Entidades.empleado"%>
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
	<div class="superiorr">
	<h3  class="hy" >
		Empleados
               <div class="p">
                   <A  class="btn btn-success btn-block" href="/aut/cerrasesion" target="_top">
                    <img src='/aut/img/salida.png'width='40' height='40'/>Exit
                   </A>
                 </div>
                <div class="p">
                   <button class="btn btn-success" id="btn-abrir-popup">
                    <img  alt="Responsive image"src="/aut/img/olu.png"width="40" height="40"/> Perfil</button>
                 </div>
                <div class="p">
                 <button  class="btn btn-success" id='btn-abrir-popups'>
                     <img src='/aut/img/basura3.png'width='40' height='40'/>Borrar</button></div>
        </h3></div>
                 <h4  class="hy"align="center"><div class="menu">
                         <br><br>
                    <A  class="btn btn-link btn-block" href="/aut/Administrador/usuarios.jsp" >
                        <img  alt="Responsive image"src="/aut/img/u.png"width="80" height="80"/></A>
                        Clientes<hr>
                    <A  class="btn btn-link btn-block" href="/aut/Administrador/empleados.jsp" >
                        <img  alt="Responsive image"src="/aut/img/em.png"width="80" height="80"/></A>
                        Empleados<hr>
                    <A  class="btn btn-link btn-block" href="/aut/Administrador/prove.jsp" >
                        <img  alt="Responsive image"src="https://cdn-icons-png.flaticon.com/512/2103/2103848.png"width="80" height="80"/></A>
                        Proveedores<hr>
                    <A  class="btn btn-link btn-block" href="/aut/JSP/formulario-emple.jsp" ><img  alt="Responsive image"src="/aut/img/us.png"width="80" height="80"/>
                        </A>Formularios
                        <hr><br>
                     </div></h4>
    <div class="muro">
               <p align="center"><div class="row" >
                    
                    <% 
                    ArrayList<empleado> us = new ArrayList();
                    us=CRUD.getEmp();
                    for(empleado o:us){%>
                         <div class="modelos-tiquet-adm">
                        <div align="center">
                            <h3 align="center">Aut-X</h3><hr>
                            <h5>Usuario: <%out.println(o.getUsuario());%><br>
                                        </h5>
                        </div>
                            <h6> Nombre: <%out.println(o.getNombre());%><br>
                                 Correo: <%out.println(o.getCorreo());%><br>
                                 Fecha de contratación: <%out.println(o.getFecha());%><br>
                                 Telefono: <%out.println(o.getTelefono());%><br>
                                 Dirección: <%out.println(o.getDireccion());%><br>
                                 Codigo Postal: <%out.println(o.getPostal());%><br></h6>
                             <div align="right"> 
                                         <%
                                         out.println("<a class='btn btn-danger' href='/aut/Administrador/empleados.jsp?ID="+o.getUsu()+"&NUM="+o.getTipo()+"&nom="+o.getNombre()+"&contra="+o.getContra()+"&corr="+o.getCorreo()+"'>Seleccionar</a>");%>
                                        </div> </div>
                        
                        
                   <% 
                                                 }
                    
                    
                    %>
                </div>
            </div>
                
    <div class="overlay" id="overlay">
  <div class="popup" id="popup">

      <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
  <h2 align="center">Administrador</h2>
  <div >
                <h5>Nombre<input type="text" readonly class="form-control-plaintext" placeholder="<%out.println(u.getUsuario());%>">
          Contraseña
          <input type="text" readonly class="form-control-plaintext" placeholder="<%out.println(u.getContra());%>"></h5>
            <% 
            out.println("<a class='btn btn-success btn-block' TARGET='_top' href='/aut/editar.jsp?Usu="+u.getUsuario()+"&Id="+u.getUsu()+"&Tipo="+u.getTipo()+"'>Perfil</a>");
            %>
          
  </div>

  </div>
  </div>
            <%
      String nom= request.getParameter("nom");
      String contra= request.getParameter("contra");
      String corr= request.getParameter("corr");
      String POLLO= request.getParameter("NUM");
      String id= request.getParameter("ID");
      if (POLLO == null) {
      %> 
  <div class="overlay" id="overlays">
  <div class="popup" id="popups">
      <a href="#" id="btn-cerrar-popups" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
  <h2 align="center">¡seleccione usuario!</h2>
  <div >
          
  </div>
  <center><img  alt="Responsive image"src="/aut/img/falla.png"width="440" height="290"/></center>
  </div>
  </div>
  <%
      }else{       
  %>
   <div class="overlay" id="overlays">
  <div class="popup" id="popups">
      <a href="#" id="btn-cerrar-popups" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
  <h2 align="center">!Alerta¡</h2>
  <div >
             <form action="/aut/eliminar" method="post">
          <h5>Nombre<input type="text" readonly class="form-control-plaintext" value="<%out.println(nom);%>">
          Contraseña
          <input type="text" readonly class="form-control-plaintext" placeholder="<%out.println(contra);%>">
          Correo
          <input type="text" readonly class="form-control-plaintext"placeholder="<%out.println(corr);%>"></h5>
        
            
            </form>
          <%
      
          out.println("<a class='btn  btn-danger btn-block 'href='/aut/eliminar?ID="+id+"&ID2="+id+"&NUM="+POLLO+"' >Eliminar</a>");
          
                      %>
              
  </div>

  </div>
  </div>
  <%
      }
  %>
     

  <script src="/aut/JS/ventnas.js"></script>
</body>
</body>
</html>
<%   }else{

response.sendRedirect("/aut/Administrador/empleados.jsp");}
%>