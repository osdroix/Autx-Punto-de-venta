  
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Backend.CRUD;
import Entidades.tiquet;
import Entidades.usuarios;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Carrito;
import modeloDA.ProductoDa;

/**
 *
 * @author osdroix
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
ProductoDa da = new ProductoDa();
    List<modelo.Producto> productos = new ArrayList<>();
    modelo.Producto p = new modelo.Producto();
    tiquet c = new tiquet();

    List<Carrito> listaCarrito = new ArrayList<>();
    LocalDate fechado = LocalDate.now();
    int item;
    double total = 0.0;
    int cantidad =1;
    int idp;
    int id_cliente = 0;
    Carrito car;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
       
        String accion = request.getParameter("accion");
        productos = da.listar();
        
        switch(accion){
            case "AgregarCarrito":
                int pos = 0;
                cantidad = 1;
                idp = Integer.parseInt(request.getParameter("id"));
                p = da.listarId(idp);

                // Verificar si hay suficientes existencias en la base de datos
                if (p.getNum() < cantidad) {
                    // Mostrar una alerta en caso de insuficientes existencias
                    String mensaje = "No hay suficientes existencias disponibles para este producto.";
                    request.setAttribute("mensaje", mensaje);
                    request.setAttribute("tipoMensaje", "error"); // Puedes usar este tipo para aplicar estilos diferentes en tu alerta
                } else {
                    if (listaCarrito.size() > 0) {
                        for (int i = 0; i < listaCarrito.size(); i++) {
                            if (idp == listaCarrito.get(i).getIdProducto()) {
                                pos = i;
                            }
                        }
                        if (idp == listaCarrito.get(pos).getIdProducto()) {
                            cantidad = listaCarrito.get(pos).getCantidad() + cantidad;

                            // Verificar si la cantidad supera las existencias disponibles en la base de datos
                            if (cantidad > p.getNum()) {
                                // Mostrar una alerta en caso de exceder existencias
                                String mensaje = "No hay suficientes existencias disponibles para este producto.";
                                request.setAttribute("mensaje", mensaje);
                                request.setAttribute("tipoMensaje", "error");
                            } else {
                                double subtotal = listaCarrito.get(pos).getPrecioCompra() * cantidad;
                                listaCarrito.get(pos).setCantidad(cantidad);
                                listaCarrito.get(pos).setSubTotal(subtotal);
                            }
                        } else {
                            item = item + 1;
                            car = new Carrito();
                            car.setItem(item);
                            car.setIdProducto(p.getId());
                            car.setNombres(p.getNombre());
                            car.setDescripcion(p.getDescripcion());
                            car.setPrecioCompra(p.getPrecio());
                            car.setCantidad(cantidad);
                            car.setSubTotal(cantidad * p.getPrecio());
                            listaCarrito.add(car);
                        }
                    } else {
                        item = item + 1;
                        car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(p.getId());
                        car.setNombres(p.getNombre());
                        car.setDescripcion(p.getDescripcion());
                        car.setPrecioCompra(p.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubTotal(cantidad * p.getPrecio());
                        listaCarrito.add(car);
                    }
                }

                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
            break;
            case "Carrito":
               total =0.0;
               request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    total = total + listaCarrito.get(i).getSubTotal();
                }
               request.setAttribute("total", total);
               request.setAttribute("contador", listaCarrito.size());
               request.getRequestDispatcher("Clientes/carrito.jsp").forward(request, response);
            break;
            
            case "Carrito-empleado":
               total =0.0;
               request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    total = total + listaCarrito.get(i).getSubTotal();
                }
               request.setAttribute("total", total);
               request.setAttribute("contador", listaCarrito.size());
               request.getRequestDispatcher("Empleados/Montos.jsp").forward(request, response);
               break;
               
            case "Comprar":
                total =0.0;
                idp= Integer.parseInt(request.getParameter("id"));
                p= da.listarId(idp);
                item = item+1;
                car = new Carrito();
                car.setItem(item);;
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombre());;
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad*p.getPrecio());
                listaCarrito.add(car);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    total = total + listaCarrito.get(i).getSubTotal();
                }
                request.setAttribute("total", total);
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Empledaos/Montos.jsp").forward(request, response);
            break;
            case "Delete":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdProducto() == idproducto) {
                        Carrito car = listaCarrito.get(i);

                        // Actualizar cantidad y subtotal
                        if (car.getCantidad() > 1) {
                            car.setCantidad(car.getCantidad() - 1);
                            car.setSubTotal(car.getPrecioCompra() * car.getCantidad());
                        } else {
                            listaCarrito.remove(i);
                        }

                        break;  // No es necesario seguir iterando una vez que se encuentra el producto
                    }
                }

                // Recalcular el total
                double nuevoTotal = 0.0;
                for (Carrito car : listaCarrito) {
                    nuevoTotal += car.getSubTotal();
                }
                total = nuevoTotal;

                // Actualizar atributos y redirigir
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("total", total);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Clientes/carrito.jsp").forward(request, response);
            break;
            case "Delete-empleado":
                int idproductos = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdProducto() == idproductos) {
                        Carrito car = listaCarrito.get(i);

                        // Actualizar cantidad y subtotal
                        if (car.getCantidad() > 1) {
                            car.setCantidad(car.getCantidad() - 1);
                            car.setSubTotal(car.getPrecioCompra() * car.getCantidad());
                        } else {
                            listaCarrito.remove(i);
                        }

                        break;  // No es necesario seguir iterando una vez que se encuentra el producto
                    }
                }

                // Recalcular el total
                double nuevoTotalE = 0.0;
                for (Carrito car : listaCarrito) {
                    nuevoTotalE += car.getSubTotal();
                }
                total = nuevoTotalE;

                // Actualizar atributos y redirigir
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("total", total);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Clientes/carrito.jsp").forward(request, response);
            break;
            case "IniciarCompra":
                request.setAttribute("total", total);
                id_cliente = Integer.parseInt(request.getParameter("id"));
                total = Double.parseDouble(request.getParameter("total"));
                request.getRequestDispatcher("PagosTarjeta.jsp").forward(request, response);
                break;
                
            case "GenerarCompra":
                LocalDate fecha = LocalDate.now();
                String produc, Nom, Cant, SubTotal, product, DATO;
                produc = " ";
                product = " ";
                Nom = " ";
                Cant = " ";
                SubTotal = " ";
                double monto;
                DATO = " " + fecha;
                int id_emple = Integer.parseInt(request.getParameter("id"));

                for (int i = 0; i < listaCarrito.size(); i++) {
                    produc += listaCarrito.get(i).getCantidad() +
                            "&nbsp;" + listaCarrito.get(i).getNombres() +
                            "........." +
                            listaCarrito.get(i).getPrecioCompra() * listaCarrito.get(i).getCantidad() + "MXN" + "\n<br>";
                }
                for (int ñ = 0; ñ < listaCarrito.size(); ñ++) {
                    Nom += listaCarrito.get(ñ).getNombres() + "\n<br>";;
                    SubTotal += "........" + listaCarrito.get(ñ).getPrecioCompra() * listaCarrito.get(ñ).getCantidad() + "MXN\n<br>";;
                    Cant += listaCarrito.get(ñ).getCantidad() + ".........  \n<br>";
                }
                monto = Double.parseDouble(request.getParameter("total"));
                tiquet e = new tiquet();
                e.setId_usuario(id_emple);
                e.setFecha(DATO);
                e.setProducto(produc);
                e.setTotal(monto);
                int query = CRUD.guardartiquet(e);

                // Actualiza la cantidad de productos en la base de datos
                for (Carrito detalle : listaCarrito) {
                    int cantidadActual = da.obtenerCantidadProducto(detalle.getIdProducto());
                    int nuevaCantidad = cantidadActual - detalle.getCantidad();
                    da.actualizarCantidadProducto(detalle.getIdProducto(), nuevaCantidad);
                }

                listaCarrito.clear();
                request.getRequestDispatcher("Empleados/VistaTicket.jsp?&fecha=" + DATO + "&subtotal=" + SubTotal + "&nom=" + Nom + "&cant=" + Cant + "&total=" + monto + "").forward(request, response);
            break;
                
            case "Producto":
                request.getRequestDispatcher("ProductoEmpleado.jsp").forward(request, response);
                break;
                
            case "Empleado":
                request.getRequestDispatcher("ControlEmpleado.jsp").forward(request, response);
                break;
                
            case "NuevaVenta":
                switch(accion){
                    case "BuscarProducto":
                        int id = Integer.parseInt(request.getParameter("codigoproducto"));
                        p = da.listarId(id);
                        request.setAttribute("producto", p);
                        break;
                    default:
                        request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                }
                request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                
                break;
                
            case "home":
                request.setAttribute("contador", listaCarrito.size());
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("Clientes/inicioCarrito.jsp").forward(request, response);
                break;
                
            case "home-empleado":
                request.setAttribute("contador", listaCarrito.size());
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("Empleados/cuentas.jsp").forward(request, response);
                break;
            
            case "AgregarCarrito-empleado":
                    int idp = Integer.parseInt(request.getParameter("id"));
                    int cantidad = 1;

                    // Obtener el producto de la base de datos
                    modelo.Producto p = da.listarId(idp);

                    // Verificar si hay suficientes existencias en la base de datos
                    if (p.getNum() < cantidad) {
                        // Mostrar una alerta en caso de insuficientes existencias
                        String mensaje = "No hay suficientes existencias disponibles para este producto.";
                        request.setAttribute("mensaje", mensaje);
                        request.setAttribute("tipoMensaje", "error"); // Puedes usar este tipo para aplicar estilos diferentes en tu alerta
                    } else {
                        // Verificar si el producto ya está en el carrito
                        boolean productoExistente = false;
                        for (Carrito car : listaCarrito) {
                            if (car.getIdProducto() == idp) {
                                // Calcular la cantidad total (existente + nueva)
                                int cantidadTotal = car.getCantidad() + cantidad;

                                // Verificar si la cantidad total supera las existencias disponibles en la base de datos
                                if (cantidadTotal > p.getNum()) {
                                    // Mostrar una alerta en caso de exceder existencias
                                    String mensaje = "No hay suficientes existencias disponibles para este producto.";
                                    request.setAttribute("mensaje", mensaje);
                                    request.setAttribute("tipoMensaje", "error");
                                } else {
                                    // El producto ya está en el carrito, actualiza la cantidad y el subtotal
                                    car.setCantidad(cantidadTotal);
                                    car.setSubTotal(cantidadTotal * p.getPrecio());
                                }

                                productoExistente = true;
                                break;
                            }
                        }

                        // Si el producto no existe en el carrito, agrégalo
                        if (!productoExistente) {
                            int item = listaCarrito.size() + 1;
                            Carrito car = new Carrito();
                            car.setItem(item);
                            car.setIdProducto(p.getId());
                            car.setNombres(p.getNombre());
                            car.setDescripcion(p.getDescripcion());
                            car.setPrecioCompra(p.getPrecio());
                            car.setCantidad(cantidad);
                            car.setSubTotal(cantidad * p.getPrecio());
                            listaCarrito.add(car);
                        }
                    }

                    request.setAttribute("contador", listaCarrito.size());
                    request.getRequestDispatcher("Controlador?accion=home-empleado").forward(request, response);
            break;
               
            case "Comprar-empleado":
                 total = 0.0;
                idp = Integer.parseInt(request.getParameter("id"));
                cantidad = Integer.parseInt(request.getParameter("cantidad"));

                // Obtener el producto de la base de datos
                p = da.listarId(idp);

                // Verificar si hay suficientes existencias en la base de datos
                if (p.getNum() >= cantidad) {
                    // La cantidad deseada es válida, proceder con la compra

                    // Verificar si el producto ya está en el carrito
                    boolean productoExistente = false;
                    for (Carrito car : listaCarrito) {
                        if (car.getIdProducto() == idp) {
                            // Calcular la cantidad total (existente + nueva)
                            int cantidadTotal = car.getCantidad() + cantidad;

                            // Verificar si la cantidad total supera el límite
                            if (cantidadTotal > p.getNum()) {
                                // Mostrar una alerta en caso de exceder existencias
                                request.setAttribute("mensaje", "La cantidad excede las existencias disponibles para este producto.");
                                request.setAttribute("tipoMensaje", "error");
                                productoExistente = true;
                            } else {
                                // El producto ya está en el carrito, actualiza la cantidad
                                car.setCantidad(cantidadTotal);
                                car.setSubTotal(cantidadTotal * p.getPrecio());
                                productoExistente = true;
                            }
                            break;
                        }
                    }

                    // Si el producto no existe en el carrito y no supera el límite, agrégalo
                    if (!productoExistente) {
                        int item = listaCarrito.size() + 1;
                        Carrito car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(idp);
                        car.setNombres(p.getNombre());
                        car.setDescripcion(p.getDescripcion());
                        car.setPrecioCompra(p.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubTotal(cantidad * p.getPrecio());
                        listaCarrito.add(car);
                    }

                    // Calcular el total del carrito
                    for (Carrito car : listaCarrito) {
                        total += car.getSubTotal();
                    }

                    request.setAttribute("total", total);
                    request.setAttribute("carrito", listaCarrito);
                    request.setAttribute("contador", listaCarrito.size());
                } else {
                    // Configurar mensaje y tipo de mensaje para insuficientes existencias
                    request.setAttribute("mensaje", "No hay suficientes existencias disponibles para este producto.");
                    request.setAttribute("tipoMensaje", "error");
                }

                // Redireccionar a la página JSP
                request.getRequestDispatcher("Empleados/Montos.jsp").forward(request, response);
                break;

           case "Comprar-cliente":
                total = 0.0;
                idp = Integer.parseInt(request.getParameter("id"));
                cantidad = Integer.parseInt(request.getParameter("cantidad"));

                // Obtener el producto de la base de datos
                p = da.listarId(idp);

                // Verificar si hay suficientes existencias en la base de datos
                if (p.getNum() >= cantidad) {
                    // La cantidad deseada es válida, proceder con la compra

                    // Verificar si el producto ya está en el carrito
                    boolean productoExistente = false;
                    for (Carrito car : listaCarrito) {
                        if (car.getIdProducto() == idp) {
                            // Calcular la cantidad total (existente + nueva)
                            int cantidadTotal = car.getCantidad() + cantidad;

                            // Verificar si la cantidad total supera el límite
                            if (cantidadTotal > p.getNum()) {
                                // Mostrar una alerta en caso de exceder existencias
                                request.setAttribute("mensaje", "La cantidad excede las existencias disponibles para este producto.");
                                request.setAttribute("tipoMensaje", "error");
                                productoExistente = true;
                            } else {
                                // El producto ya está en el carrito, actualiza la cantidad
                                car.setCantidad(cantidadTotal);
                                car.setSubTotal(cantidadTotal * p.getPrecio());
                                productoExistente = true;
                            }
                            break;
                        }
                    }

                    // Si el producto no existe en el carrito y no supera el límite, agrégalo
                    if (!productoExistente) {
                        int item = listaCarrito.size() + 1;
                        Carrito car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(idp);
                        car.setNombres(p.getNombre());
                        car.setDescripcion(p.getDescripcion());
                        car.setPrecioCompra(p.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubTotal(cantidad * p.getPrecio());
                        listaCarrito.add(car);
                    }

                    // Calcular el total del carrito
                    for (Carrito car : listaCarrito) {
                        total += car.getSubTotal();
                    }

                    request.setAttribute("total", total);
                    request.setAttribute("carrito", listaCarrito);
                    request.setAttribute("contador", listaCarrito.size());
                } else {
                    // Configurar mensaje y tipo de mensaje para insuficientes existencias
                    request.setAttribute("mensaje", "No hay suficientes existencias disponibles para este producto.");
                    request.setAttribute("tipoMensaje", "error");
                }

                // Redireccionar a la página JSP
                request.getRequestDispatcher("Clientes/carrito.jsp").forward(request, response);
                break;

                case "Buscar":
                String num = request.getParameter("id_tipo");
                productos = da.Buscar(num);
                request.setAttribute("contador", listaCarrito.size());
                request.setAttribute("productos", productos);              
                request.getRequestDispatcher("Empleados/cuentas.jsp").forward(request, response);
                 System.out.print(num+" aqui estoy wey");
                break;
                
            case "CompraCliente":
                    String producCliente,dato;
                    producCliente = " ";
                    dato = " "+fechado;
                       for (int i = 0; i < listaCarrito.size(); i++) {
                    producCliente += listaCarrito.get(i).getCantidad() +
                            "&nbsp;" + listaCarrito.get(i).getNombres() +
                            "........." +
                            listaCarrito.get(i).getPrecioCompra() * listaCarrito.get(i).getCantidad() + "MXN" + "\n<br>";
                }
                    System.out.println(producCliente);
                    System.out.println(dato);
                    System.out.println(total);
                    System.out.println(id_cliente);
                    
                    c.setId_usuario(id_cliente);
                    c.setFecha(dato);
                    c.setProducto(producCliente);
                    c.setTotal(total);
                    int quer = CRUD.guardartiquetCliente(c);
                    // Actualiza la cantidad de productos en la base de datos
                    for (Carrito detalle : listaCarrito) {
                    int cantidadActual = da.obtenerCantidadProducto(detalle.getIdProducto());
                    int nuevaCantidad = cantidadActual - detalle.getCantidad();
                    da.actualizarCantidadProducto(detalle.getIdProducto(), nuevaCantidad);
                    }

            
                    request.getRequestDispatcher("Clientes/main.jsp").forward(request, response);
                    
                    break;     
            
                case "ImprimirTicket":
                    request.setAttribute("carrito", listaCarrito);
                    request.setAttribute("fecha", c.getFecha());
                    request.setAttribute("total", total);
                    request.getRequestDispatcher("Clientes/VistaTicket.jsp").forward(request, response);
            
                    listaCarrito.clear();
                break;
                case "cerrars":
                     listaCarrito.clear();
                     HttpSession sesion=request.getSession();
                     sesion.removeAttribute("user");
                     sesion.invalidate();
                     response.sendRedirect("/aut/index.jsp");
                break;
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
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
    }
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
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
    }
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