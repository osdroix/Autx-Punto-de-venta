<%-- 
    Document   : pruebas
    Created on : 11/05/2021, 01:05:44 PM
    Author     : osdroix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
      String nom= request.getParameter("id");
      String contra= request.getParameter("productos");
      String corr= request.getParameter("total");%>
      <h1><%out.println(corr);%></h1>
      <h1><%out.println(contra);%></h1>
      <h1><%out.println(nom);%></h1>
    </body>
</html>
