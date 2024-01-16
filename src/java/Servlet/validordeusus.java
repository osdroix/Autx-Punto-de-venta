package Servlet;

import Backend.CRUD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.json.Json;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "validordeusus", urlPatterns = {"/validordeusus"})
public class validordeusus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
                    try (PrintWriter jsonOut = response.getWriter()) {
                String usuario = request.getParameter("Usu");
                String correo = request.getParameter("correo");

                System.out.println("Usuario recibido pollo: " + usuario);
                System.out.println("Correo recibido pollo: " + correo);

                boolean usuarioExistente = false;
                boolean correoExistente = false;
                boolean usuarioExistentea = false;
                boolean correoExistentea = false;

                try {
                    CRUD crud = new CRUD();
                    usuarioExistente = crud.validarusu(usuario);
                    correoExistente = crud.validarcorre(correo);
                    usuarioExistentea = crud.validarusuA(usuario);
                    correoExistentea = crud.validarcorreA(correo);

                } catch (Exception e) {
                    // Manejo de excepciones, por ejemplo, registro de errores
                    e.printStackTrace();
                }

                JsonObject jsonResponse = Json.createObjectBuilder()
                        .add("usuarioExistente", (usuarioExistente && !usuarioExistentea) || (!usuarioExistente && usuarioExistentea))
                        .add("correoExistente", (correoExistente && !correoExistentea) || (!correoExistente && correoExistentea))
                        .build();

                jsonOut.print(jsonResponse.toString());
            } catch (IOException e) {
                // Manejo de excepciones al escribir la respuesta
                e.printStackTrace();
            }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Validación de Usuario y Correo";
    }
}
