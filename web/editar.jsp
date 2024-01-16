
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
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);%>

    
<%
 HttpSession sesion=request.getSession(true);
    empleado u=(empleado)sesion.getAttribute("user");
    if (sesion.getAttribute("user")!=null){
       
      
    CRUD i = new CRUD();
String usu=request.getParameter("Usu");
int id= Integer.parseInt(request.getParameter("Id"));
int tipo= Integer.parseInt(request.getParameter("Tipo"));
if (tipo == 3) { 
%>
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

    
        <script  src="JS/validacion.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/ventana.css">
    <link href="CSS/diseño.css" rel="stylesheet" type="text/css" />
    
	<title>
		<%out.println(u.getUsuario());%>
	</title>
</head>
<body >
    <div class="party">
    <div class="tabla">
                <table>
                    
                    <% 
                    
                    ArrayList<empleado> us = new ArrayList();
                    us=CRUD.getMostrardatos(usu);
                    for(empleado o:us){
                          
                    out.println("<tr><td><h1>"+o.getUsuario()+"</h1><h2>Datos Generales</h2>");
                          out.println("<tr><td>"
                                + "<h5>Nombre</h5>"
                                + "<h4><input class='form-control' readonly type='text'placeholder='"+o.getNombre()+" "+o.getApp()+" "+o.getApp2()+"' type='text'/>"
                                + "<h5>Correo</h5>"
                                + "<input class='form-control'readonly type='text'placeholder='"+o.getCorreo()+"' type='text'/>"
                                + "<h5>Telefono</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getTelefono()+"' type='text'/>"                                
                                + "<h5>Codigo Apostal</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getPostal()+"' type='text'/>"
                                + "<h5>Dirección</h5>"  
                                + "<textarea class='form-control' readonly type='text'placeholder='"+o.getDireccion()+"' type='text'></textarea></td>"
                                + "<td><img class='img-fluid' alt='Responsive image'src='/aut/img/js.gif'width='150' height='150'/></td><td>"
                                + "<h2>Datos Complementarios</h2>"
                                + "<h5>Fecha de contratación</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getFecha()+"' type='text'/><br>"
                                + "<h5>Edad</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getEdad()+"' type='text'/><br>"
                                + "</tr>");
                        
                        
                        
                    }
                    
                    
                    %>
                </table>
              
            </div>
        
<div class="capsulas">
    <h1 >
		Editar Datos Generales<hr>
                </h1> 
<% for(empleado o : us) { %>
<form action="editaradm" method="POST">
    <input type="hidden" value="<%= u.getUsu() %>" name="id" />
    <div class="form-group">
        <input class="form-control" value="<%= o.getNombre() %>" type="text" id="nom" name="nom" pattern="[A-Za-z]{3,}" title="Ingresa al menos 3 o más letras. Ejemplo: Luis." />
    </div>
    <div class="form-group">
        <input class="form-control" value="<%= o.getApp() %>" type="text" id="app" name="app" pattern="[A-Za-z]{3,}" title="Ingresa al menos 3 o más letras. Ejemplo: Quintero." />
    </div>
    <div class="form-group">
        <input class="form-control" value="<%= o.getApp2() %>" type="text" id="app2" name="app2" pattern="[A-Za-z]{3,}" title="Ingresa al menos 3 o más letras. Ejemplo: Hernandez." />
    </div>
    <div class="form-group">
        <input class="form-control"  placeholder="Teléfono" type="tel" id="tel" name="tel" pattern="[0-9]{10,}" maxlength="10" title="El teléfono debe contener 10 dígitos numéricos." />
        <span id="telefonoMessage" class="error"></span>
    </div>
    <div class="form-group">
        <input class="form-control"  placeholder="Edad" pattern="[0-9]+" type="text" id="edadInput" name="edad" maxlength="2" />
        <span id="edadMessage" class="error"></span>
    </div>
    <div class="form-group">
        <input class="form-control" readonly value="<%= o.getCorreo() %>" type="text" id="corre" name="corre" placeholder="Correo" />
    </div>
    <div class="form-group">
        <input class="form-control" readonly value="<%= o.getUsuario() %>" type="text" id="usu" name="usu" placeholder="Usuario" />
    </div>
                    <div class="party">
                        <div>
                            <input class="form-control" type="password" required placeholder="contraseña" name="contra" id="contraseñaInput">
                            <span id="contraseñaMessage" class="error"></span>
                        </div>
                        <div>
                            <button type="button" class="btn btn-light" id="togglePassword">Mostrar</button>
                        </div>
                        <div>
                            <p class="btn btn-link" id="btn-abrir-popup">
                                <img  alt="Responsive image"src="/aut/img/2.png"wi dth="30" height="30"/>
                            </p>
                        </div>
                    </div> 

    <div class="form-group">
        <center>
            <button class="btn btn-success" target="der" name="btn">Editar</button>
                    <A  class="btn btn-link btn-block" href="/aut/Administrador/mainadm.jsp" >Regresar</A></center>
        </center>
    </div>
</form>

<% } %>

	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        const form = $('#registroForm');
        const edadInput = $('#edadInput');
        const edadMessage = $('#edadMessage');
        const passwordInput = $('#contraseñaInput');
        const togglePassword = $('#togglePassword');
        const telefonoInput = $('#tel');
        const telefonoMessage = $('#telefonoMessage'); // Asegúrate de que este elemento exista en tu formulario.
        const submitButton = $('button[name="btn"]');

        // Desactivar el botón de envío inicialmente
        submitButton.prop('disabled', true);

        // Verificar el estado de los campos al cargar la página
        validarFormulario();

        form.submit(function (event) {
            // Validar la edad
            const edad = parseInt(edadInput.val(), 10);
            if (isNaN(edad) || edad < 18 || edad > 80) {
                edadMessage.text('La edad debe estar entre 18 y 80 años.');
                edadMessage.removeClass('success').addClass('error');
                // Mostrar mensaje de error
                event.preventDefault();
                mostrarMensajeError('Por favor, corrige los errores antes de enviar el formulario.');
            } else {
                // Llamar a la función para validar el formulario si la edad es válida
                validarFormulario();
            }
        });

        // Validación en tiempo real de la edad
        edadInput.on('input', function () {
            const edad = parseInt(edadInput.val(), 10);
            if (isNaN(edad) || edad < 18 || edad > 80) {
                edadMessage.text('La edad debe estar entre 18 y 80 años.');
                edadMessage.removeClass('success').addClass('error');
            } else {
                edadMessage.text('Edad Válida');
                edadMessage.removeClass('error').addClass('success');
            }

            // Llamar a la función para validar el formulario
            validarFormulario();
        });

        // Mostrar u ocultar la contraseña
        togglePassword.click(function () {
            passwordInput.attr('type', passwordInput.attr('type') === 'password' ? 'text' : 'password');
        });

        // Validación en tiempo real del número de teléfono
        telefonoInput.on('input', function () {
            const telefono = telefonoInput.val();
            const longitud = telefono.length;

            if (!/^\d{10}$/.test(telefono)) {
                telefonoMessage.text('El teléfono debe contener 10 dígitos numéricos.');
                telefonoMessage.removeClass('success').addClass('error');
            } else {
                telefonoMessage.text('Telefono Válido');
                telefonoMessage.removeClass('error').addClass('success');
            }

            // Llamar a la función para validar el formulario
            validarFormulario();
        });

        // Validación en tiempo real de la contraseña
        passwordInput.on('input', function () {
            var contraseña = passwordInput.val();
            var caracteresRestantes = Math.max(0, 4 - contraseña.length);
            var mensaje = caracteresRestantes > 0
                ? 'La contraseña debe tener al menos 4 caracteres. Faltan ' + caracteresRestantes + ' caracteres.'
                : 'Contraseña Válida';

            $('#contraseñaMessage').text(mensaje).toggleClass('error', caracteresRestantes > 0).toggleClass('success', caracteresRestantes === 0);

            // Llamar a la función para validar el formulario
            validarFormulario();
        });

        // Función para validar el formulario en su totalidad
        function validarFormulario() {
            var contraseñaValida = $('#contraseñaMessage').hasClass('success');
            var edadValida = !(isNaN(parseInt(edadInput.val(), 10)) || edadInput.val() < 18 || edadInput.val() > 80);
            var telefonoValido = telefonoMessage.hasClass('success');

            // Desactivar o activar el botón de envío según la validez del formulario
            submitButton.prop('disabled', !(contraseñaValida && edadValida && telefonoValido));

            // Mostrar mensaje "Registra tus datos" si todos los campos están vacíos
            if (!contraseñaValida && !edadValida && !telefonoValido && passwordInput.val().trim() === '' && edadInput.val().trim() === '' && telefonoInput.val().trim() === '') {
                mostrarMensajeError('Para garantizar la seguridad de tus datos, el botón se encuentra deshabilitado hasta que completes los campos correspondientes para la edición. Puedes modificar tu nombre, apellido, apellido materno, teléfono, edad y contraseña. El botón se habilitará únicamente si la información proporcionada es válida. Agradecemos tu comprensión y colaboración en mantener la integridad de tus datos.');
            }
        }

        // Función para mostrar mensajes de error
        function mostrarMensajeError(mensaje) {
            // Puedes implementar tu lógica para mostrar mensajes de error al usuario
            alert(mensaje);
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
    <div class="overlay" id="overlay">
        <div class="popup" id="popup">
            <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
            <h2 align="center">
                Aut-X "Correo - Usuario"</h2><hr>
                <label>
                    Para garantizar la seguridad y 
                    la integridad de tus datos, el 
                    correo y el usuario quedan 
                    permanentemente registrados. 
                    Por favor, cuídalos y asegúrate 
                    de no olvidarlos. Estamos 
                    trabajando en la implementación 
                    de herramientas adicionales para mejorar aún más el sistema próximamente.
                </label>
                </div>
            </div>
<script src="/aut/JS/ventnas.js"></script>
</body>
</html>
<%
} else if (tipo == 2) { 
%>
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

    
        <script  src="JS/validacion.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/ventana.css">
    <link href="CSS/diseño.css" rel="stylesheet" type="text/css" />
	<title>
		<%out.println(u.getUsuario());%>
	</title>
</head>
<body >
    <div class="party">
    <div class="tabla">
                <table>
                    
                    <% 
                    
                    ArrayList<empleado> us = new ArrayList();
                    us=CRUD.getMostrardatos(usu);
                    for(empleado o:us){
                          
                    out.println("<tr><td><h1>"+o.getUsuario()+"</h1><h2>Datos Generales</h2>");
                          out.println("<tr><td>"
                                + "<h5>Nombre</h5>"
                                + "<h4><input class='form-control' readonly type='text'placeholder='"+o.getNombre()+" "+o.getApp()+" "+o.getApp2()+"' type='text'/>"
                                + "<h5>Correo</h5>"
                                + "<input class='form-control'readonly type='text'placeholder='"+o.getCorreo()+"' type='text'/>"
                                + "<h5>Telefono</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getTelefono()+"' type='text'/>"                                
                                + "<h5>Codigo Apostal</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getPostal()+"' type='text'/>"
                                + "<h5>Dirección</h5>"  
                                + "<textarea class='form-control' readonly type='text'placeholder='"+o.getDireccion()+"' type='text'></textarea></td>"
                                + "<td><img class='img-fluid' alt='Responsive image'src='/aut/img/js.gif'width='150' height='150'/></td><td>"
                                + "<h2>Datos Complementarios</h2>"
                                + "<h5>Fecha de contratación</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getFecha()+"' type='text'/><br>"
                                + "<h5>Edad</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getEdad()+"' type='text'/><br>"
                                + "</tr>");
                    }       
                               %>
                </table>
              
            </div>
        
<div class="capsulas">
    <h1 >
		Editar Datos Generales<hr>
                </h1> 
<% for(empleado o : us) { %>
<form action="editaradm" method="POST">
    <input type="hidden" value="<%= u.getUsu() %>" name="id" />
    <div class="form-group">
        <input class="form-control" value="<%= o.getNombre() %>" type="text" id="nom" name="nom" pattern="[A-Za-z]{3,}" title="Ingresa al menos 3 o más letras. Ejemplo: Luis." />
    </div>
    <div class="form-group">
        <input class="form-control" value="<%= o.getApp() %>" type="text" id="app" name="app" pattern="[A-Za-z]{3,}" title="Ingresa al menos 3 o más letras. Ejemplo: Quintero." />
    </div>
    <div class="form-group">
        <input class="form-control" value="<%= o.getApp2() %>" type="text" id="app2" name="app2" pattern="[A-Za-z]{3,}" title="Ingresa al menos 3 o más letras. Ejemplo: Hernandez." />
    </div>
    <div class="form-group">
        <input class="form-control"  placeholder="Teléfono" type="tel" id="tel" name="tel" pattern="[0-9]{10,}" maxlength="10" title="El teléfono debe contener 10 dígitos numéricos." />
        <span id="telefonoMessage" class="error"></span>
    </div>
    <div class="form-group">
        <input class="form-control"  placeholder="Edad" pattern="[0-9]+" type="text" id="edadInput" name="edad" maxlength="2" />
        <span id="edadMessage" class="error"></span>
    </div>
    <div class="form-group">
        <input class="form-control" readonly value="<%= o.getCorreo() %>" type="text" id="corre" name="corre" placeholder="Correo" />
    </div>
    <div class="form-group">
        <input class="form-control" readonly value="<%= o.getUsuario() %>" type="text" id="usu" name="usu" placeholder="Usuario" />
    </div>
                    <div class="party">
                        <div>
                            <input class="form-control" type="password" required placeholder="contraseña" name="contra" id="contraseñaInput">
                            <span id="contraseñaMessage" class="error"></span>
                        </div>
                        <div>
                            <button type="button" class="btn btn-light" id="togglePassword">Mostrar</button>
                        </div>
                        <div>
                            <p class="btn btn-link" id="btn-abrir-popup">
                                <img  alt="Responsive image"src="/aut/img/2.png"wi dth="30" height="30"/>
                            </p>
                        </div>
                    </div> 

    <div class="form-group">
        <center>
            <button class="btn btn-success" target="der" name="btn">Editar</button>
            <a class="btn btn-link btn-block" href="/aut/Empleados/main.jsp">Regresar</a>
        </center>
    </div>
</form>

<% } %>

	</div>
</div>                  
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        const form = $('#registroForm');
        const edadInput = $('#edadInput');
        const edadMessage = $('#edadMessage');
        const passwordInput = $('#contraseñaInput');
        const togglePassword = $('#togglePassword');
        const telefonoInput = $('#tel');
        const telefonoMessage = $('#telefonoMessage'); // Asegúrate de que este elemento exista en tu formulario.
        const submitButton = $('button[name="btn"]');

        // Desactivar el botón de envío inicialmente
        submitButton.prop('disabled', true);

        // Verificar el estado de los campos al cargar la página
        validarFormulario();

        form.submit(function (event) {
            // Validar la edad
            const edad = parseInt(edadInput.val(), 10);
            if (isNaN(edad) || edad < 18 || edad > 80) {
                edadMessage.text('La edad debe estar entre 18 y 80 años.');
                edadMessage.removeClass('success').addClass('error');
                // Mostrar mensaje de error
                event.preventDefault();
                mostrarMensajeError('Por favor, corrige los errores antes de enviar el formulario.');
            } else {
                // Llamar a la función para validar el formulario si la edad es válida
                validarFormulario();
            }
        });

        // Validación en tiempo real de la edad
        edadInput.on('input', function () {
            const edad = parseInt(edadInput.val(), 10);
            if (isNaN(edad) || edad < 18 || edad > 80) {
                edadMessage.text('La edad debe estar entre 18 y 80 años.');
                edadMessage.removeClass('success').addClass('error');
            } else {
                edadMessage.text('Edad Válida');
                edadMessage.removeClass('error').addClass('success');
            }

            // Llamar a la función para validar el formulario
            validarFormulario();
        });

        // Mostrar u ocultar la contraseña
        togglePassword.click(function () {
            passwordInput.attr('type', passwordInput.attr('type') === 'password' ? 'text' : 'password');
        });

        // Validación en tiempo real del número de teléfono
        telefonoInput.on('input', function () {
            const telefono = telefonoInput.val();
            const longitud = telefono.length;

            if (!/^\d{10}$/.test(telefono)) {
                telefonoMessage.text('El teléfono debe contener 10 dígitos numéricos.');
                telefonoMessage.removeClass('success').addClass('error');
            } else {
                telefonoMessage.text('Telefono Válido');
                telefonoMessage.removeClass('error').addClass('success');
            }

            // Llamar a la función para validar el formulario
            validarFormulario();
        });

        // Validación en tiempo real de la contraseña
        passwordInput.on('input', function () {
            var contraseña = passwordInput.val();
            var caracteresRestantes = Math.max(0, 4 - contraseña.length);
            var mensaje = caracteresRestantes > 0
                ? 'La contraseña debe tener al menos 4 caracteres. Faltan ' + caracteresRestantes + ' caracteres.'
                : 'Contraseña Válida';

            $('#contraseñaMessage').text(mensaje).toggleClass('error', caracteresRestantes > 0).toggleClass('success', caracteresRestantes === 0);

            // Llamar a la función para validar el formulario
            validarFormulario();
        });

        // Función para validar el formulario en su totalidad
        function validarFormulario() {
            var contraseñaValida = $('#contraseñaMessage').hasClass('success');
            var edadValida = !(isNaN(parseInt(edadInput.val(), 10)) || edadInput.val() < 18 || edadInput.val() > 80);
            var telefonoValido = telefonoMessage.hasClass('success');

            // Desactivar o activar el botón de envío según la validez del formulario
            submitButton.prop('disabled', !(contraseñaValida && edadValida && telefonoValido));

            // Mostrar mensaje "Registra tus datos" si todos los campos están vacíos
            if (!contraseñaValida && !edadValida && !telefonoValido && passwordInput.val().trim() === '' && edadInput.val().trim() === '' && telefonoInput.val().trim() === '') {
                mostrarMensajeError('Para garantizar la seguridad de tus datos, el botón se encuentra deshabilitado hasta que completes los campos correspondientes para la edición. Puedes modificar tu nombre, apellido, apellido materno, teléfono, edad y contraseña. El botón se habilitará únicamente si la información proporcionada es válida. Agradecemos tu comprensión y colaboración en mantener la integridad de tus datos.');
            }
        }

        // Función para mostrar mensajes de error
        function mostrarMensajeError(mensaje) {
            // Puedes implementar tu lógica para mostrar mensajes de error al usuario
            alert(mensaje);
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
    <div class="overlay" id="overlay">
        <div class="popup" id="popup">
            <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
            <h2 align="center">
                Aut-X "Correo - Usuario"</h2><hr>
                <label>
                    Para garantizar la seguridad y 
                    la integridad de tus datos, el 
                    correo y el usuario quedan 
                    permanentemente registrados. 
                    Por favor, cuídalos y asegúrate 
                    de no olvidarlos. Estamos 
                    trabajando en la implementación 
                    de herramientas adicionales para mejorar aún más el sistema próximamente.
                </label>
                </div>
            </div>
<script src="/aut/JS/ventnas.js"></script>
</body>
</html>
<%
}
%>
<%   }else{

response.sendRedirect("/aut/");}
%>