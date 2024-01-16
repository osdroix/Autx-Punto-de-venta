/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Backend.CRUD;
import Backend.Validaciones;
import Entidades.empleado;
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
@WebServlet(name = "GuardarEmple", urlPatterns = {"/GuardarEmple"})
public class GuardarEmple extends HttpServlet {

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
           String base,usu,domi,tel,cod,nom,nom2, pass,corre,app,app2,sexo,a,d,m,supernom;
            a= request.getParameter("3");
            d= request.getParameter("1");
            m= request.getParameter("2");
            String Fecha = d+"/"+m+"/"+a;
            int num = Integer.parseInt(request.getParameter("id"));
            int edad = Integer.parseInt(request.getParameter("edad"));
            usu = request.getParameter("usu");
            base = request.getParameter("base");
            nom = request.getParameter("nombre");
            nom2 = request.getParameter("nombre2");
            supernom = nom+"_"+nom2;
            app = request.getParameter("app");
            app2 = request.getParameter("app2");
            corre = request.getParameter("correo");
           pass = request.getParameter("contra");
           String passcifrada=DigestUtils.md5Hex(pass);
            domi = request.getParameter("dire");
           tel= request.getParameter("tel");
           sexo = request.getParameter("sexo");
           cod = request.getParameter("cod");
           int valorEmail=Validaciones.validarCorreo(corre);
           int valorNom=Validaciones.validarUsername(nom);
            empleado e = new empleado();
            CRUD u=new CRUD();  
                if (u.validarEmple(usu) || u.validarregistro(usu) ) {
                        response.sendRedirect("/aut/avisos/Dashboard0.jsp?in=Nombre&error=Usuario en uso&img=/aut/img/409.gif");
                }else if (valorNom== 2) {
                    response.sendRedirect("/aut/avisos/Dashboard0.jsp?in=Nombre&error=SOLO LETRAS&img=/aut/img/409.gif");
                }else if (nom.trim().length()== 0) {
                    response.sendRedirect("/aut/avisos/Dashboard0.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if (corre.trim().length()== 0) {
                     response.sendRedirect("/aut/avisos/Dashboard0.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if(valorEmail==1){
                
                 response.sendRedirect("/aut/avisos/Dashboard0.jsp?in=correo invalido&error=El espacio de correo esta vacio&img=/aut/img/409.gif");
                 
                }else if(valorEmail==2){
                
                 response.sendRedirect("/aut/avisos/Dashboard0.jsp?in=correo invalido&error=Correo no valido&img=/aut/img/409.gif");
                }else if (pass.trim().length()== 0 ) {
                    response.sendRedirect("/aut/avisos/Dashboard0.jsp?in=Campos Vacios&error=Llena todos los campos&img=/aut/img/409.gif");
                }else if (pass.trim().length()< 3) {
                    response.sendRedirect("/aut/avisos/Dashboard0.jsp?in=password&error=passwords debe ser mayor a 3 caracteres&img=/aut/img/409.gif");
                
                }
                        e.setTipo(num);
                        e.setEdad(edad);
                        e.setUsuario(usu);
                        e.setNombre(supernom);
                        e.setCorreo(corre);
                        e.setTelefono(tel);
                        e.setDireccion(domi);
                        e.setPostal(cod);
                        e.setContra(passcifrada);
                        e.setFecha(Fecha);
                        e.setSexo(sexo);
                        e.setApp(app);
                        e.setApp2(app2);
                        int query = CRUD.guardarEmple(e);
                        int query1 = CRUD.guardarEmple2(e);
                  
                  response.sendRedirect("/aut/avisos/Dashboard0.jsp?in=Registro&error=Validado&id=2&img=/aut/img/auto2.gif");
                  out.println(" <script>alert('Registro Exitoso') </script>");
            
            
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
