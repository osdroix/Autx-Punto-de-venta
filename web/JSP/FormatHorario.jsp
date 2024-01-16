<%-- 
    Document   : FormatHorario
    Created on : 6/01/2021, 04:20:05 PM
    Author     : osdroix
--%>

<%@page import="Entidades.empleado"%>
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
<!DOCTYPE html>
<html>
    <%
            String nom,turno,hora1,hora2,hora3,hora4,hora5,hora6,hora7,
                              hora21,hora22,hora23,hora24,hora25,hora26,hora27,
                              hora31,hora32,hora33,hora34,hora35,hora36,hora37,
                              hora41,hora42,hora43,hora44,hora45,hora46,hora47,
                              hora51,hora52,hora53,hora54,hora55,hora56,hora57,
                              hora61,hora62,hora63,hora64,hora65,hora66,hora67;
            
            nom = request.getParameter("emple");
            turno = request.getParameter("turno");
            hora1 = request.getParameter("horas11");
            hora2 = request.getParameter("horas12");
            hora3 = request.getParameter("horas13");
            hora4 = request.getParameter("horas14");
            hora5 = request.getParameter("horas15");
            hora6 = request.getParameter("horas16");
            hora7 = request.getParameter("horas17");
            hora21 = request.getParameter("horas21");
            hora22 = request.getParameter("horas22");
            hora23 = request.getParameter("horas23");
            hora24 = request.getParameter("horas24");
            hora25 = request.getParameter("horas25");
            hora26 = request.getParameter("horas26");
            hora27 = request.getParameter("horas27");
            hora31 = request.getParameter("horas31");
            hora32 = request.getParameter("horas32");
            hora33 = request.getParameter("horas33");
            hora34 = request.getParameter("horas34");
            hora35 = request.getParameter("horas35");
            hora36 = request.getParameter("horas36");
            hora37 = request.getParameter("horas37");
            hora41 = request.getParameter("horas41");
            hora42 = request.getParameter("horas42");
            hora43 = request.getParameter("horas43");
            hora44 = request.getParameter("horas44");
            hora45 = request.getParameter("horas45");
            hora46 = request.getParameter("horas46");
            hora47 = request.getParameter("horas47");
            hora51 = request.getParameter("horas51");
            hora52 = request.getParameter("horas52");
            hora53 = request.getParameter("horas53");
            hora54 = request.getParameter("horas54");
            hora55 = request.getParameter("horas55");
            hora56 = request.getParameter("horas56");
            hora57 = request.getParameter("horas57");
            hora61 = request.getParameter("horas61");
            hora62 = request.getParameter("horas62");
            hora63 = request.getParameter("horas63");
            hora64 = request.getParameter("horas64");
            hora65 = request.getParameter("horas65");
            hora66 = request.getParameter("horas66");
            hora67 = request.getParameter("horas67");
        %>
    <head>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
        <title>
		<%out.println(nom);%>
	</title>
    </head>
    <body class="lo">
        <div id="invoice">
           <div align="center">
            <div class="hoja">
                        <h1>Horario
                        </h1>
                        <hr class="azul">
                <div class="party">
                    <button class="btn btn-link" id="download">
                        <img class="img-fluid" alt="Responsive image"src="/aut/img/pdf.png"width="125" height="125"/>
                    </button>
                    <div class="encabezado">
                        <h4 align="right">Turno: <%out.println(turno);%><br>
                                          Empledo: <%out.println(nom);%></h4>
                    </div>
                </div>
                    <table class="table table-striped">
                        <thead>
                            <TR>
                                    <TD>Lunes</TD> 
                                    <TD>Martes</TD> 
                                    <TD>Miercoles</TD> 
                                    <TD>Juevez</TD> 
                                    <TD>Viernes</TD> 
                                    <TD>Sabado</TD> 
                                    <TD>Domingo</TD>
                            </TR>
                            <TR>
                                    <TD><%out.println(hora1);%></TD>
                                    <TD><%out.println(hora2);%></TD>
                                    <TD><%out.println(hora3);%></TD>
                                    <TD><%out.println(hora4);%></TD>
                                    <TD><%out.println(hora5);%></TD>
                                    <TD><%out.println(hora6);%></TD>
                                    <TD><%out.println(hora7);%></TD>
                            </TR>
                             <TR>
                                    <TD><%out.println(hora21);%></TD>
                                    <TD><%out.println(hora22);%></TD>
                                    <TD><%out.println(hora23);%></TD>
                                    <TD><%out.println(hora24);%></TD>
                                    <TD><%out.println(hora25);%></TD>
                                    <TD><%out.println(hora26);%></TD>
                                    <TD><%out.println(hora27);%></TD>
                            </TR>
                            <TR>
                                    <TD><%out.println(hora31);%></TD>
                                    <TD><%out.println(hora32);%></TD>
                                    <TD><%out.println(hora33);%></TD>
                                    <TD><%out.println(hora34);%></TD>
                                    <TD><%out.println(hora35);%></TD>
                                    <TD><%out.println(hora36);%></TD>
                                    <TD><%out.println(hora37);%></TD>
                            </TR>
                             <TR>
                                    <TD><%out.println(hora41);%></TD>
                                    <TD><%out.println(hora42);%></TD>
                                    <TD><%out.println(hora43);%></TD>
                                    <TD><%out.println(hora44);%></TD>
                                    <TD><%out.println(hora45);%></TD>
                                    <TD><%out.println(hora46);%></TD>
                                    <TD><%out.println(hora47);%></TD>
                            </TR>
                            <TR>
                                    <TD><%out.println(hora51);%></TD>
                                    <TD><%out.println(hora52);%></TD>
                                    <TD><%out.println(hora53);%></TD>
                                    <TD><%out.println(hora54);%></TD>
                                    <TD><%out.println(hora55);%></TD>
                                    <TD><%out.println(hora56);%></TD>
                                    <TD><%out.println(hora57);%></TD>
                            </TR>
                             <TR>
                                    <TD><%out.println(hora61);%></TD>
                                    <TD><%out.println(hora62);%></TD>
                                    <TD><%out.println(hora63);%></TD>
                                    <TD><%out.println(hora64);%></TD>
                                    <TD><%out.println(hora65);%></TD>
                                    <TD><%out.println(hora66);%></TD>
                                    <TD><%out.println(hora67);%></TD>
                            </TR>
                        </thead>
                    </table>
            </div>
            </div>
        </div>
    </div>
    </body>
    <script>
        window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const invoice = this.document.getElementById("invoice");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 0,
                filename: 'Horario.pdf',
               image:        { type: 'jpeg', quality: 0.98 },
        jsPDF:        { unit: 'in', format: 'a4', orientation: 'portrait' },
        html2canvas:  { scale: 2 },
        pagebreak: { mode: ['css', 'legacy'], after: '.breakme' }
                      };
            html2pdf().from(invoice).set(opt).save();
        })
}
    </script>
</html>
<%   } else {

        response.sendRedirect("/aut/JSP/Horarios.jsp");
    }
%>
