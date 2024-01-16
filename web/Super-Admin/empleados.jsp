

<%@page import="Entidades.superadmin"%>
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
                 <button  class="btn btn-success" id='btn-abrir-popup'>
                     <img src='/aut/img/basura3.png'width='40' height='40'/>Borrar</button></div>
        </h3></div>
                 <h4  class="hy"align="center"><div class="menu">
                         <br><br>
                    <A  class="btn btn-link btn-block" href="/aut/Super-Admin/usuarios.jsp" >
                        <img  alt="Responsive image"src="/aut/img/u.png"width="80" height="80"/></A>
                        Usuarios<hr>
                    <A  class="btn btn-link btn-block" href="/aut/Super-Admin/empleados.jsp" >
                        <img  alt="Responsive image"src="/aut/img/em.png"width="80" height="80"/></A>
                        Empleados<hr>
                    <A  class="btn btn-link btn-block" href="/aut/Super-Admin/administradores.jsp" ><img  alt="Responsive image"src="/aut/img/ad.png"width="80" height="80"/>
                        </A>Administradores
                        <hr><br>
                     </div></h4>
      <div class="muro">
                <table class="table table-dark">
                    
                     <% 
                    
                    ArrayList<empleado> us = new ArrayList();
                    us=CRUD.getEmp();
                        out.println("<tr><td><h4 class='hy'>Datos Empleados"
                                  + "<td><h4 class='hy'>Selecionar para dar de baja</tr>");
                    for(empleado o:us){
                      
                          out.println("<tr><td>"
                                + "<h5>Usuario:"+o.getUsuario()+"<br>"
                                + "Nombre: "+o.getNombre()+"<br>"
                                + "correo:"+o.getCorreo()+"<br> "
                                + "Fecha/contratación:"+o.getFecha()+"<br> "
                                + "Telefono: "+o.getTelefono()+"<br>"
                                + "Domicilio:"+o.getDireccion()+"<br>"
                                + "Codigo Apostal: "+o.getPostal()+"<br></td><td>"
                                + "<a href='/aut/Super-Admin/empleados.jsp?ID="+o.getUsu()+"&NUM="+78+"&nom="+o.getNombre()+"&contra="+o.getContra()+"&corr="+o.getCorreo()+"'><img  alt='Responsive image'src='/aut/img/basura1.png'width='80' height='80'/></a></td><td>"
                                + "</tr>");
                        
                        
                        
                    }
                    
                    
                    %>
                </table>
              
            </div>
            <%
      String nom= request.getParameter("nom");
      String contra= request.getParameter("contra");
      String corr= request.getParameter("corr");
      String POLLO= request.getParameter("NUM");
      String id= request.getParameter("ID");
      if (POLLO == null) {
      %> 
  <div class="overlay" id="overlay">
  <div class="popup" id="popup">
      <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
  <h2 align="center">¡seleccione usuario!</h2>
  <div >
          
  </div>
  <center><img  alt="Responsive image"src="/aut/img/falla.png"width="440" height="290"/></center>
  </div>
  </div>
  <%
      }else{       
  %>
   <div class="overlay" id="overlay">
  <div class="popup" id="popup">
      <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
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

response.sendRedirect("/aut/index.jsp");}
%>