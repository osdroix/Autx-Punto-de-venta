/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entidades.empleado;
import Entidades.usuarios;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "InicioSesion", urlPatterns = {"/InicioSesion"})
public class InicioSesion extends HttpServlet {

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
           String nom = request.getParameter("NOMBRE");
            String contraseña = request.getParameter("CONTRA"); 
            String passcifrada=DigestUtils.md5Hex(contraseña);
            System.out.println(passcifrada);
            usuarios u = new usuarios();
            u = u.Validarusuario(nom, passcifrada);
            empleado e = new empleado();
            e = e.Validarempleado(nom, passcifrada);
          
            
           if (u!=null) {
                HttpSession sesionOk=request.getSession();
                sesionOk.setAttribute("user", u);
                usuarios x=(usuarios)sesionOk.getAttribute("user");
                System.out.print(x);
                
                if (u.getTipo() == 1) {
                    response.sendRedirect("/aut/Clientes/main.jsp");
                
                }response.sendRedirect("/aut/avisos/Dashboard.jsp?in=Usuario &error=Usuario no registrado&img=/aut/img/error.png");
            }else if (e!=null) {
                HttpSession sesionOk=request.getSession();
                sesionOk.setAttribute("user", e);
                empleado x=(empleado)sesionOk.getAttribute("user");
                System.out.print(x);
                
                if (e.getTipo() == 2) {
                     response.sendRedirect("/aut/avisos/Dashboard1.jsp?in=Inicio De Sesion &error=Exitosa&img=/aut/img/lohizomiamor.gif");
                
                }else if (e.getTipo() == 3) {
                     response.sendRedirect("/aut/avisos/Dashboard2.jsp?in=Inicio De Sesion &error=Exitosa&img=/aut/img/adm.gif");
                
                }else if (e.getTipo() == 4) {
                     response.sendRedirect("/aut/Super-Admin/usuarios.jsp");
                
                }
            }response.sendRedirect("/aut/avisos/Dashboard.jsp?in=Usuario &error=Usuario no registrado&img=/aut/img/error.png");
           
        }catch(Exception c){
            
         System.out.println(c.getMessage());
                System.out.println(c.getStackTrace());
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
