/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Backend.CRUD;
import Backend.Validaciones;
import Entidades.usuarios;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "GuardarUsus", urlPatterns = {"/GuardarUsus"})
public class GuardarUsus extends HttpServlet {

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
                    String nom, pass,corre,apell,apell2,sexo,les;
            int edad,id;
            
            nom = request.getParameter("nombre");
            apell = request.getParameter("apellido");
            apell2 = request.getParameter("apellido2");
           corre = request.getParameter("correo")     ;
           edad = Integer.parseInt(request.getParameter("edad"));
           pass = request.getParameter("contra");
           String passcifrada=DigestUtils.md5Hex(pass);
           les = request.getParameter("Usu");  
           sexo = request.getParameter("sexo");
           id = Integer.parseInt(request.getParameter("id"));
           int valorEmail=Validaciones.validarCorreo(corre);
           int valorNom=Validaciones.validarUsername(nom);
            usuarios e = new usuarios();
            CRUD u=new CRUD(); 
            
                
                if (u.validarEmple(les) || u.validarregistro(les) ) {
                        response.sendRedirect("/aut/avisos/Dashboard.jsp?in=Nombre&error=Usuario en uso&img=/aut/img/409.gif");
                }else if (valorNom== 2) {
                    response.sendRedirect("/aut/avisos/Dashboard.jsp?in=Nombre&error=SOLO LETRAS&img=/aut/img/409.gif");
                }else if (nom.trim().length()== 0) {
                    response.sendRedirect("/aut/avisos/Dashboard.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if (corre.trim().length()== 0) {
                     response.sendRedirect("/aut/avisos/Dashboard.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if (pass.trim().length()== 0 ) {
                    response.sendRedirect("/aut/avisos/Dashboard.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if (pass.trim().length()< 3) {
                    response.sendRedirect("/aut/avisos/Dashboard.jsp?in=password&error=passwords debe ser mayor a 3 caracteres&img=/aut/img/409.gif");
                
                }else if(valorEmail==1){
                
                 response.sendRedirect("/aut/avisos/Dashboard.jsp?in=correo invalido&error=El espacio de correo esta vacio&img=/aut/img/409.gif");
                 
                }else if(valorEmail==2){
                
                 response.sendRedirect("/aut/avisos/Dashboard.jsp?in=correo invalido&error=Correo no valido&img=/aut/img/409.gif");
                }else if (edad < 15 ) {
                    response.sendRedirect("/aut/avisos/Dashboard.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if (edad > 80) {
                    response.sendRedirect("/aut/avisos/Dashboard.jsp?in=password&error=passwords debe ser mayor a 3 caracteres&img=/aut/img/409.gif");
                
                }else {
                        
                        
                        e.setNombre(nom);
                        e.setApellido(apell);
                        e.setApellido2(apell2);
                        e.setSexo(sexo);
                        e.setCorreo(corre);
                        e.setEdad(edad);
            e.setTipo(id);
            e.setContra(passcifrada);
            e.setUsuario(les);
                        int query = CRUD.guardar(e);
                        int query1 = CRUD.guardar2(e); 
                
            
                  response.sendRedirect("/aut/avisos/Dashboard.jsp?in=Bienvenido&error=Registro validado&img=/aut/img/fuego.gif");
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
