/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Backend.Conexion;
import Backend.Validaciones;
import Entidades.empleado;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author osdroix
 */
@WebServlet(name = "editaradm", urlPatterns = {"/editaradm"})
public class editaradm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
     try {
        Statement set = null;
        Connection con = Conexion.getConnection();
        set = con.createStatement();
               empleado e = new empleado();
                String nom,contra,correo,tel,usu,num,app,app2;
                int edad;
                num = request.getParameter("id");
                nom = request.getParameter("nom");
                app = request.getParameter("app");
                app2 = request.getParameter("app2");
                usu = request.getParameter("usu");
                contra= request.getParameter("contra");
                edad = Integer.parseInt(request.getParameter("edad"));
           String passcifrada=DigestUtils.md5Hex(contra);
                correo= request.getParameter("corre");                
                tel= request.getParameter("tel");
                int valorEmail=Validaciones.validarCorreo(correo);
                int valorNom=Validaciones.validarUsername(nom);
                
                if (valorNom== 2) {
                    response.sendRedirect("/aut/avisos/Dashboardexito.jsp?in=Nombre&error=SOLO LETRAS&img=/aut/img/409.gif");
                }else if (nom.trim().length()== 0) {
                    response.sendRedirect("/aut/avisos/Dashboardexito.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if (contra.trim().length()== 0) {
                     response.sendRedirect("/aut/avisos/Dashboardexito.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if (contra.trim().length()< 3 ) {
                     response.sendRedirect("/aut/avisos/Dashboardexito.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if(valorEmail==1){
                
                 response.sendRedirect("/aut/avisos/Dashboardexito.jsp?in=correo invalido&error=El espacio de correo esta vacio&img=/aut/img/409.gif");
                 
                }else if(valorEmail==2){
                
                 response.sendRedirect("/aut/avisos/Dashboardexito.jsp?in=correo invalido&error=Correo no valido&img=/aut/img/409.gif");
                }else if (contra.trim().length()< 3 ) {
                    response.sendRedirect("/aut/avisos/Dashboardexito.jsp?in=password&error=passwords debe ser mayor a 3 caracteres&img=/aut/img/409.gif");
                
                }else{
                    String q="Update usuario_empleado set Nom_usu_emple='"+nom+"',App_usu_emple='"+app+"',App2_usu_emple='"+app2+"',"
                        + "Correo_usu_emple='"+correo+"',Edad_usu_emple='"+edad+"' where Id_usu_emple='"+num+"'";
                    String o="Update empleado set Usuario_emple='"+usu+"',contra_emple='"+passcifrada+"',"
                        + "Telefono_emple='"+tel+"' where Id_emple='"+num+"'";
                
                set.executeUpdate(q);
                set.executeUpdate(o);
                response.sendRedirect("/aut/avisos/Dashboard.jsp?in=Actualizando&error=Datos&img=/aut/img/hp.jpg");
                }
            } catch (SQLException ex) {
                Logger.getLogger(editaradm.class.getName()).log(Level.SEVERE, null, ex);
            }
                
                    System.out.println("cambios con exito");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
