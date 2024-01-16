
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
    usuarios u=(usuarios)sesion.getAttribute("user");
    if (sesion.getAttribute("user")!=null){
       
      
    CRUD i = new CRUD();
String usu=request.getParameter("Usu");
int id= Integer.parseInt(request.getParameter("Id"));
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
        <link rel="stylesheet" type="text/css" href="/aut/CSS/ventana.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <style>
        .error {
            color: red;
        }

        .success {
            color: green;
        }
    </style>
<script>
    $(document).ready(function () {
        const form = $('form');
        const edadInput = $('input[name="edad"]');
        const edadMessage = $('#edadMessage');
        const passwordInput = $('input[name="contra"]');
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



        // Función para validar el formulario en su totalidad
        function validarFormulario() {
            var contraseñaValida = $('#contraseñaMessage').hasClass('success');
            var edadValida = !(isNaN(parseInt(edadInput.val(), 10)) || edadInput.val() < 18 || edadInput.val() > 80);

            // Deshabilitar el botón de envío si alguna validación no es exitosa
            if (contraseñaValida &&  edadValida) {
                // Habilitar el envío del formulario
                form.submit();
            } else {
                // Evitar el envío del formulario
                event.preventDefault();
            }
        }


    });
</script>

    
        <script  src="JS/validacion.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/ventana.css">
    <link href="/aut/CSS/diseño.css" rel="stylesheet" type="text/css" />
	<title>
		<%out.println(u.getUsuario());%>
	</title>
</head>
<body>
    <div class="party">
        <div class="tabla">
                <table>
                    <% 
                    ArrayList<usuarios> us = new ArrayList();
                    us=CRUD.getMostrarUsu(usu);
                    for(usuarios o:us){
                          
                    out.println("<tr><td><h1>"+o.getUsuario()+"</h1><h2>Datos Generales</h2>");
                          out.println("<tr><td>"
                                + "<h5>Nombre</h5>"
                                + "<h4><input class='form-control' readonly type='text'placeholder='"+o.getNombre()+" "+o.getApellido()+" "+o.getApellido2()+"' type='text'/>"
                                + "<h5>Correo</h5>"
                                + "<input class='form-control'readonly type='text'placeholder='"+o.getCorreo()+"' type='text'/>"
                               + "<h2>Datos Complementarios</h2>"
                               + "<h5>Edad</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getEdad()+"' type='text'/><br>"
                                + "</tr>");
                        
                        
                        
                    }
                    
                    
                    %>
                </table>
        </div>
         <div class="suerte">
         <h1>Editar Datos<hr></h1>  
        <form action="/aut/editarusu" method="POST">
                    <input type="hidden" value="<%out.println(u.getRela());%>" name="id"/>
                    <div class="inputs">
                        <img class="img-fluid" alt="Responsive image" src="/aut/img/nombre.png" width="20" height="20"/>
                         <% for (usuarios o:us){
                            out.println("<input class='input-registro' type='text' placeholder='Nombre' required value='"+o.getNombre()+"' name='nombre' pattern='[A-Za-z]{3,}' title='Ingresa al menos 3 o más letras Ejemplo:Luis, y si tienes dos nombres solo con uno es suficiente.'>");
                        }
                        %>
                    </div><br>

                    <div class="inputs">
                        <img class="img-fluid" alt="Responsive image" src="/aut/img/nombre.png" width="20" height="20"/>
                        <% for (usuarios o:us){
                            out.println("<input class='input-registro' type='text' placeholder='Apellido Paterno' required value='"+o.getApellido()+"' name='apellido' pattern='[A-Za-z]{3,}' title='Ingresa al menos 3 o más letras Ejemplo: Lopez'>");
                        }
                        %>
                    </div><br> 

                    <div class="inputs">
                        <img class="img-fluid" alt="Responsive image" src="/aut/img/nombre.png" width="20" height="20"/>
                        <% for (usuarios o:us){
                            out.println("<input class='input-registro' type='text' placeholder='Apellido Materno' required value='"+o.getApellido2()+"' name='apellido2' pattern='[A-Za-z]{3,}' title='Ingresa al menos 3 o más letras Ejemplo: Orozco'>");
                        }
                        %>
                    </div><br> 
                    <div>
                         <% for (usuarios o:us){
                            out.println("<input class='form-control' type='text' readonly value='"+o.getCorreo()+"' name='correo'>");
                         }%>
                         <br>
                     </div>
                         <div>
                            <input class="form-control" type="text" pattern="[0-9]+" required placeholder="Edad" name="edad" maxlength="2" id="edadInput">
                             <span id="edadMessage" class="error"></span>
                             <br>  
                         </div>
                     <div class="party">
                     <div>
                     <input class="form-control" type="text" readonly value="<%out.println(u.getUsuario());%>" name="Usu">
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
                     </div><hr>
                    <center><button  class="btn btn-success" target='der' name="btn">Editar</button> 
                    <A  class="btn btn-link btn-block" href="/aut/Clientes/main.jsp" >Regresar</A></center> 
        </form>
         </div> 
</div>
                    
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
<%   }else{

response.sendRedirect("/aut/");}
%>