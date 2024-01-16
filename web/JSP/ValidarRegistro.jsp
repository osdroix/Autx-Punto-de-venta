<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="Art Sign Up Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/aut/CSS/ventana.css">
    <link href="/aut/CSS/diseño.css" rel="stylesheet" type="text/css" />
    <title>Registro</title>
    <style>
        .error {
            color: red;
        }

        .success {
            color: green;
        }
    </style>
</head>
<body class="login">
    <div class="centrar">
        <form action="/aut/GuardarUsus" method="post" id="registroForm">
            <div class="party">
                <div class="formal">
                    <h2>Registro</h2><hr>
                    <input type="hidden" value="1" name="id">
                    <div><input class="form-control" type="text" pattern="[A-Za-z]{3,}" title="Ingresa al menos 3 o más letras 'Luis' y si tienes dos nombres solo con uno es suficiente." required placeholder="Nombre" name="nombre"></div><br>
                    <div><input class="form-control" type="text" pattern="[A-Za-z]{3,}" title="Ingresa al menos 3 o más letras 'Lopez'" required placeholder="Apellido Paterno" name="apellido"></div><br> 
                    <div><input class="form-control" type="text" pattern="[A-Za-z]{3,}" title="Ingresa al menos 3 o más letras 'Martinez'" required placeholder="Apellido Materno" name="apellido2"></div><br>
                    <div class="party">
                        <div>
                        <input class="form-control" type="text" pattern="[0-9]+" required placeholder="Edad" name="edad" maxlength="2" id="edadInput">
                        <span id="edadMessage" class="error"></span>
                        </div>
                        <select class="form-control" placeholder="Sexo" name="sexo">
                            <option value="M">M</option>
                            <option value="F">F</option>
                            <option value="Otros">otros</option>
                        </select>
                    </div><hr>
                    <center>
                        <a class="btn btn-danger" href="/aut/index.jsp">Cancelar</a>
                    </center>
                </div>
                    
                <div class="formal">
                    <p align="right">
                        <a class="btn btn-outline-link" target="_parent" href="/aut/Terminos.html">
                            <img alt="Responsive image" src="/aut/img/pl.png" width="30" height="30"/> 
                            Avisos De Privacidad
                        </a>
                    </p><hr>
                    <!-- Agrega estos elementos span debajo de los campos de correo y usuario -->
                    <div>
                        <input class="form-control" type="text" required placeholder="Correo" name="correo" id="correoInput">
                        <span id="correoMessage" class="error"></span><br>
                    </div>
                    <div>
                        <input class="form-control" type="text" required placeholder="Usuario" name="Usu" id="usuarioInput">
                        <span id="usuarioMessage" class="error"></span><br>
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
                    <div class="party">
                        <div>
                        </div>
                        <div>
                            <input type="checkbox" required name="terms"> Acepto los Términos Y Condiciones.
                        </div> 
                    </div><hr>
                    <center>
                        <input type="submit" class="btn btn-blue" value="Aceptar">
                    </center>
                </div>
            </div>
        </form>
    </div>
    <div class="overlay" id="overlay">
        <div class="popup" id="popup">
            <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
            <h2 align="center">
                Aut-X "Contraseña"</h2><hr>
                <label>Tu contraseña debe contar con al menos 4 caracteres.
                    Se recomienda que tu contraseña sea lo más compleja y 
                    anónima para ti mismo. ¡Recuerda que aún no contamos con solicitud de 
                    contraseña olvidada!</label>
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
                : 'Válido';

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

        // Función para validar el formulario en su totalidad
        function validarFormulario() {
            var contraseñaValida = $('#contraseñaMessage').hasClass('success');
            var correoValido = $('#correoMessage').hasClass('success');
            var usuarioValido = $('#usuarioMessage').hasClass('success');
            var edadValida = !(isNaN(parseInt(edadInput.val(), 10)) || edadInput.val() < 18 || edadInput.val() > 80);

            // Deshabilitar el botón de envío si alguna validación no es exitosa
            if (contraseñaValida && correoValido && usuarioValido && edadValida) {
                // Habilitar el envío del formulario
                form.submit();
            } else {
                // Evitar el envío del formulario
                event.preventDefault();
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
                        error: function (error) {
                            console.log('Error en la solicitud AJAX: ' + JSON.stringify(error));
                        }
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
    });
</script>

<script src="/aut/JS/ventnas.js"></script>
        </body>
        </html>
