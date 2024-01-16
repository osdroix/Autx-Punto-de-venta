
<%@page import="Entidades.Producto"%>
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
    HttpSession sesion = request.getSession(true);
    empleado u = (empleado) sesion.getAttribute("user");
    Producto o = new Producto();
    if (sesion.getAttribute("user") != null) {


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
        <div class="Productos1">
            <h1 class="hy"align="center">Lista de productos
             <a id="btn-abrir-popup" class="btn btn-primary" >Agregar</a>
             <a id="btn-abrir-popups" class="btn btn-danger" >Productos sin inventario</a>
             <hr>
              <% 
                out.println(""
                + "<a href='/aut/JSP/tablita.jsp?ID="+1+"'><img id='centro' alt='Responsive image'src='/aut/img/crema.jpg'></a>"
                +"<a href='/aut/JSP/tablita.jsp?ID="+2+"' ><img  id='centro' alt='Responsive image'src='/aut/img/ver.jpg'></a>"
                +"<a href='/aut/JSP/tablita.jsp?ID="+3+"' ><img id='centro' alt='Responsive image'src='/aut/img/chetoss.jpg'></a>"
                +"<a href='/aut/JSP/tablita.jsp?ID="+4+"' ><img id='centro' alt='Responsive image'src='/aut/img/chile.jpg'></a><hr>"
                +"<a href='/aut/JSP/tablita.jsp?ID="+5+"' ><img id='centro' alt='Responsive image'src='/aut/img/farma.jpg'></a>"
                +"<a href='/aut/JSP/tablita.jsp?ID="+6+"'><img id='centro' alt='Responsive image'src='/aut/img/helado.webp'></a>"
                +"<a href='/aut/JSP/tablita.jsp?ID="+7+"' ><img id='centro' alt='Responsive image'src='/aut/img/pan.jpg'></a>"
                +"<a href='/aut/JSP/tablita.jsp?ID="+8+"' ><img id='centro' alt='Responsive image'src='/aut/img/limpe.jpg'></a><hr>"
                +"<a href='/aut/JSP/tablita.jsp?ID="+9+"' ><img id='centro' alt='Responsive image'src='/aut/img/croqueta.webp'></a>"
                +"<a href='/aut/JSP/tablita.jsp?ID="+10+"' ><img id='centro' alt='Responsive image'src='/aut/img/semi.jpg'></a>"
                +"<a href='/aut/JSP/tablita.jsp?ID="+11+"' ><img id='centro' alt='Responsive image'src='/aut/img/refre.jpg'></a>"
                +"<a href='/aut/JSP/tablita.jsp?ID="+12+"' ><img id='centro' alt='Responsive image'src='/aut/img/mas.png'></a>");
              %> 
        </h1></div>

        
            
        <div class="overlay" id="overlays">
            <div class="popup" id="popups">
                <a href="#" id="btn-cerrar-popups" class="btn-cerrar-popup"><img src="/aut/img/eli.png" width="30" height="30"><i class="fas fa-times"></i></a>
                              <h2>Productos sin inventario</h2><hr>
                <div class="muro_p">
                     <p align="center"><div class="row" >
                    
                    <% 
                    ArrayList<Producto> us = new ArrayList();
                    us=CRUD.getproductos0("0");
                    for(Producto os:us){%>
                         <div class="modelos-tiquet-adm">
                        <div align="center">
                               <img src="<%out.println(os.getDescripcion());%>" width='100' height='100'><hr>
                        </div>
                            <h6> <%out.println(os.getNombre());%></h6>
                            <h6 style="color: red;"><%out.println(os.getNum_cantidad());%> En inventario</h6>
                            <div align="right">                                         <%
                                         out.println("<a class='btn btn-primary' href='/aut/JSP/editarproducto.jsp?ID="+os.getId_incremet()+"&tipo="+os.getId_tipo()+"'>Actualizar</a>");%> 
                             </div> 
                         </div>
                        
                        
                   <% }
                    
                    
                    %>
                </div>
                </div>   
            </div>
            </div>
              <div class="overlay" id="overlay">
            <div class="popup" id="popup">
                <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup"><img src="/aut/img/eli.png" width="30" height="30"><i class="fas fa-times"></i></a>
                <h2>Entrada de productos</h2><hr>
                <form action="/aut/Guardarproducto" method="post">
                    <div class="party">
                        <h6>Tipo de producto:</h6>
                          <select class="form-control" type="text" name="id_tipo">
                                    <option value="1">Cremeria</option>
                                    <option value="2">Verduras</option>
                                    <option value="3">Frituras Y Dulces</option>
                                    <option value="4">Chiles</option>
                                    <option value="5">Farmacia</option>
                                    <option value="6">Heladeria</option>
                                    <option value="7">Expendio de pan</option>
                                    <option value="8">Limpieza</option>
                                    <option value="9">Alimento de mascota</option>
                                    <option value="10">Semillas</option>
                                    <option value="11">Refrescos</option>
                                    <option value="12">otros</option>
                          </select></div><br>
                        <h6>Proveedor:</h6>
                          <select class="form-control" type="text" name="prove" id="prove">
                                <%
                                  Connection c = Conexion.getConnection();
                                    String x = "select * from proveedor_prod";
                                    PreparedStatement set1 = c.prepareStatement(x);
                                    ResultSet rs = set1.executeQuery();
                                    while (rs.next()) {
                                        %>
                                        <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                        <%
                                    }
                                        %>
                        </select><br>
                        <div>
                            <div>
                                <input class="form-control" type="text" placeholder="Nombre"  maxlength="30" name="nombre" id="nombre">
                                <span id="nomMessage" class="error"></span>
                            </div<br>
                    <div class="party">
                        <h6>Fecha de caducidad:</h6><br>
                                        <select class="form-control" required name="fecha" id="day">
                                            <option value="" disabled selected>Día</option>
                                            <!-- Opciones para los días -->
                                        </select>
                                        <select class="form-control" required name="fecha1" id="month">
                                            <option  value="" disabled selected>Mes</option>
                                            <!-- Opciones para los meses -->
                                        </select>
                                        <select class="form-control" required name="fecha2" id="year">
                                            <option value="" disabled selected>Año</option>
                                            <!-- Opciones para los años desde 1950 hasta el año actual -->
                                        </select>
                    </div>
                                    <span id="fechaContratacionMessage" class="error"></span><br>
                       <div class="party">
                           <h6>Producto:</h6><br>
                           <div>
                           <input class="form-control" type="text"placeholder="Cantidad" required pattern="[0-9]+" maxlength="4" name="cant">
                           <span id="cantMessage" class="error"></span>
                           </div>
                           <div>
                            <input class="form-control" type="text"placeholder="MNX" required  maxlength="9" name="prec">
                            <span id="dineritoMessage" class="error"></span><br>
                           </div>
                       </div>
                                    <div class="party">
                                        <div>
                                            <input class="form-control" type="url" placeholder="Imagen Web" required name="img" id="imagenInput">
                                            <span id="linkMessage" class="error"></span>
                                       </div>
                                            <img id="imagenPreview" src="" alt="Vista previa de la imagen"  style="max-width: 20%; margin-right:2%;  max-height:10vh; display: none;">
                                    </div><hr>
                <center><button id="submitBtn" class="btn btn-primary" name="btn">Aceptar</button></center>
               </form>
            
              
            </div>
        </div> 
                <script src="/aut/JS/ventnas.js"></script>
                <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        const form = $('form[action="/aut/Guardarproducto"]');
        const submitBtn = $('#submitBtn');

        submitBtn.prop('disabled', true);

        // Llenar opciones para días (1-31)
        for (let i = 1; i <= 31; i++) {
            $('#day').append($('<option>', { value: i, text: i }));
        }

        // Llenar opciones para meses (1-12)
        for (let i = 1; i <= 12; i++) {
            $('#month').append($('<option>', { value: i, text: i }));
        }

        // Llenar opciones para años (últimos dos dígitos)
        const currentYear = new Date().getFullYear();
        for (let i = currentYear; i <= 2026; i++) {
            const lastTwoDigits = i.toString().slice(-2); // Obtener los últimos dos dígitos del año
            $('#year').append($('<option>', { value: i, text: lastTwoDigits }));
        }

        // Validar la fecha de contratación al cambiar algún select
        $('#day, #month, #year').on('change', function () {
            validarFechaContratacion();
                    
        });

        $('input[name="cant"]').on('input', function () {
            validarCantidad();
        });

        $('input[name="prec"]').on('input', function () {
            validarPrecio();
        });

        $('#nombre').on('input', function () {
            validarNombre();
        });

        $('#imagenInput').on('input', function () {
            validarImagen();
        });

        function validarFechaContratacion() {
            const isValidFecha = validarFechaContratacionIndividual();
            validarFormulario(isValidFecha);
        }

        function validarCantidad() {
            const isValidCantidad = validarCantidadIndividual();
            validarFormulario(isValidCantidad);
        }

        function validarPrecio() {
            const isValidPrecio = validarPrecioIndividual();
            validarFormulario(isValidPrecio);
        }

        function validarNombre() {
            const isValidNombre = validarNombreIndividual();
            validarFormulario(isValidNombre);
        }

        function validarImagen() {
            const isValidImagen = validarImagenIndividual();
            validarFormulario(isValidImagen);
        }

        function validarFechaContratacionIndividual() {
            const dia = parseInt($('#day').val(), 10);
            const mes = parseInt($('#month').val(), 10);
            const año = parseInt($('#year').val(), 10);

            const fechaActual = new Date();
            fechaActual.setHours(0, 0, 0, 0);

            const fechaContratacion = new Date(año, mes - 1, dia);

            if (
                isNaN(fechaContratacion.getTime()) ||
                fechaContratacion.getDate() !== dia ||
                fechaContratacion.getMonth() !== mes - 1 ||
                fechaContratacion.getFullYear() !== año ||
                fechaContratacion <= fechaActual
            ) {
                mostrarMensaje('#fechaContratacionMessage', 'La fecha de caducidad debe ser posterior al día actual.', 'error');
                return false;
            } else {
                mostrarMensaje('#fechaContratacionMessage', 'Caducidad válida', 'success');
                return true;
            }
        }

        function validarCantidadIndividual() {
            const cantidadInput = $('input[name="cant"]');
            const cantidad = cantidadInput.val().trim();

            if (cantidad === '') {
                mostrarMensaje('#cantMessage', 'Este campo es obligatorio.', 'error');
                return false;
            }

            if (!/^\d+(\.\d{1,2})?$/.test(cantidad) || parseFloat(cantidad) < 0) {
                mostrarMensaje('#cantMessage', 'Ingrese un número válido y no negativo.', 'error');
                return false;
            }

            if (cantidad.length > 4) {
                mostrarMensaje('#cantMessage', 'La cantidad no debe tener más de 4 caracteres.', 'error');
                return false;
            }

            mostrarMensaje('#cantMessage', 'Cantidad válida', 'success');
            return true;
        }

        function validarPrecioIndividual() {
            const precioInput = $('input[name="prec"]');
            const precio = precioInput.val().trim();

            if (precio === '') {
                mostrarMensaje('#dineritoMessage', 'Este campo es obligatorio.', 'error');
                return false;
            }

            if (!/^\d+(\.\d{1,2})?$/.test(precio) || parseFloat(precio) < 0) {
                mostrarMensaje('#dineritoMessage', 'Ingrese un número válido y no negativo, la validación es de 2 decimales.', 'error');
                return false;
            }

            if (precio.length > 9) {
                mostrarMensaje('#dineritoMessage', 'El precio no debe tener más de 10 caracteres.', 'error');
                return false;
            }

            mostrarMensaje('#dineritoMessage', 'Precio válido', 'success');
            return true;
        }

        function validarNombreIndividual() {
            const nombreInput = $('#nombre');
            const nombre = nombreInput.val().trim();

            if (nombre.length < 3 || nombre === '') {
                mostrarMensaje('#nomMessage', 'El nombre debe tener más de 3 caracteres y no puede estar vacío.', 'error');
                return false;
            }

            mostrarMensaje('#nomMessage', 'Nombre válido', 'success');
            return true;
        }

        function validarImagenIndividual() {
            const imagenInput = $('#imagenInput');
            const imagenURL = imagenInput.val().trim();

            if (!isValidURL(imagenURL)) {
                mostrarMensaje('#linkMessage', 'Ingrese una URL válida.', 'error');
                $('#imagenPreview').attr('src', '').hide();
                return false;
            }

            $('#imagenPreview').attr('src', imagenURL).show();
            mostrarMensaje('#linkMessage', 'URL válida', 'success');
            return true;
        }

        function mostrarMensaje(elemento, mensaje, tipo) {
            $(elemento).text(mensaje).removeClass('success error').addClass(tipo);
        }

        function isValidURL(url) {
            try {
                new URL(url);
                return true;
            } catch (error) {
                return false;
            }
        }
    function validarProveedorIndividual() {
    const proveedorSelect = $('select[name="prove"]');
    const proveedorSeleccionado = proveedorSelect.val();

    if (!proveedorSeleccionado || proveedorSeleccionado === '') {
        mostrarMensaje('#proveedorMessage', 'Seleccione un proveedor.', 'error');
        return false;
    }

    mostrarMensaje('#proveedorMessage', 'Proveedor válido', 'success');
    return true;
}
function validarFormulario() {
    const isValidNombre = validarNombreIndividual();
    const isValidFecha = validarFechaContratacionIndividual();
    const isValidCantidad = validarCantidadIndividual();
    const isValidPrecio = validarPrecioIndividual();
    const isValidImagen = validarImagenIndividual();
    const isValidProveedor = validarProveedorIndividual();

    const todosLosCamposSonValidos = isValidNombre && isValidFecha && isValidCantidad && isValidPrecio && isValidImagen && isValidProveedor;

    if (todosLosCamposSonValidos) {
        submitBtn.prop('disabled', false);
    } else {
        submitBtn.prop('disabled', true);
    }
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

          
    </body>
</html>
<%   } else {

        response.sendRedirect("/aut/Administrador/usuarios.jsp");
    }
%>