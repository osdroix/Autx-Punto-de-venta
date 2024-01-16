/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Backend.Conexion;
import Backend.Validaciones;
import Entidades.empleado;
import Entidades.proveedores;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
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
@WebServlet(name = "EDITARP", urlPatterns = {"/EDITARP"})
public class EDITARP extends HttpServlet {

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
               proveedores e = new proveedores();
                String nom_empre_prove,nom_prove,direc_empre_prove,num_prove,id;
                id = request.getParameter("id");
                nom_empre_prove = request.getParameter("nom_empre_prove");
                nom_prove = request.getParameter("nom_prove");
                direc_empre_prove = request.getParameter("direc_empre_prove");
                num_prove = request.getParameter("num_prove");
                LocalDate fechaActual = LocalDate.now();

                    String q="Update proveedor_prod set nom_empre_prove='"+nom_empre_prove+"',nom_prove='"+nom_prove+"',direc_empre_prove='"+direc_empre_prove+"',"
                        + "num_prove='"+num_prove+"',update_prov='"+fechaActual.toString()+"' where id_prove='"+id+"'";
                    
                set.executeUpdate(q);
                response.sendRedirect("/aut/Administrador/prove.jsp");
                
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
