
<%@page import="Entidades.empleado"%>
<%@page import="Entidades.administrador"%>
<%@page import="Backend.Conexion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Backend.CRUD"%>
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
    setTimeout("location.href='/aut/Administrador/mainadm.jsp'",  18000000);
  }
  </script>
 <head>
        <meta charset="UTF-8">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="expires" content="Wed, 01 Jan 1997 00:00:00 GMT">
  	<title>
	  	Main
	  </title>

 </head>
 
 
    <frameset cols="25%,*" frameborder="no" bordercolor="  " marginwidth="0%" marginheight="0%" scrolling="no"  >
      
      <frame src="/aut/Administrador/menu1.jsp" name="izq"></frame>
      <frame src="/aut/Administrador/usuarios.jsp" name="der"></frame>
    </frameset>
 
</html>
<%   }else{

response.sendRedirect("/aut/index.jsp");}
%>