

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Entidades.tiquet"%>
<%@page import="Entidades.proveedores"%>
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

<body>
	<div class="superiorr">
	<h3  class="hy" >
            Ventas
               <div class="p">
                   <A  class="btn btn-success btn-block" href="/aut/cerrasesion" target="_top">
                    <img src='/aut/img/salida.png'width='40' height='40'/> Salir
                   </A>
                 </div>
                <div class="p">
                    <A  class="btn btn-primary" href="/aut/Administrador/vo.jsp" >
                        Ventas Online
                    </A>
                 </div>
                <div class="p">
                 <button  class="btn btn-success" id='btn-abrir-popup'>Buscar Reporte</button></div>
        </h3></div>
              <%         
                  String p= request.getParameter("p");
                  System.out.print("Hola esta es tu fecha: "+p);
                  String pp= request.getParameter("pp");
                  System.out.print("Hola este es tu mm: "+pp);
                  if(p == null & pp == null){%>
                <br><center><h1>Reporte de Ventas Fisicas</h1></center><hr>
                <div class="party">
                    <div class="panel">
                        <table class="table">
                         <thead class="thead-dark">
                            <tr>
                                <th>Folio</th>
                                <th>Fecha</th>
                                <th>Productos</th>
                                <th>Total</th>
                            </tr>
                            <% 
                            LocalDate fecha = LocalDate.now();
                            ArrayList<tiquet> us = new ArrayList();
                            us = CRUD.getMostartiquetq(fecha.toString());
                            for (tiquet o : us) {
                            %>
                            <tr>
                                <td><%= o.getId_tiquet() %></td>
                                <td><%= o.getFecha() %></td>
                                <td><%= o.getProducto() %></td>
                                <td align="right">$ <%= o.getTotal() %> MXN</td>
                            </tr>
                            <%
                            }
                            %>
                        </table>
                    </div>
                    <div class="monto">
                        <center><h4>Ingresos Obtenidos</h4></center><hr>
                        <%
                            double sumaTotal = 0.0;
                            String fechah=" ";
                            for (tiquet o : us) {
                                sumaTotal += o.getTotal();
                                fechah = o.getFecha();
                                
                            }
                        %>
                        <h1 class="h4ñ">$ <%= sumaTotal %></h1>
                        <label style="display: block; text-align:right;">MXN</label>
                        <%
                            if(fecha.toString() != fechah){
                             %>
                             <center><h4 class="h4ñp">Ingresos en tiempo real</h4></center>                      
                            <% 
                            }else{
                            %>
                               <center><h4 class="h4ñp">Ingresos Obtenidos: <%= fechah %></h4></center>
                             <% 
                            }
                            %>
                    </div>
            </div> 
              <%
                  }if(p != null & pp == null){
                  System.out.print("Hola esta es tu fecha buscada"+p);
              %>
                <br><center><h1>Reporte de Ventas Fisicas</h1></center><hr>
                <div class="party">
                    <div class="panel">
                        <table class="table">
                         <thead class="thead-dark">
                            <tr>
                                <th>Folio</th>
                                <th>Fecha</th>
                                <th>Productos</th>
                                <th>Total</th>
                            </tr>
                            <% 
                            ArrayList<tiquet> us = new ArrayList();
                            us = CRUD.getMostartiquetq(p);
                            for (tiquet o : us) {
                            %>
                            <tr>
                                <td><%= o.getId_tiquet() %></td>
                                <td><%= o.getFecha() %></td>
                                <td><%= o.getProducto() %></td>
                                <td align="right">$ <%= o.getTotal() %> MXN</td>
                            </tr>
                            <%
                            }
                            %>
                        </table>
                    </div>
                    <div class="monto">
                        <center><h4>Ingresos Obtenidos</h4></center><hr>
                        <%
                            double sumaTotal = 0.0;
                            String fechah=" ";
                            for (tiquet o : us) {
                                sumaTotal += o.getTotal();
                                fechah = o.getFecha();
                                
                            }
                        %>
                        <h1 class="h4ñ">$ <%= sumaTotal %></h1>
                        <label style="display: block; text-align:right;">MXN</label>
                        <%
                            if(p == fechah){
                             %>
                             <center><h4 class="h4ñp">Ingresos en tiempo real</h4></center>                      
                            <% 
                            }else{
                            %>
                               <center><h4 class="h4ñp">Ingresos Obtenidos: <%= fechah %></h4></center>
                             <% 
                            }
                            %>
                    </div>
            </div>
              <%
                  }if(p == null & pp != null){
                  System.out.print("Hola esta es tu fecha buscada"+p);
              %>
                <br><center><h1>Reporte de Ventas Fisicas Mes</h1></center><hr>
                <div class="party">
                    <div class="panel">
                        <table class="table">
                         <thead class="thead-dark">
                            <tr>
                                <th>Folio</th>
                                <th>Fecha</th>
                                <th>Productos</th>
                                <th>Total</th>
                            </tr>
                            <% 
                            ArrayList<tiquet> us = new ArrayList();
                            us = CRUD.getMostartiquetqPorMes(pp);
                            for (tiquet o : us) {
                            %>
                            <tr>
                                <td><%= o.getId_tiquet() %></td>
                                <td><%= o.getFecha() %></td>
                                <td><%= o.getProducto() %></td>
                                <td align="right">$ <%= o.getTotal() %> MXN</td>
                            </tr>
                            <%
                            }
                            %>
                        </table>
                    </div>
                    <div class="monto">
                        <center><h4>Ingresos Obtenidos</h4></center><hr>
                        <%
                            double sumaTotal = 0.0;
                            for (tiquet o : us) {
                                sumaTotal += o.getTotal();
                                
                            }
                        %>
                        <h1 class="h4ñ">$ <%= sumaTotal %></h1>
                        <label style="display: block; text-align:right;">MXN</label>                     
                        <center><h4 class="h4ñp">Ingresos Obtenidos: <%=CRUD.obtenerNombreMes(Integer.parseInt(pp)) %></h4></center>
                    </div>
            </div>
              <%
                  }
              %>
<div class="overlay" id="overlay">
    <div class="popup" id="popup">
        <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
        <center>
        <h2 for="mes">Selecciona búsqueda</h2><hr>
        <select class="form-control" type="text" name="selec" id="selec">
            <option value="Dia">Día</option>
            <option value="Mes">Mes</option>
        </select>
        <br>
        <label>Buscar en:</label>
        <form id="searchForm" action="reportes.jsp" method="post">
            <!-- Primer select para días -->
            <select class="form-control select-options" type="text" name="p" id="selectDia">
                <% 
                    try {
                        Connection c = Conexion.getConnection();
                        String x = "SELECT DISTINCT Fecha_tiquet FROM tiquet";
                        PreparedStatement set1 = c.prepareStatement(x);
                        ResultSet rs = set1.executeQuery();
                        while (rs.next()) { %>
                            <option><%= rs.getString("Fecha_tiquet") %></option>
                        <% }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </select>

            <!-- Segundo select para meses (inicialmente oculto) -->
            <select class="form-control select-options" type="text" name="pp" id="selectMes" style="display: none;">
                <% 
                    try {
                        Connection cp = Conexion.getConnection();
                        String xp = "SELECT DISTINCT MONTH(Fecha_tiquet) AS mes_numero, MONTHNAME(Fecha_tiquet) AS nombre_mes FROM tiquet";
                        PreparedStatement set1p = cp.prepareStatement(xp);
                        ResultSet rsp = set1p.executeQuery();
                        while (rsp.next()) { 
                            int mesNumero = rsp.getInt("mes_numero");
                            String nombreMes = rsp.getString("nombre_mes");
                %>
                <option value="<%= mesNumero %>"><%=CRUD.obtenerNombreMes(mesNumero)  %></option>
                <%  }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
            <br>
            <button type="submit" class="btn btn-primary" id="buscarButton">Buscar</button>
        </form>
        </center>
    </div>
</div>

<script>
    function showSelectsBasedOnOption() {
        var selectDia = document.getElementById('selectDia');
        var selectMes = document.getElementById('selectMes');
        var selec = document.getElementById('selec');

        if (selec.value === 'Dia') {
            selectDia.value = '';
            selectDia.style.display = 'block';
            selectMes.style.display = 'none';
        } else if (selec.value === 'Mes') {
            selectMes.value = '';
            selectDia.style.display = 'none';
            selectMes.style.display = 'block';
        }
    }

    function resetFormFields() {
        var selectDia = document.getElementById('selectDia');
        var selectMes = document.getElementById('selectMes');

        selectDia.value = '';
        selectMes.value = '';
    }

    document.getElementById('selec').addEventListener('change', showSelectsBasedOnOption);

    document.getElementById('btn-cerrar-popup').addEventListener('click', function() {
        resetFormFields();
    });

    // Limpiar campos y mostrar el formulario al recargar la página
    window.addEventListener('load', function() {
        showSelectsBasedOnOption();
        resetFormFields();
    });
</script>



  <script src="/aut/JS/ventnas.js"></script>
  
</body>
</body>
</html>
<%   }else{

response.sendRedirect("/aut/Administrador/empleados.jsp");}
%>