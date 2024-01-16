

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
	<div class="superiorr">
	<h3  class="hy" >
		Proveedores
               <div class="p">
                   <A  class="btn btn-success btn-block" href="/aut/cerrasesion" target="_top">
                    <img src='/aut/img/salida.png'width='40' height='40'/> Salir
                   </A>
                 </div>
                <div class="p">
                   <button class="btn btn-success" id="btn-abrir-popup">
                    <img  alt="Responsive image"src="/aut/img/olu.png"width="40" height="40"/> Perfil</button>
                 </div>
                <div class="p">
                 <button  class="btn btn-success" id='btn-abrir-popups'>
                     <img src='/aut/img/basura3.png'width='40' height='40'/>Borrar</button></div>
                <div class="p">
                    <form action="/aut/Administrador/prove.jsp" method="post">
                        <div class="party">
                             <select class="form-control" type="text" name="prove">
                                <%
                                  Connection c = Conexion.getConnection();
                                    String x = "select * from proveedor_prod";
                                    PreparedStatement set1 = c.prepareStatement(x);
                                    ResultSet rs = set1.executeQuery();
                                    while (rs.next()) {
                                        %>
                                        <option><%=rs.getString(3)%></option>
                                        <%
                                    }
                                        %>
                        </select>
                                <button  class="btn btn-success">Buscar</button>
                        </div>
                    </form>   
                </div>
                <div class="p">
                 <button  class="btn btn-success" id='btn-abrir-popup2'>
                     <img src='https://cdn-icons-png.flaticon.com/512/1004/1004733.png'width='40' height='40'/> Agregar Proveedor</button></div>
        </h3></div>
                 <h4  class="hy"align="center"><div class="menu">
                         <br><br>
                    <A  class="btn btn-link btn-block" href="/aut/Administrador/usuarios.jsp" >
                        <img  alt="Responsive image"src="/aut/img/u.png"width="80" height="80"/></A>
                        Clientes<hr>
                    <A  class="btn btn-link btn-block" href="/aut/Administrador/empleados.jsp" >
                        <img  alt="Responsive image"src="/aut/img/em.png"width="80" height="80"/></A>
                        Empleados<hr>
                    <A  class="btn btn-link btn-block" href="/aut/Administrador/prove.jsp" >
                        <img  alt="Responsive image"src="https://cdn-icons-png.flaticon.com/512/2103/2103848.png"width="80" height="80"/></A>
                        Proveedores<hr>
                    <A  class="btn btn-link btn-block" href="/aut/JSP/formulario-emple.jsp" ><img  alt="Responsive image"src="/aut/img/us.png"width="80" height="80"/>
                        </A>Formularios
                        <hr><br>
                     </div></h4>
       <%String p= request.getParameter("prove");
       if(p==null){
%>
       <div class="muro">
               <p align="center"><div class="row" >
                    
                    <% 
                    ArrayList<proveedores> us = new ArrayList();
                    us=CRUD.getmostrarprove();
                    for(proveedores o:us){%>
                         <div class="modelos-tiquet-adm">
                        <div align="center">
                            <h3 align="center">Proveedor</h3><hr>
                            <h5>Empresa: <%out.println(o.getNom_ep());%><br>
                                        </h5>
                        </div>
                            <h6> Nombre: <%out.println(o.getNom_p());%><br>
                                 Num.Prove: <%out.println(o.getNum_prove());%><br>
                                 Dirección Empresa: <%out.println(o.getDirec_e());%><br>
                                 Registrado: <%out.println(o.getCreate());%><br>
                                 <%if(o.getUpdate()!=null){%>
                                 <label style="color: green;">Actualizado: <%out.println(o.getUpdate());%></label>
                                  <br>
                                 <%}%>
                            </h6>
                             <div align="right"> 
                                         <%
                                         out.println("<a class='btn btn-danger' href='/aut/Administrador/prove.jsp?ID="+o.getId_prove()+"&NUM="+666+"&nom="+o.getNom_p()+"'>Seleccionar</a>");
                                         out.println("<a class='btn btn-success'href='/aut/Administrador/EditarP.jsp?ID="+o.getId_prove()+"'>Editar</a>");%>
                                        </div> </div>
                        
                        
                   <% 
                                                 }
                    
                    
                    %>
                </div>
            </div>
      <%}if(p !=null){%>
               <div class="muro">
               <p align="center"><div class="row" >
                    
                    <% 
                    ArrayList<proveedores> us = new ArrayList();
                    us=CRUD.getmostrarproveb(p);
                    for(proveedores o:us){%>
                         <div class="modelos-tiquet-adm">
                        <div align="center">
                            <h3 align="center">Proveedor</h3><hr>
                            <h5>Empresa: <%out.println(o.getNom_ep());%><br>
                                        </h5>
                        </div>
                            <h6> Nombre: <%out.println(o.getNom_p());%><br>
                                 Num.Prove: <%out.println(o.getNum_prove());%><br>
                                 Dirección Empresa: <%out.println(o.getDirec_e());%><br>
                                 Registrado: <%out.println(o.getCreate());%><br>
                                 <%if(o.getUpdate()!=null){%>
                                 <label style="color: green;">Actualizado: <%out.println(o.getUpdate());%></label>
                                  <br>
                                 <%}%>
                            </h6>
                             <div align="right"> 
                                         <%
                                         out.println("<a class='btn btn-danger' href='/aut/Administrador/prove.jsp?ID="+o.getId_prove()+"&NUM="+666+"&nom="+o.getNom_p()+"'>Seleccionar</a>");
                                         out.println("<a class='btn btn-success'href='/aut/Administrador/EditarP.jsp?ID="+o.getId_prove()+"'>Editar</a>");%>
                                        </div> </div>
                        
                        
                   <% 
                                                 }
                    
                    
                    %>
                </div>
            </div>
      <%}%>
    <div class="overlay" id="overlay">
  <div class="popup" id="popup">

      <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
  <h2 align="center">Administrador</h2>
  <div >
                <h5>Nombre<input type="text" readonly class="form-control-plaintext" placeholder="<%out.println(u.getUsuario());%>">
          Contraseña
          <input type="text" readonly class="form-control-plaintext" placeholder="<%out.println(u.getContra());%>"></h5>
            <% 
            out.println("<a class='btn btn-success btn-block' TARGET='_top' href='/aut/editar.jsp?Usu="+u.getUsuario()+"&Id="+u.getUsu()+"&Tipo="+u.getTipo()+"'>Perfil</a>");
            %>
          
  </div>

  </div>
  </div>
            
    <div class="overlay" id="overlay3">
  <div class="popup" id="popup3">

      <a href="#" id="btn-cerrar-popup3" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
  <h2 align="center">Administrador</h2>
  <div >
                <h5>Nombre<input type="text" readonly class="form-control-plaintext" placeholder="<%out.println(u.getUsuario());%>">
          Contraseña
          <input type="text" readonly class="form-control-plaintext" placeholder="<%out.println(u.getContra());%>"></h5>
            <% 
            out.println("<a class='btn btn-success btn-block' TARGET='_top' href='/aut/editar.jsp?Usu="+u.getUsuario()+"&Id="+u.getUsu()+"&Tipo="+u.getTipo()+"'>Perfil</a>");
            %>
          
  </div>

  </div>
  </div>
            
            <%
      String nom= request.getParameter("nom");
      String contra= request.getParameter("contra");
      String corr= request.getParameter("corr");
      String POLLO= request.getParameter("NUM");
      String id= request.getParameter("ID");
      if (POLLO == null) {
      %> 
  <div class="overlay" id="overlays">
  <div class="popup" id="popups">
      <a href="#" id="btn-cerrar-popups" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
  <h2 align="center">¡seleccione usuario!</h2>
  <div >
          
  </div>
  <center><img  alt="Responsive image"src="/aut/img/falla.png"width="440" height="290"/></center>
  </div>
  </div>
  <div class="overlay" id="overlay2">
    <div class="popup" id="popup2">
        <a href="#" id="btn-cerrar-popup2" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
        <h5 align="center">Nuevo Proveedor</h5>
<form action="/aut/GuardarProve" method="post" id="registroForm">
    <input class="form-control" id="usuarioInput"type="text" placeholder="Nombre de la empresa"  pattern="{4,}" title="Ingresa al menos 3 o más letras. Ejemplo: Bimbo." name="nom_empre_prove" required>
    <span id="nom_empre_proveMessage" class="error"></span>
    <br>
    <input class="form-control" type="text" placeholder="Nombre del proveedor"  pattern="{3,}" title="Ingresa al menos 3 o más letras. Ejemplo: Luis." name="nom_prove" required>
    <span id="nom_proveMessage" class="error"></span>
    <br>
    <textarea class="form-control" type="text" placeholder="Dirección de la empresa" name="direc_empre_prove" rows="2" required></textarea>
    <span id="direc_empre_proveMessage" class="error"></span>
    <br>
    <input class="form-control" type="text" placeholder="Número del proveedor" pattern="[0-9]{10,}" maxlength="10" name="num_prove" id="tel" required>
    <span id="num_proveMessage" class="error"></span>
    <br>
    <hr>
    <button class="btn btn-success btn-block" type="submit" name="btn" disabled>Enviar</button>
</form>

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
            } else {
                message.text('Campo válido');
                message.removeClass('error').addClass('success');
            }

            // Validar formulario en su totalidad
            validarFormulario();
        }
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
                // Validación en tiempo real del usuario
        $('#usuarioInput').on('input', function () {
            validarUsuario();
        });
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
                    url: '/aut/validorprove',
                    data: { Usu: usuario },
                    dataType: 'json',
                    success: function (response) {
                        // Verificar si el usuario sigue siendo el mismo después de la solicitud AJAX
                        if (usuarioActual === $('#usuarioInput').val().trim()) {
                            if (response.usuarioExistente) {
                                $('#nom_empre_proveMessage').text('El usuario ya está registrado.');
                                $('#nom_empre_proveMessage').removeClass('success').addClass('error');
                            } else {
                                $('#nom_empre_proveMessage').text('Usuario Válido');
                                $('#nom_empre_proveMessage').removeClass('error').addClass('success');
                            }

                            // Llamar a la función para validar el formulario
                            validarFormulario();
                        }
                    },
                });
            }
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
  <%
      }else{       
  %>
   <div class="overlay" id="overlays">
  <div class="popup" id="popups">
      <a href="#" id="btn-cerrar-popups" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
  <h2 align="center">!Alerta¡</h2>
  <div >
             <form action="/aut/eliminar" method="post">
          <h5>Nombre<input type="text" readonly class="form-control-plaintext" value="<%out.println(nom);%>">
          Empresa:
          <input type="text" readonly class="form-control-plaintext" placeholder="<%out.println(id);%>">
        
            
            </form>
          <%
      
          out.println("<a class='btn  btn-danger btn-block 'href='/aut/eliminar?ID="+id+"&ID2="+id+"&NUM="+POLLO+"' >Eliminar</a>");
          
                      %>
              
  </div>

  </div>
  </div>
  <%
      }
  %>
     

  <script src="/aut/JS/ventnas.js"></script>
</body>
</body>
</html>
<%   }else{

response.sendRedirect("/aut/Administrador/empleados.jsp");}
%>