/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Backend.CRUD;
import Entidades.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author osdroix
 */
@WebServlet(name = "Guardarproducto", urlPatterns = {"/Guardarproducto"})
public class Guardarproducto extends HttpServlet {

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
           String nom,fecha,fecha1,fecha2,img,aaddmm;
            int cantidad,identificador,prove;
            
            
            identificador = Integer.parseInt(request.getParameter("id_tipo"));
            nom = request.getParameter("nombre");
            prove = Integer.parseInt(request.getParameter("prove"));
            double precio = Double.parseDouble(request.getParameter("prec"));
            fecha = request.getParameter("fecha");
            fecha1 = request.getParameter("fecha1");
            fecha2 = request.getParameter("fecha2");
            img = request.getParameter("img");
            aaddmm = fecha+"-"+fecha1+"-"+fecha2;
            cantidad = Integer.parseInt(request.getParameter("cant"));
            Producto e = new Producto();
            System.out.print("ñdslkjfdjh gih"+prove);
            CRUD u=new CRUD(); 
            
                
                 if (nom.trim().length()== 0) {
                    response.sendRedirect("/aut/avisos/Productos.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif&link=/aut/JSP/CRUD_P.jsp");
                }else if (img.trim().length()== 0) {
                     response.sendRedirect("/aut/avisos/Productos.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif&link=/aut/JSP/CRUD_P.jsp");
                }else {
                        
                        
                        e.setNombre(nom);
                        e.setFecha(aaddmm);
                        e.setId_prove(prove);
                        e.setId_tipo(identificador);
                        e.setNum_cantidad(cantidad);
                        e.setPrecio(precio);
                        e.setDescripcion(img);
                        int query = CRUD.guardarProductos(e); 
                
            
                  response.sendRedirect("/aut/avisos/Productos.jsp?in=producto&error=Registro validado&img=/aut/img/auto2.gif&link=/aut/JSP/CRUD_P.jsp");
            }
            
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
