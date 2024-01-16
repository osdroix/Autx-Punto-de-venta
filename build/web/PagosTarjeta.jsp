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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--libreria openpay.js-->
        <script type="text/javascript" src="https://js.openpay.mx/openpay.v1.min.js"></script>
<!--===============================================================================================-->

<!--Sistema antifraude openpay.js-->
        <script type="text/javascript"
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script type="text/javascript"
        src="https://js.openpay.mx/openpay.v1.min.js"></script>
        <script type='text/javascript'
        src="https://js.openpay.mx/openpay-data.v1.min.js"></script>
<!--===============================================================================================-->

<!--Sistema recurso1 openpay.js-->
        <script type="text/javascript" src="JS/recurso1.js"></script>
<!--===============================================================================================-->

<!--Diseño de formulario-->
<LINK REL=StyleSheet HREF="CSS/style.css" TYPE="text/css" MEDIA=screen>
<!--===============================================================================================-->

    </head>
    <body>
       <div class="bkng-tb-cntnt">
        <div class="pymnts">
            
            <form action="PasoPagar" method="POST" id="processCard" name="processCard">
                <input type="hidden" name="token_id" id="token_id">
                <div class="pymnt-itm card active">
                    <h2>Tarjeta de crédito o débito</h2>
                    <div class="pymnt-cntnt">
                        <div class="card-expl">
                            <div class="credit"><h4>Tarjetas de crédito</h4></div>
                            <div class="debit"><h4>Tarjetas de débito</h4></div>
                        </div>
                        <div class="sctn-row">
                            <div class="sctn-col l">
                                <label>Monto a pagar</label><input type="text" data-openpay-card="amount" value="${total}" disabled>
                            </div>
                        </div>
                        <div class="sctn-row">
                            <div class="sctn-col l">
                                <label>Nombre del titular</label><input type="text" placeholder="Como aparece en la tarjeta" autocomplete="off" data-openpay-card="holder_name">
                            </div>
                            <div class="sctn-col">
                                <label>Número de tarjeta</label><input type="text" autocomplete="off" data-openpay-card="card_number"></div>
                            </div>
                            <div class="sctn-row">
                                <div class="sctn-col l">
                                    <label>Fecha de expiración</label>
                                    <div class="sctn-col half l"><input type="text" placeholder="Mes" data-openpay-card="expiration_month"></div>
                                    <div class="sctn-col half l"><input type="text" placeholder="Año" data-openpay-card="expiration_year"></div>
                                </div>
                                <div class="sctn-col cvv"><label>Código de seguridad</label>
                                    <div class="sctn-col half l"><input type="text" placeholder="3 dígitos" autocomplete="off" data-openpay-card="cvv2"></div>
                                </div>
                            </div>
                            <div class="openpay"><div class="logo">Transacciones realizadas vía:</div>
                            <div class="shield">Tus pagos se realizan de forma segura con encriptación de 256 bits</div>
                        </div>
                        <div class="sctn-row">
                                <a class="button rght" id="makeRequestCard" name="makeRequestCard">Pagar</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    </body>
</html>
<%}else{
    response.sendRedirect("/aut/");}
%>