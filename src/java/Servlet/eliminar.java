/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Backend.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author osdroix
 */
@WebServlet(name = "eliminar", urlPatterns = {"/eliminar"})
public class eliminar extends HttpServlet {

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
     /* verificar usu*/
            int id2= Integer.parseInt(request.getParameter("ID2"));
            int id= Integer.parseInt(request.getParameter("ID"));
            int num= Integer.parseInt(request.getParameter("NUM"));
            Statement set = null;
            if (num == 1 ) {
                try{
                    Connection con = Conexion.getConnection();
                    set = con.createStatement();
                    
                      int editar = set.executeUpdate(""
                            + "DELETE from cliente where Id_usu_cliente="+id2+"");
                      int editar1 = set.executeUpdate(""
                            + "DELETE from usuario_cliente where Id_usu_cliente="+id2+"");
                            response.sendRedirect("/aut/Administrador/usuarios.jsp");
                            con.close(); 
                }catch(Exception e){
                            System.out.println("NO hay tablita :'v");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());

                    e.printStackTrace();
                }
            }else if (num == 2) {
                try{
                    Connection con = Conexion.getConnection();
                    set = con.createStatement();
                      int editar = set.executeUpdate(""
                            + "DELETE from empleado where Id_emple="+id2);
                      int editar1 = set.executeUpdate(""
                            + "DELETE from usuario_empleado where Id_usu_emple="+id2);
                      response.sendRedirect("/aut/Administrador/empleados.jsp");
                    con.close(); 
                }catch(Exception e){
                    System.out.println(num);
                            System.out.println("NO hay tablita :'v");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());

                    e.printStackTrace();
                }
                
                }else if (num == 58 ) {
                try{
                    Connection con = Conexion.getConnection();
                    set = con.createStatement();
                    
                      int editar = set.executeUpdate(""
                            + "DELETE from cliente where Id_usu_cliente="+id2+"");
                      int editar1 = set.executeUpdate(""
                            + "DELETE from usuario_cliente where Id_usu_cliente="+id2+"");
                            response.sendRedirect("/aut/Super-Admin/usuarios.jsp");
                            con.close(); 
                }catch(Exception e){
                            System.out.println("NO hay tablita :'v");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());

                    e.printStackTrace();
                }
            }else if (num == 78) {
                try{
                    Connection con = Conexion.getConnection();
                    set = con.createStatement();
                      int editar = set.executeUpdate(""
                            + "DELETE from empleado where Id_emple="+id);
                      int editar1 = set.executeUpdate(""
                            + "DELETE from usuario_empleado where Id_usu_emple="+id);
                      response.sendRedirect("/aut/Super-Admin/empleados.jsp");
                    con.close(); 
                }catch(Exception e){
                    System.out.println(num);
                            System.out.println("NO hay tablita :'v");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());

                    e.printStackTrace();
                }
                
                }else if (num == 5) {
                try{
                    Connection con = Conexion.getConnection();
                    set = con.createStatement();
                      int editar = set.executeUpdate(""
                            + "DELETE from empleado where Id_emple="+id);
                      int editar1 = set.executeUpdate(""
                            + "DELETE from usuario_empleado where Id_usu_emple="+id);
                      response.sendRedirect("/aut/Super-Admin/administradores.jsp");
                    con.close(); 
                }catch(Exception e){
                    System.out.println(num);
                            System.out.println("NO hay tablita :'v");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());

                    e.printStackTrace();
                }
                
                }else if (num == 10001) {
                try{
                    Connection con = Conexion.getConnection();
                    set = con.createStatement();
                      int editar = set.executeUpdate(""
                            + "DELETE from productos where Id_producto="+id2);
                      response.sendRedirect("/aut/JSP/CRUD_P.jsp");
                    con.close(); 
                }catch(Exception e){
                    System.out.println(num);
                            System.out.println("NO hay tablita :'v");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());

                    e.printStackTrace();
                }
                
                }else if (num == 666) {
                try{
                    Connection con = Conexion.getConnection();
                    set = con.createStatement();
                      int editar = set.executeUpdate(""
                            + "DELETE from proveedor_prod where id_prove="+id2);
                      response.sendRedirect("/aut/JSP/CRUD_P.jsp");
                    con.close(); 
                }catch(Exception e){
                    System.out.println(num);
                            System.out.println("NO hay tablita :'v");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());

                    e.printStackTrace();
                }
        }
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
