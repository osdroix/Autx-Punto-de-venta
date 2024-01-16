

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
<body  class="l">
     <%
      String id= request.getParameter("ID");
      %>
    <div class="modelos-tiquet5">
                    <% 
                    ArrayList<proveedores> us = new ArrayList();
                    us=CRUD.getmostrarprovebq(id);
                    for(proveedores o:us){%>
                        <div >
                            <h3 align="center">Proveedor</h3><hr>
                        <form action="/aut/EDITARP" method="post" id="registroForm">
                            <label>Nombre Empresa</label>
                            <input class="form-control" type="text" readonly value="<%out.println(o.getNom_ep());%>" name="nom_empre_prove" required>
                            <input class="form-control" type="text" style="display: none;" value="<%out.println(o.getId_prove());%>" name="id" required>
                            <span id="nom_empre_proveMessage"></span>

                            <div>
                            <label>Nombre Proveedor</label>
                            <input class="form-control" type="text" value="<%out.println(o.getNom_p());%>" name="nom_prove" required>
                            <span id="nom_proveMessage"></span>                              
                            </div>
         
                            <div>
                                <label>Dirección Empresa</label>
                                <textarea class="form-control" type="text" value="<%out.println(o.getDirec_e());%>" name="direc_empre_prove" rows="2" required></textarea>
                                <span id="direc_empre_proveMessage"></span>
                            </div>
                                <br>
                            <div class="party">
                                <div>
                                    <input class="form-control" placeholder="Telefono" type="text" name="num_prove" id="tel" required>
                                    <span id="num_proveMessage"></span>
                                </div>
                                <div>
                                    <p class="btn btn-link" id="btn-abrir-popup">
                                        <img  alt="Responsive image"src="/aut/img/2.png"wi dth="30" height="30"/>
                                    </p>
                                </div>
                            </div>
                            <hr>
                            <button class="btn btn-success btn-block" type="submit" name="btn">Actualizar</button>
                        </form>
                            <center>
                                <A  class="btn btn-link" href="/aut/Administrador/prove.jsp" >cancelar</A>
                                 <%}%>
                            </center>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        const form = $('#registroForm');
        const nomEmpreProveInput = $('input[name="nom_empre_prove"]');
        const nomEmpreProveMessage = $('#nom_empre_proveMessage');
        const nomProveInput = $('input[name="nom_prove"]');
        const nomProveMessage = $('#nom_proveMessage');
        const direcEmpreProveInput = $('textarea[name="direc_empre_prove"]');
        const direcEmpreProveMessage = $('#direc_empre_proveMessage');
        const numProveInput = $('input[name="num_prove"]');
        const numProveMessage = $('#num_proveMessage');
        const submitButton = $('button[name="btn"]');
        const telefonoInput = $('#tel');
        const telefonoMessage = $('#num_proveMessage');

        // Desactivar el botón de envío inicialmente
        submitButton.prop('disabled', true);

        form.submit(function (event) {
            // Validar campos antes del envío
            validarCampo(nomEmpreProveInput, nomEmpreProveMessage);
            validarCampo(nomProveInput, nomProveMessage);
            validarCampo(direcEmpreProveInput, direcEmpreProveMessage);
            validarCampo(numProveInput, numProveMessage);

            // Desactivar el envío del formulario si hay algún campo inválido
            if (form.find('.error:visible').length > 0) {
                event.preventDefault();
            }
        });

        // Validación en tiempo real de los campos
        nomEmpreProveInput.on('input', function () {
            validarCampo(nomEmpreProveInput, nomEmpreProveMessage);
        });

        nomProveInput.on('input', function () {
            validarCampo(nomProveInput, nomProveMessage);
        });

        direcEmpreProveInput.on('input', function () {
            validarCampo(direcEmpreProveInput, direcEmpreProveMessage);
        });

        numProveInput.on('input', function () {
            validarCampo(numProveInput, numProveMessage);
        });

        telefonoInput.on('input', function () {
            validarTelefono();
        });

        // Función para validar un campo
        function validarCampo(input, message) {
            const valor = input.val().trim();
            if (valor === '') {
                message.text('Este campo es obligatorio.');
                message.removeClass('success').addClass('error');
            } else if (valor.length <= 4) {
                message.text('Este campo debe tener más de 4 caracteres.');
                message.removeClass('success').addClass('error');
            } else {
                message.text('Campo válido');
                message.removeClass('error').addClass('success');
            }

            // Validar formulario en su totalidad
            validarFormulario();
        }

        // Validar el campo de teléfono
        function validarTelefono() {
            const telefono = telefonoInput.val();
            const longitud = telefono.length;

            if (!/^\d{10}$/.test(telefono)) {
                telefonoMessage.text('El teléfono debe contener 10 dígitos numéricos.');
                telefonoMessage.removeClass('success').addClass('error');
            } else {
                telefonoMessage.text('Teléfono Válido');
                telefonoMessage.removeClass('error').addClass('success');
            }

            // Llamar a la función para validar el formulario
            validarFormulario();
        }

        // Función para validar el formulario en su totalidad
        function validarFormulario() {
            // Desactivar o activar el botón de envío según la validez del formulario
            submitButton.prop('disabled', form.find('.error:visible').length > 0);
        }
    });
</script>

<style>
    .error {
        color: red;
    }

    .success {
        color: green;
    }
</style>

                        </div>
 
    </div>
    <div class="overlay" id="overlay">
        <div class="popup" id="popup">
            <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
            <h2 align="center">
                Aut-X "Nombre Empresa"</h2><hr>
                <label>
                    Para garantizar la seguridad y 
                    la integridad de tus datos, el 
                    nombre de la empresa queda 
                    permanentemente registrado. 
                    Estamos 
                    trabajando en la implementación 
                    de herramientas adicionales para mejorar aún más el sistema próximamente.
                </label>
                </div>
            </div>
<script src="/aut/JS/ventnas.js"></script>
</body>
</html>
<%   }else{

response.sendRedirect("/aut/Administrador/empleados.jsp");}
%>