/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Backend.Conexion;
import Backend.Validaciones;
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
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author osdroix
 */
@WebServlet(name = "editarusu", urlPatterns = {"/editarusu"})
public class editarusu extends HttpServlet {

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
                int num2;
                String nom,contra,correo,edad,usu,num,app,app2;
                num = request.getParameter("id");
                nom = request.getParameter("nombre");
                app = request.getParameter("apellido");
                app2 = request.getParameter("apellido2");
                usu = request.getParameter("Usu");
                contra= request.getParameter("contra");
                String passcifrada=DigestUtils.md5Hex(contra);
                correo= request.getParameter("correo");                
                edad= request.getParameter("edad");
                int valorEmail=Validaciones.validarCorreo(correo);
                int valorNom=Validaciones.validarUsername(nom);
                
                if (valorNom== 2) {
                    response.sendRedirect("/aut/avisos/ErrorSesion.jsp?in=Nombre&error=SOLO LETRAS&img=/aut/img/409.gif");
                }else if (nom.trim().length()== 0) {
                    response.sendRedirect("/aut/avisos/ErrorSesion.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if (contra.trim().length()== 0) {
                     response.sendRedirect("/aut/avisos/ErrorSesion.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if(valorEmail==1){
                
                 response.sendRedirect("/aut/avisos/ErrorSesion.jsp?in=correo invalido&error=El espacio de correo esta vacio&img=/aut/img/409.gif");
                 
                }else if(valorEmail==2){
                
                 response.sendRedirect("/aut/avisos/ErrorSesion.jsp?in=correo invalido&error=Correo no valido&img=/aut/img/409.gif");
                }else if (contra.trim().length()< 4 ) {
                   response.sendRedirect("/aut/avisos/ErrorSesion.jsp?in=password&error=passwords debe ser mayor a 3 caracteres&img=/aut/img/409.gif");
                
                }else{
                    
                    String o="Update cliente set Nom_cliente='"+usu+"',Contra_cliente='"+passcifrada+"'where Id_usu_cliente='"+num+"'";
                    
                    String q="Update usuario_cliente set Nom_usu_cliente='"+nom+"',App_usu_cliente='"+app+"',App2_usu_cliente='"+app2+"',"
                        + "Correo_usu_cliente='"+correo+"',Edad_usu_cliente='"+edad+"'where Id_usu_cliente='"+num+"'";
                    
                
                set.executeUpdate(q);
                set.executeUpdate(o);
                HttpSession sesion=request.getSession();
                sesion.removeAttribute("user");
                sesion.invalidate();
                response.sendRedirect("/aut/avisos/Dashboard.jsp?in=Actualizando&error=Datos&img=/aut/img/hp.jpg");
                System.out.println(num);
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
