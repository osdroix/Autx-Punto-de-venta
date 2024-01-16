<%-- 
    Document   : VistaTicket
    Created on : 14/05/2021, 03:24:03 PM
    Author     : Osdroix
--%>

<%@page import="Entidades.tiquet"%>
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
<%@page session= 'true' %>

<%
 HttpSession sesion=request.getSession(true);
    usuarios u=(usuarios)sesion.getAttribute("user");
    if (sesion.getAttribute("user")!=null){
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="expires" content="Wed, 01 Jan 1997 00:00:00 GMT">
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>  
        <script  src="JS/validacion.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/ventana.css">
    <link href="CSS/diseño.css" rel="stylesheet" type="text/css" />
        <title>
        		<%out.println(u.getUsuario());%>
    
        </title>
    </head>
    <body class="l">
                <div class="centrar-ticket">
                    <% 
                    
         int  id = Integer.parseInt(request.getParameter("id_tiquet"));
                    ArrayList<tiquet> us = new ArrayList();
                        us=CRUD.getBuscartiquetcarro(id);
                    for(tiquet o:us){%>
                                 

                           <div class="modelos-tiquet">
                               <div id="invoice">
                        <div align="center">
                                <h3 align="center">Aut-X</h3
                                <h6>" Ticket "</h6>
                       <br>-----------------------------------------------------------------<br> 
                         <label><%out.println(o.getFecha());%></label>
                        </div>
                                         <h4><%out.println(o.getUsuario());%></h4>
                                         <label>Folio:   <%out.println(o.getId_tiquet());%></label><br>
                                         <label><%out.println(o.getProducto());%></label><hr>
                                         <h6 align="right">$ <%out.println(o.getTotal());%> MXN</h6>
                                </div>
                                <div class="party">
                                    <div align="left">
                                        <a href="Clientes/Tiquet-vista.jsp" class="btn btn-danger">Regresar</a>
                                         <button class="btn btn-success" id="download">Descargar PDF</button> 
                                    </div>
                               
                                </div>
                                 </div> 
                    <%
                    }
                    %>
                     </div>
                </div>
    </body>
       <script>
        window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const invoice = this.document.getElementById("invoice");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 0,
                filename: 'tiquet.pdf',
               image:        { type: 'jpeg', quality: 1 },
        jsPDF:        { unit: 'in', format: 'a5', orientation: 'portrait' },
        html2canvas:  { scale: 6 },
        pagebreak: { mode: ['css', 'Arial'], after: '.breakme' }
                      };
            html2pdf().from(invoice).set(opt).save();
        })
}
 function closed() { 
       window.open('','_parent',''); 
       window.close(); 
    } 
    </script>
</html>
<%}else{
    response.sendRedirect("/aut");}
%>