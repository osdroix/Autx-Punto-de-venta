
<%@page import="Entidades.usuarios"%>
<%@page import="Entidades.empleado"%>
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
    usuarios u=(usuarios)sesion.getAttribute("user");
   
    if (sesion.getAttribute("user")!=null){
       
      
%>
<!DOCTYPE html>
<html onLoad="redireccionar()" oncontextmenu="return false" >
         <script language="JavaScript">
  function redireccionar() {
    setTimeout("location.href='/aut/Clientes/main.jsp'",  18000000);
  }
  </script>
 <head>
        <meta charset="UTF-8">
    
  	<title>
	  	Main
	  </title>

 </head>
    <frameset cols="25%,*" frameborder="no" bordercolor="  " marginwidth="0%" marginheight="0%" scrolling="no" >
      <frame src="/aut/Clientes/menu.jsp" name="izq"></frame>
      <frame src="/aut/Clientes/CRUD_P.jsp" name="der"></frame>
    </frameset>
</html>
<%   }else{

response.sendRedirect("/aut/index.jsp");}
%>