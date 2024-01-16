/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDA;

import Backend.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;

public class ProductoDa {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
  public List<Producto> listar() {
    List<Producto> productos = new ArrayList<>();
    String sql = "SELECT * FROM productos";
    
    try (Connection con = cn.getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            Producto p = new Producto();
            p.setId(rs.getInt(1));
            p.setTipo(rs.getString(2));
            p.setId_prove(rs.getInt(3));
            p.setNombre(rs.getString(4));
            p.setFecha(rs.getString(5));    // Asegúrate de que la fecha sea manejada correctamente según el tipo de dato en la base de datos
            p.setPrecio(rs.getDouble(6));
            p.setNum(rs.getInt(7));
            p.setDescripcion(rs.getString(8));
            productos.add(p);
        }

    } catch (Exception e) {
        e.printStackTrace();
        // Puedes lanzar una excepción personalizada o agregar un registro de error más detallado aquí.
    }

    return productos;
}

    public List Buscar(String num){
        List<Producto>productos=new ArrayList();
        String sql = "SELECT *FROM productos where Id_tipo_producto like '"+num+"'";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Producto p = new Producto();   
                    p.setId(rs.getInt(1));
                    p.setTipo(rs.getString(2));
                    p.setId_prove(rs.getInt(3));
                    p.setNombre(rs.getString(4));
                    p.setFecha(rs.getString(5));    // Asegúrate de que la fecha sea manejada correctamente según el tipo de dato en la base de datos
                    p.setPrecio(rs.getDouble(6));
                    p.setNum(rs.getInt(7));
                    p.setDescripcion(rs.getString(8));
                productos.add(p);
                
            }
        }catch(Exception e){
            
        }
        
        
        return productos;
    }
   
    public Producto listarId(int id){
        String sql = "SELECT *FROM productos WHERE Id_producto =" +id;
        Producto p = new Producto();
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                    p.setId(rs.getInt(1));
                    p.setTipo(rs.getString(2));
                    p.setId_prove(rs.getInt(3));
                    p.setNombre(rs.getString(4));
                    p.setFecha(rs.getString(5));    // Asegúrate de que la fecha sea manejada correctamente según el tipo de dato en la base de datos
                    p.setPrecio(rs.getDouble(6));
                    p.setNum(rs.getInt(7));
                    p.setDescripcion(rs.getString(8));
            }
        }catch(Exception e){
            
        }
        return p;
    }
    public int obtenerCantidadProducto(int idProducto) {
    String sql = "SELECT Num_producto FROM productos WHERE Id_producto = ?";
    try (Connection con = cn.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, idProducto);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("Num_producto");
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return 0; // Maneja el caso de error devolviendo un valor predeterminado
}

public void actualizarCantidadProducto(int idProducto, int nuevaCantidad) {
    String sql = "UPDATE productos SET Num_producto = ? WHERE Id_producto = ?";
    try (Connection con = cn.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, nuevaCantidad);
        ps.setInt(2, idProducto);
        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}

    
}
