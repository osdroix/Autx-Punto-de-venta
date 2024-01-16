<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>  
    <link rel="stylesheet" type="text/css" href="/aut/CSS/ventana.css">
    <link href="/aut/CSS/diseño.css" rel="stylesheet" type="text/css" />
	
</head>
<body class="l">
	<div class="superiorr">
	<h3  class="hy" >
		Compras
                
        </h3></div>

<div class="productos">  
    <p align="center"><div class="row" >
                    <% 
                    
                    ArrayList<tiquet> us = new ArrayList();
                        us=CRUD.getMostartiquetcarro(u.getRela());
                    for(tiquet o:us){%>
                                 <div id="invoice">

                           <div class="modelos-tiquet">
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
                                    <div align="right">  
                            <%out.print("<a class='btn btn-success' href='/aut/PDF.jsp?"
                                    + "id_tiquet="+o.getId_tiquet()+"'>GENERAR PDF</a>");%>

                                    </div>
                                </div> 
                                 </div>
                    <%
                    }
                    %>
                     </div>
                </p>
                </div>
  <script src="/aut/JS/ventnas.js"></script>
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
                filename: 'tiquet-cliente.pdf',
               image:        { type: 'jpeg', quality: 1 },
        jsPDF:        { unit: 'in', format: 'a5', orientation: 'portrait' },
        html2canvas:  { scale: 6 },
        pagebreak: { mode: ['css', 'Arial'], after: '.breakme' }
                      };
            html2pdf().from(invoice).set(opt).save();
        });
}
 function closed() { 
       window.open('','_parent',''); 
       window.close(); 
    } 
    </script>
</html>
<%   }else{

response.sendRedirect("/aut/Clientes/Tiquet-vista");}
%>