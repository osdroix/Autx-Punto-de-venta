/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Backend.Conexion;
import Entidades.Producto;
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

/**
 *
 * @author osdroix
 */
@WebServlet(name = "editarproductos", urlPatterns = {"/editarproductos"})
public class editarproductos extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
      try {
        Statement set = null;
        Connection con = Conexion.getConnection();
        set = con.createStatement();
              String nom,fecha,fecha1,fecha2,img,aaddmm,identificador;
            int cantidad,id_prove;
            
            identificador = request.getParameter("id");
            nom = request.getParameter("nombre");
            double precio = Double.parseDouble(request.getParameter("prec"));
            fecha = request.getParameter("fecha");
            fecha1 = request.getParameter("fecha1");
            fecha2 = request.getParameter("fecha2");
            img = request.getParameter("img");
            aaddmm = fecha+"-"+fecha1+"-"+fecha2;
            cantidad = Integer.parseInt(request.getParameter("cant"));
            id_prove = Integer.parseInt(request.getParameter("id_prove"));
            Producto e = new Producto();
                
                if (nom.trim().length()== 0) {
                    response.sendRedirect("/aut/JSP/CRUD_P.jsp");
                }else if (img.trim().length()== 0) {
                    response.sendRedirect("/aut/JSP/CRUD_P.jsp");
                }else if (cantidad == 0) {
                    response.sendRedirect("/aut/JSP/CRUD_P.jsp");
                }else if (precio == 0) {
                    response.sendRedirect("/aut/JSP/CRUD_P.jsp");
                }else {
                    String q="Update productos set Nom_producto='"+nom+"',Fecha_producto='"+aaddmm+"',Precio_producto='"+precio+"',"
                        + "Num_producto='"+cantidad+"',Descripcion_producto='"+img+"',id_prove='"+id_prove+"' where Id_producto='"+identificador+"'";
                
                set.executeUpdate(q);
                
                                     response.sendRedirect("/aut/avisos/Productos.jsp?in=Producto&error=Registro validado&img=/aut/img/auto2.gif&link=/aut/JSP/CRUD_P.jsp");

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
