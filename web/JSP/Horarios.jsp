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
<%@page session= 'true' %>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%
    HttpSession sesion = request.getSession(true);
    empleado u = (empleado) sesion.getAttribute("user");
    if (sesion.getAttribute("user") != null) {


%>
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
    <body class="l">
        <div class="dj">
            <form action="/aut/JSP/FormatHorario.jsp" method="post">
                <div class="horario">
                    <h2>Horario</h2>
                    <div class="party">
                        <h6>Turno:</h6>
                        <select class="form-control" type="text" name="turno">
                            <option value="Matutino">Matutino</option>
                            <option value="Vespertino">Vespertino</option>
                            <option value="Nocturno">Nocturno</option>
                            <option value="Tiempo completo">Tiempo completo</option>
                        </select>
                        <h6>Empleado:</h6>
                        <select class="form-control" type="text" name="emple">
                                <%
                                  Connection c = Conexion.getConnection();
                                    String x = "select * from empleado where Id_tipo_emple like '"+2+"'";
                                    PreparedStatement set1 = c.prepareStatement(x);
                                    ResultSet rs = set1.executeQuery();
                                    while (rs.next()) {
                                        %>
                                        <option><%=rs.getString(6)%></option>
                                        <%
                                    }
                                        %>
                        </select></div><hr>
                    <div class="party">
                        <input class='form-control' readonly placeholder='Lunes'/>
                        <input class='form-control' readonly placeholder='Martes' type='text'/>
                        <input class='form-control' readonly placeholder='Miercoles' type='text'/>
                        <input class='form-control' readonly placeholder='Jueves' type='text'/>
                        <input class='form-control' readonly placeholder='Viernes' type='text'/>
                        <input class='form-control' readonly placeholder='Sabado' type='text'/>
                        <input class='form-control' readonly placeholder='Domingo' type='text'/>
                    </div>
                    <div class="party">
                        <select class="form-control" type="text" name="horas11">
                            <option value="6:00 am / 8:00 am">6:00 am / 8:00am</option>
                            <option value="8:00 am / 10:00 am">8:00 am / 10:00 am</option>
                            <option value="7:00 am / 8:00 am">7:00 am / 8:00 am </option>
                            <option value="8:00 am / 9:00 am">9:00 am / 10:00 am</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                         <select class="form-control" type="text" name="horas12">
                            <option value="6:00 am / 8:00 am">6:00 am / 8:00am</option>
                            <option value="8:00 am / 10:00 am">8:00 am / 10:00 am</option>
                            <option value="7:00 am / 8:00 am">7:00 am / 8:00 am </option>
                            <option value="8:00 am / 9:00 am">9:00 am / 10:00 am</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                         <select class="form-control" type="text" name="horas13">
                            <option value="6:00 am / 8:00 am">6:00 am / 8:00am</option>
                            <option value="8:00 am / 10:00 am">8:00 am / 10:00 am</option>
                            <option value="7:00 am / 8:00 am">7:00 am / 8:00 am </option>
                            <option value="8:00 am / 9:00 am">9:00 am / 10:00 am</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                         <select class="form-control" type="text" name="horas14">
                            <option value="6:00 am / 8:00 am">6:00 am / 8:00am</option>
                            <option value="8:00 am / 10:00 am">8:00 am / 10:00 am</option>
                            <option value="7:00 am / 8:00 am">7:00 am / 8:00 am </option>
                            <option value="8:00 am / 9:00 am">9:00 am / 10:00 am</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                         <select class="form-control" type="text" name="horas15">
                            <option value="6:00 am / 8:00 am">6:00 am / 8:00am</option>
                            <option value="8:00 am / 10:00 am">8:00 am / 10:00 am</option>
                            <option value="7:00 am / 8:00 am">7:00 am / 8:00 am </option>
                            <option value="8:00 am / 9:00 am">9:00 am / 10:00 am</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                         <select class="form-control" type="text" name="horas16">
                            <option value="6:00 am / 8:00 am">6:00 am / 8:00am</option>
                            <option value="8:00 am / 10:00 am">8:00 am / 10:00 am</option>
                            <option value="7:00 am / 8:00 am">7:00 am / 8:00 am </option>
                            <option value="8:00 am / 9:00 am">9:00 am / 10:00 am</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                         <select class="form-control" type="text" name="horas17">
                            <option value="6:00 am / 8:00 am">6:00 am / 8:00am</option>
                            <option value="8:00 am / 10:00 am">8:00 am / 10:00 am</option>
                            <option value="7:00 am / 8:00 am">7:00 am / 8:00 am </option>
                            <option value="8:00 am / 9:00 am">9:00 am / 10:00 am</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                    </div><br>
                    <div class="party">
                        <select class="form-control" type="text" name="horas21">
                            <option value="10:00 am / 12:00 pm">10:00 am / 12:00 pm</option>
                            <option value="12:00 pm / 2:00 pm">12:00 pm / 2:00 pm</option>
                            <option value="10:00 am / 11:00 am">10:00 am / 11:00 am </option>
                            <option value="11:00 am / 12:00 pm">11:00 am / 12:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas22">
                            <option value="10:00 am / 12:00 pm">10:00 am / 12:00 pm</option>
                            <option value="12:00 pm / 2:00 pm">12:00 pm / 2:00 pm</option>
                            <option value="10:00 am / 11:00 am">10:00 am / 11:00 am </option>
                            <option value="11:00 am / 12:00 pm">11:00 am / 12:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas23">
                            <option value="10:00 am / 12:00 pm">10:00 am / 12:00 pm</option>
                            <option value="12:00 pm / 2:00 pm">12:00 pm / 2:00 pm</option>
                            <option value="10:00 am / 11:00 am">10:00 am / 11:00 am </option>
                            <option value="11:00 am / 12:00 pm">11:00 am / 12:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas24">
                            <option value="10:00 am / 12:00 pm">10:00 am / 12:00 pm</option>
                            <option value="12:00 pm / 2:00 pm">12:00 pm / 2:00 pm</option>
                            <option value="10:00 am / 11:00 am">10:00 am / 11:00 am </option>
                            <option value="11:00 am / 12:00 pm">11:00 am / 12:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas25">
                            <option value="10:00 am / 12:00 pm">10:00 am / 12:00 pm</option>
                            <option value="12:00 pm / 2:00 pm">12:00 pm / 2:00 pm</option>
                            <option value="10:00 am / 11:00 am">10:00 am / 11:00 am </option>
                            <option value="11:00 am / 12:00 pm">11:00 am / 12:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas26">
                            <option value="10:00 am / 12:00 pm">10:00 am / 12:00 pm</option>
                            <option value="12:00 pm / 2:00 pm">12:00 pm / 2:00 pm</option>
                            <option value="10:00 am / 11:00 am">10:00 am / 11:00 am </option>
                            <option value="11:00 am / 12:00 pm">11:00 am / 12:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas27">
                            <option value="10:00 am / 12:00 pm">10:00 am / 12:00 pm</option>
                            <option value="12:00 pm / 2:00 pm">12:00 pm / 2:00 pm</option>
                            <option value="10:00 am / 11:00 am">10:00 am / 11:00 am </option>
                            <option value="11:00 am / 12:00 pm">11:00 am / 12:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        
                    </div><br>
                    <div class="party">
                        <select class="form-control" type="text" name="horas31">
                            <option value="2:00 pm / 4:00 pm">2:00 pm / 4:00 pm</option>
                            <option value="4:00 pm / 6:00 pm">4:00 pm / 6:00 pm</option>
                            <option value="12:00 pm / 1:00 pm ">12:00 pm / 1:00 pm </option>
                            <option value="1:00 pm / 2:00 pm">1:00 pm / 2:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas32">
                            <option value="2:00 pm / 4:00 pm">2:00 pm / 4:00 pm</option>
                            <option value="4:00 pm / 6:00 pm">4:00 pm / 6:00 pm</option>
                            <option value="12:00 pm / 1:00 pm ">12:00 pm / 1:00 pm </option>
                            <option value="1:00 pm / 2:00 pm">1:00 pm / 2:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas33">
                            <option value="2:00 pm / 4:00 pm">2:00 pm / 4:00 pm</option>
                            <option value="4:00 pm / 6:00 pm">4:00 pm / 6:00 pm</option>
                            <option value="12:00 pm / 1:00 pm ">12:00 pm / 1:00 pm </option>
                            <option value="1:00 pm / 2:00 pm">1:00 pm / 2:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas34">
                            <option value="2:00 pm / 4:00 pm">2:00 pm / 4:00 pm</option>
                            <option value="4:00 pm / 6:00 pm">4:00 pm / 6:00 pm</option>
                            <option value="12:00 pm / 1:00 pm ">12:00 pm / 1:00 pm </option>
                            <option value="1:00 pm / 2:00 pm">1:00 pm / 2:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas35">
                            <option value="2:00 pm / 4:00 pm">2:00 pm / 4:00 pm</option>
                            <option value="4:00 pm / 6:00 pm">4:00 pm / 6:00 pm</option>
                            <option value="12:00 pm / 1:00 pm ">12:00 pm / 1:00 pm </option>
                            <option value="1:00 pm / 2:00 pm">1:00 pm / 2:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas36">
                            <option value="2:00 pm / 4:00 pm">2:00 pm / 4:00 pm</option>
                            <option value="4:00 pm / 6:00 pm">4:00 pm / 6:00 pm</option>
                            <option value="12:00 pm / 1:00 pm ">12:00 pm / 1:00 pm </option>
                            <option value="1:00 pm / 2:00 pm">1:00 pm / 2:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas37">
                            <option value="2:00 pm / 4:00 pm">2:00 pm / 4:00 pm</option>
                            <option value="4:00 pm / 6:00 pm">4:00 pm / 6:00 pm</option>
                            <option value="12:00 pm / 1:00 pm ">12:00 pm / 1:00 pm </option>
                            <option value="1:00 pm / 2:00 pm">1:00 pm / 2:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        
                    </div><br>
                    <div class="party">
                        <select class="form-control" type="text" name="horas41">
                            <option value="6:00 pm / 8:00 pm">6:00 pm / 8:00 pm</option>
                            <option value="10:00 pm / 12:00 pm">10:00 pm / 12:00 pm</option>
                            <option value="2:00 pm / 3:00 pm ">2:00 pm / 3:00 pm </option>
                            <option value="3:00 pm / 4:00 pm">3:00 pm / 4:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas42">
                            <option value="6:00 pm / 8:00 pm">6:00 pm / 8:00 pm</option>
                            <option value="10:00 pm / 12:00 pm">10:00 pm / 12:00 pm</option>
                            <option value="2:00 pm / 3:00 pm ">2:00 pm / 3:00 pm </option>
                            <option value="3:00 pm / 4:00 pm">3:00 pm / 4:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas43">
                            <option value="6:00 pm / 8:00 pm">6:00 pm / 8:00 pm</option>
                            <option value="10:00 pm / 12:00 pm">10:00 pm / 12:00 pm</option>
                            <option value="2:00 pm / 3:00 pm ">2:00 pm / 3:00 pm </option>
                            <option value="3:00 pm / 4:00 pm">3:00 pm / 4:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas44">
                            <option value="6:00 pm / 8:00 pm">6:00 pm / 8:00 pm</option>
                            <option value="10:00 pm / 12:00 pm">10:00 pm / 12:00 pm</option>
                            <option value="2:00 pm / 3:00 pm ">2:00 pm / 3:00 pm </option>
                            <option value="3:00 pm / 4:00 pm">3:00 pm / 4:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas45">
                            <option value="6:00 pm / 8:00 pm">6:00 pm / 8:00 pm</option>
                            <option value="10:00 pm / 12:00 pm">10:00 pm / 12:00 pm</option>
                            <option value="2:00 pm / 3:00 pm ">2:00 pm / 3:00 pm </option>
                            <option value="3:00 pm / 4:00 pm">3:00 pm / 4:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas46">
                            <option value="6:00 pm / 8:00 pm">6:00 pm / 8:00 pm</option>
                            <option value="10:00 pm / 12:00 pm">10:00 pm / 12:00 pm</option>
                            <option value="2:00 pm / 3:00 pm ">2:00 pm / 3:00 pm </option>
                            <option value="3:00 pm / 4:00 pm">3:00 pm / 4:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas47">
                            <option value="6:00 pm / 8:00 pm">6:00 pm / 8:00 pm</option>
                            <option value="10:00 pm / 12:00 pm">10:00 pm / 12:00 pm</option>
                            <option value="2:00 pm / 3:00 pm ">2:00 pm / 3:00 pm </option>
                            <option value="3:00 pm / 4:00 pm">3:00 pm / 4:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        
                    </div><br>
                    <div class="party">
                        <select class="form-control" type="text" name="horas51">
                            <option value="1:00 am / 2:00 am">1:00 am / 2:00 am</option>
                            <option value="2:00 am / 4:00 am">2:00 am / 4:00 am</option>
                            <option value="4:00 pm / 5:00 pm ">4:00 pm / 5:00 pm </option>
                            <option value="5:00 am / 6:00 pm">5:00 am / 6:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas52">
                            <option value="1:00 am / 2:00 am">1:00 am / 2:00 am</option>
                            <option value="2:00 am / 4:00 am">2:00 am / 4:00 am</option>
                            <option value="4:00 pm / 5:00 pm ">4:00 pm / 5:00 pm </option>
                            <option value="5:00 am / 6:00 pm">5:00 am / 6:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas53">
                            <option value="1:00 am / 2:00 am">1:00 am / 2:00 am</option>
                            <option value="2:00 am / 4:00 am">2:00 am / 4:00 am</option>
                            <option value="4:00 pm / 5:00 pm ">4:00 pm / 5:00 pm </option>
                            <option value="5:00 am / 6:00 pm">5:00 am / 6:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas54">
                            <option value="1:00 am / 2:00 am">1:00 am / 2:00 am</option>
                            <option value="2:00 am / 4:00 am">2:00 am / 4:00 am</option>
                            <option value="4:00 pm / 5:00 pm ">4:00 pm / 5:00 pm </option>
                            <option value="5:00 am / 6:00 pm">5:00 am / 6:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas55">
                            <option value="1:00 am / 2:00 am">1:00 am / 2:00 am</option>
                            <option value="2:00 am / 4:00 am">2:00 am / 4:00 am</option>
                            <option value="4:00 pm / 5:00 pm ">4:00 pm / 5:00 pm </option>
                            <option value="5:00 am / 6:00 pm">5:00 am / 6:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas56">
                            <option value="1:00 am / 2:00 am">1:00 am / 2:00 am</option>
                            <option value="2:00 am / 4:00 am">2:00 am / 4:00 am</option>
                            <option value="4:00 pm / 5:00 pm ">4:00 pm / 5:00 pm </option>
                            <option value="5:00 am / 6:00 pm">5:00 am / 6:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas57">
                            <option value="1:00 am / 2:00 am">1:00 am / 2:00 am</option>
                            <option value="2:00 am / 4:00 am">2:00 am / 4:00 am</option>
                            <option value="4:00 pm / 5:00 pm ">4:00 pm / 5:00 pm </option>
                            <option value="5:00 am / 6:00 pm">5:00 am / 6:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        
                    </div><br>
                    <div class="party">
                        <select class="form-control" type="text" name="horas61">
                            <option value="4:00 am / 6:00 am">4:00 am / 6:00 am</option>
                            <option value="6:00 pm / 7:00 pm">6:00 pm / 7:00 pm</option>
                            <option value="7:00 pm / 8:00 pm">7:00 pm / 8:00 pm </option>
                            <option value="8:00 am / 9:00 pm">8:00 am / 9:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas62">
                            <option value="4:00 am / 6:00 am">4:00 am / 6:00 am</option>
                            <option value="6:00 pm / 7:00 pm">6:00 pm / 7:00 pm</option>
                            <option value="7:00 pm / 8:00 pm">7:00 pm / 8:00 pm </option>
                            <option value="8:00 am / 9:00 pm">8:00 am / 9:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas63">
                            <option value="4:00 am / 6:00 am">4:00 am / 6:00 am</option>
                            <option value="6:00 pm / 7:00 pm">6:00 pm / 7:00 pm</option>
                            <option value="7:00 pm / 8:00 pm">7:00 pm / 8:00 pm </option>
                            <option value="8:00 am / 9:00 pm">8:00 am / 9:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas64">
                            <option value="4:00 am / 6:00 am">4:00 am / 6:00 am</option>
                            <option value="6:00 pm / 7:00 pm">6:00 pm / 7:00 pm</option>
                            <option value="7:00 pm / 8:00 pm">7:00 pm / 8:00 pm </option>
                            <option value="8:00 am / 9:00 pm">8:00 am / 9:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas65">
                            <option value="4:00 am / 6:00 am">4:00 am / 6:00 am</option>
                            <option value="6:00 pm / 7:00 pm">6:00 pm / 7:00 pm</option>
                            <option value="7:00 pm / 8:00 pm">7:00 pm / 8:00 pm </option>
                            <option value="8:00 am / 9:00 pm">8:00 am / 9:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas66">
                            <option value="4:00 am / 6:00 am">4:00 am / 6:00 am</option>
                            <option value="6:00 pm / 7:00 pm">6:00 pm / 7:00 pm</option>
                            <option value="7:00 pm / 8:00 pm">7:00 pm / 8:00 pm </option>
                            <option value="8:00 am / 9:00 pm">8:00 am / 9:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        <select class="form-control" type="text" name="horas67">
                            <option value="4:00 am / 6:00 am">4:00 am / 6:00 am</option>
                            <option value="6:00 pm / 7:00 pm">6:00 pm / 7:00 pm</option>
                            <option value="7:00 pm / 8:00 pm">7:00 pm / 8:00 pm </option>
                            <option value="8:00 am / 9:00 pm">8:00 am / 9:00 pm</option>
                            <option value="Descanso">Descanso</option>
                            <option value="Libre">Libre</option>
                        </select>
                        
                    </div><br>

                    <center><input type="submit"  class="btn btn-success"  value="Aceptar"></center>

                </div>
            </form>
        </div>
    </body>
</html>
<%   } else {

        response.sendRedirect("/aut/JSP/Horarios.jsp");
    }
%>