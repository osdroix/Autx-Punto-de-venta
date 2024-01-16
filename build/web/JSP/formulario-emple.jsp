
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Aut-X</title>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <link href="/aut/CSS/diseño.css" rel="stylesheet" type="text/css" />
    </head>
    <body class="bod7">
        <div  class="Muro-registro-emple">
            <div class="party">
            <div class="submuro-registro-emple">
                    <h5>Registro<br> Datos Generales</h5><hr>
                    <form action="/aut/GuardarEmple" method="post">
                                        <input type="hidden" value="2" name="id"/>
                                        <input type="hidden" value="2" name="base"/>
                                        <!-- Nombre -->
                                        <input class="form-control" type="text" pattern="[A-Za-z]+" required placeholder="Nombre" name="nombre" id="nombre">
                                        <span id="nombreMessage" class="error"></span><br>
                                        <input class="form-control" type="text" placeholder="Segundo_Nombre(Opcional)" name="nombre2"><br>
                                         <!-- Apellido Paterno -->
                                        <input class="form-control" type="text" pattern="[A-Za-z]+" required placeholder="Apellido Paterno" name="app" id="app">
                                        <span id="appMessage" class="error"></span><br>
                                        <!-- Apellido Materno -->
                                        <input class="form-control" type="text" pattern="[A-Za-z]+" required placeholder="Apellido Materno" name="app2" id="app2">
                                        <span id="app2Message" class="error"></span><br>
                                        <div>
                                            <input class="form-control" type="text" required placeholder="Correo" name="correo" id="correoInput">
                                            <span id="correoMessage" class="error"></span><br>
                                        </div>
                                    <div class="party">
                                            <div class="form-group">
                                                <input class="form-control"  placeholder="Edad" pattern="[0-9]+" type="text" id="edadInput" name="edad" maxlength="2" />
                                                <span id="edadMessage" class="error"></span>
                                            </div>
                                        <select class="form-control" type="text" required placeholder="Sexo" name="sexo">
                                                        <option value="M">M</option>
                                                        <option value="F">F</option>
                                                        <option value="Otros">otros</option>
                                        </select>
                                    </div><br> 
                                    <center><a type="submit" class="btn btn-warning" href="/aut/Administrador/usuarios.jsp" >Regresar</a></center>
                                </div>
                                <div class="submuro-registro-emple">
                                    <h4>Fecha de contratación</h4><hr>
                                    <div class="party">
                                        <select class="form-control" required name="1" id="day">
                                            <option value="" disabled selected>Día</option>
                                            <!-- Opciones para los días -->
                                        </select>
                                        <select class="form-control" required name="2" id="month">
                                            <option  value="" disabled selected>Mes</option>
                                            <!-- Opciones para los meses -->
                                        </select>
                                        <select class="form-control" required name="3" id="year">
                                            <option value="" disabled selected>Año</option>
                                            <!-- Opciones para los años desde 1950 hasta el año actual -->
                                        </select>
                                    </div>
                                    <span id="fechaContratacionMessage" class="error"></span><br>
                                        <div>
                                        <textarea class="form-control" type="text" placeholder="Dirección" name="dire" id="dire" rows="2" required></textarea>
                                        <span id="direMessage" class="error"></span><br>
                                    </div>
                                      <input class="form-control" type="text" pattern="[0-9]+" required placeholder="Codigo Postal" maxlength="5" name="cod" id="cod">
                                      <span id="codMessage" class="error"></span><br>
                                    <div>
                                        <input class="form-control" placeholder="Telefono" type="text" pattern="[0-9]+" maxlength="10" name="tel" id="tel" required>
                                        <span id="num_proveMessage"></span><br>
                                    </div>
                                    <div>
                                        <input class="form-control" type="text" required placeholder="Usuario" name="usu" id="usuarioInput" required>
                                        <span id="usuarioMessage" class="error"></span><br>
                                    </div>
                                    <div class="party">
                        <div>
                            <input class="form-control" type="password" required placeholder="contraseña" name="contra" id="contraseñaInput" required>
                            <span id="contraseñaMessage" class="error"></span>
                        </div>
                        <div>
                            <button type="button" class="btn btn-light" id="togglePassword">Mostrar</button>
                        </div>
                    </div> 
                                                
                                    <hr><center><button type="submit" id="enviar" class="btn btn-success" >Aceptar</button></center>
              </form>
                </div>
            </div>
        </div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        const form = $('form[action="/aut/GuardarEmple"]');
        const edadInput = $('input[name="edad"]');
        const edadMessage = $('#edadMessage');
        const passwordInput = $('input[name="contra"]');
        const togglePassword = $('#togglePassword');

        // Llenar opciones para días (1-31)
        for (let i = 1; i <= 31; i++) {
            $('#day').append($('<option>', { value: i, text: i }));
        }

        // Llenar opciones para meses (1-12)
        for (let i = 1; i <= 12; i++) {
            $('#month').append($('<option>', { value: i, text: i }));
        }

        // Llenar opciones para años (1950 - año actual)
        const currentYear = new Date().getFullYear();
        for (let i = currentYear; i >= 1950; i--) {
            $('#year').append($('<option>', { value: i, text: i }));
        }

        // Validar la fecha de contratación al cambiar algún select
        $('#day, #month, #year').on('change', function () {
            validarFechaContratacion();
        });

       function validarFechaContratacion() {
            const dia = parseInt($('#day').val(), 10);
            const mes = parseInt($('#month').val(), 10);
            const año = parseInt($('#year').val(), 10);

            // Obtener la fecha actual
            const fechaActual = new Date();

            // Validar si la fecha de contratación es válida y no pasa la fecha actual
            const fechaContratacion = new Date(año, mes - 1, dia); // Restar 1 al mes ya que en JavaScript los meses son indexados desde 0

            if (
                isNaN(fechaContratacion.getTime()) ||
                fechaContratacion.getDate() !== dia ||
                fechaContratacion.getMonth() !== mes - 1 || // Restar 1 al mes aquí también
                fechaContratacion.getFullYear() !== año ||
                fechaContratacion > fechaActual  // Validar que la fecha de contratación no sea posterior a la fecha actual
            ) {
                $('#fechaContratacionMessage').text('Fecha de contratación inválida.');
                $('#fechaContratacionMessage').removeClass('success').addClass('error');
            } else {
                $('#fechaContratacionMessage').text('Fecha de contratación válida');
                $('#fechaContratacionMessage').removeClass('error').addClass('success');
            }

            // Validar formulario en su totalidad
            validarFormulario();
        }

        form.submit(function (event) {
            // Validar la edad
            const edad = parseInt(edadInput.val(), 10);
            if (isNaN(edad) || edad < 18 || edad > 80) {
                edadMessage.text('La edad debe estar entre 18 y 80 años.');
                event.preventDefault(); // Evitar que el formulario se envíe si hay errores.
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
                edadMessage.text('Válido');
                edadMessage.removeClass('error').addClass('success');
            }

            // Llamar a la función para validar el formulario
            validarFormulario();
        });

        // Validar el nombre
        $('#nombre').on('input', function () {
            validarCampo($(this), $('#nombreMessage'), 3);
        });

        // Validar el apellido paterno
        $('#app').on('input', function () {
            validarCampo($(this), $('#appMessage'), 3);
        });

        // Validar el apellido materno
        $('#app2').on('input', function () {
            validarCampo($(this), $('#app2Message'), 3);
        });

        // Validar la dirección
        $('#dire').on('input', function () {
            validarCampoD($(this), $('#direMessage'), 5);
        });

        // Validar el teléfono
        $('#tel').on('input', function () {
            validarTelefono();
        });

        // Función para validar un campo
        function validarCampo(input, message, minLength) {
            const valor = input.val().trim();
            if (valor === '') {
                message.text('Este campo es obligatorio.');
                message.removeClass('success').addClass('error');
            } else if (!/^[A-Za-záéíóúÁÉÍÓÚñÑüÜ\s]+$/.test(valor)) {
                message.text(`Este campo debe contener solo letras.`);
                message.removeClass('success').addClass('error');
            } else if (valor.length < minLength) {
                message.text(`Este campo debe tener al menos 4 ${minLength} caracteres.`);
                message.removeClass('success').addClass('error');
            } else {
                message.text('Campo válido');
                message.removeClass('error').addClass('success');
            }

            // Validar formulario en su totalidad
            validarFormulario();
        }

        // Función para validar un campo
        function validarCampoD(input, message, minLength) {
            const valor = input.val().trim();
            if (valor === '') {
                message.text('Este campo es obligatorio.');
                message.removeClass('success').addClass('error');
            } else if (valor.length < minLength) {
                message.text(`Este campo debe tener al menos 5 ${minLength} caracteres.`);
                message.removeClass('success').addClass('error');
            } else {
                message.text('Campo válido');
                message.removeClass('error').addClass('success');
            }

            // Validar formulario en su totalidad
            validarFormulario();
        }

        // Validar el teléfono
        function validarTelefono() {
            const telefonoInput = $('#tel');
            const telefonoMessage = $('#num_proveMessage');

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

        // Validar el código postal
        $('#cod').on('input', function () {
            var codPostal = $(this).val();
            if (!/^[0-9]{5}$/.test(codPostal)) {
                $('#codMessage').text('El código postal debe tener 5 dígitos numéricos');
                $('#codMessage').removeClass('success').addClass('error');
            } else {
                $('#codMessage').text('Código Postal Válido');
                $('#codMessage').removeClass('error').addClass('success');
            }

            // Llamar a la función para validar el formulario
            validarFormulario();
        });

        // Mostrar u ocultar la contraseña
        togglePassword.click(function () {
            passwordInput.attr('type', passwordInput.attr('type') === 'password' ? 'text' : 'password');
        });

        // Validación en tiempo real de la contraseña
        passwordInput.on('input', function () {
            var contraseña = passwordInput.val();
            var caracteresRestantes = Math.max(0, 4 - contraseña.length);
            var mensaje = caracteresRestantes > 0
                ? 'La contraseña debe tener al menos 4 caracteres. Faltan ' + caracteresRestantes + ' caracteres.'
                : ' Contraseña Válida';

            $('#contraseñaMessage').text(mensaje).toggleClass('error', caracteresRestantes > 0).toggleClass('success', caracteresRestantes === 0);

            // Llamar a la función para validar el formulario
            validarFormulario();
        });

        // Validación en tiempo real del correo
        $('#correoInput').on('input', function () {
            validarCorreo();
        });

        // Validación en tiempo real del usuario
        $('#usuarioInput').on('input', function () {
            validarUsuario();
        });

        // Deshabilitar el botón al cargar la página
        $('#enviar').prop('disabled', true);

        // ...

        // Función para validar el formulario en su totalidad
        function validarFormulario() {
            var contraseñaValida = $('#contraseñaMessage').hasClass('success');
            var correoValido = $('#correoMessage').hasClass('success');
            var usuarioValido = $('#usuarioMessage').hasClass('success');
            var edadValida = !(isNaN(parseInt(edadInput.val(), 10)) || edadInput.val() < 18 || edadInput.val() > 80);
            var nombreValido = $('#nombreMessage').hasClass('success');
            var appValido = $('#appMessage').hasClass('success');
            var app2Valido = $('#app2Message').hasClass('success');
            var direValido = $('#direMessage').hasClass('success');
            var telValido = $('#num_proveMessage').hasClass('success');
            var codValido = $('#codMessage').hasClass('success');
            var fechaContratacionValida = $('#fechaContratacionMessage').hasClass('success');

            // Deshabilitar el botón si alguna validación no es exitosa
            if (contraseñaValida && correoValido && usuarioValido && edadValida && nombreValido && appValido && app2Valido && direValido && telValido && codValido && fechaContratacionValida) {
                // Habilitar el botón de envío
                $('#enviar').prop('disabled', false);
            } else {
                // Deshabilitar el botón de envío
                $('#enviar').prop('disabled', true);
            }
        }
        // Función para validar el correo
        function validarCorreo() {
            var correo = $('#correoInput').val().trim();
            var mensaje = '';

            // Verificar si el correo está vacío
            if (correo === '') {
                mensaje = 'Por favor, ingrese un correo.';
            } else {
                // Verificar formato de correo electrónico
                var correoRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                mensaje = correoRegex.test(correo) ? 'Correo Válido' : 'Ingrese un correo electrónico válido';

                // Realizar la solicitud AJAX solo si el correo no está vacío y es válido
                if (mensaje === 'Correo Válido') {
                    $.ajax({
                        type: 'POST',
                        url: '/aut/validordeusus',
                        data: { correo: correo },
                        dataType: 'json',
                        success: function (response) {
                            if (response.correoExistente) {
                                $('#correoMessage').text('El correo ya está registrado.');
                                $('#correoMessage').removeClass('success').addClass('error');
                            } else {
                                $('#correoMessage').text('Correo Válido');
                                $('#correoMessage').removeClass('error').addClass('success');
                            }

                            // Llamar a la función para validar el formulario
                            validarFormulario();
                        },
                    });
                }
            }

            $('#correoMessage').text(mensaje);
            $('#correoMessage').toggleClass('error', mensaje !== 'Correo Válido').toggleClass('success', mensaje === 'Correo Válido');
        }

        // Función para validar el usuario
        function validarUsuario() {
            var usuario = $('#usuarioInput').val().trim();

            // Verificar si el usuario está vacío
            if (usuario === '') {
                $('#usuarioMessage').text('Por favor, ingrese un usuario.');
                $('#usuarioMessage').removeClass('success').addClass('error');
                // Limpiar el mensaje de validación del formulario
                validarFormulario();
            } else {
                // Almacenar el valor actual del usuario antes de la solicitud AJAX
                var usuarioActual = usuario;

                // Realizar la solicitud AJAX solo si el usuario no está vacío
                $.ajax({
                    type: 'POST',
                    url: '/aut/validordeusus',
                    data: { Usu: usuario },
                    dataType: 'json',
                    success: function (response) {
                        // Verificar si el usuario sigue siendo el mismo después de la solicitud AJAX
                        if (usuarioActual === $('#usuarioInput').val().trim()) {
                            if (response.usuarioExistente) {
                                $('#usuarioMessage').text('El usuario ya está registrado.');
                                $('#usuarioMessage').removeClass('success').addClass('error');
                            } else {
                                $('#usuarioMessage').text('Usuario Válido');
                                $('#usuarioMessage').removeClass('error').addClass('success');
                            }

                            // Llamar a la función para validar el formulario
                            validarFormulario();
                        }
                    },
                });
            }
        }
        // Alerta de bienvenida al cargar la página
        alert('¡Bienvenido! Por favor, llena todos los campos excepto el segundo nombre (este es opcional).');
        validarFormulario();
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

    </body>
</html>