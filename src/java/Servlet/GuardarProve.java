/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Backend.CRUD;
import Backend.Validaciones;
import Entidades.proveedores;
import Entidades.usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
@WebServlet(name = "GuardarProve", urlPatterns = {"/GuardarProve"})
public class GuardarProve extends HttpServlet {

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
                    String nom_empre,nom_prove,direc_empre,num_prove;
                    
            
                    nom_empre = request.getParameter("nom_empre_prove");
                    nom_prove = request.getParameter("nom_prove");
                    direc_empre = request.getParameter("direc_empre_prove");
                    num_prove = request.getParameter("num_prove");
                    LocalDate fechaActual = LocalDate.now();
                    
                    proveedores e = new proveedores();
                    CRUD u=new CRUD(); 
                    e.setNom_ep(nom_empre);
                    e.setNom_p(nom_prove);
                    e.setDirec_e(direc_empre);
                    e.setNum_prove(num_prove);
                    e.setCreate(fechaActual.toString());

                    int query = CRUD.guardarProve(e); 
                    response.sendRedirect("/aut/Administrador/prove.jsp");

            
         }catch(Exception d){
         System.out.println("Se escapo el maldito ¬¬");
         System.out.println(d.getMessage());
             System.out.println(d.getStackTrace());
    
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
