
<%@page import="Backend.Conexion"%>
<%@page import="Entidades.empleado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.usuarios"%>
<%@page import="Backend.CRUD"%>
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
<html onLoad="redireccionar()" oncontextmenu="return false" >
         <script language="JavaScript">
  function redireccionar() {
    setTimeout("location.href='main.jsp'",  18000000);
  }
  </script>
 <head>
        <meta charset="UTF-8">
    
  	<title>
	  	Main
	  </title>

 </head>
    <frameset cols="25%,*" frameborder="no" bordercolor="  " marginwidth="0%" marginheight="0%" scrolling="no" >
      <frame src="/aut/Empleados/menu.jsp" name="izq"></frame>
      <frame src="/aut/Controlador?accion=home-empleado" name="der"></frame>
    </frameset>
</html>
<%   }else{

response.sendRedirect("/aut/index.jsp");}
%>