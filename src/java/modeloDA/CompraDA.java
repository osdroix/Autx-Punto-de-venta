/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDA;

import Backend.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Carrito;
import modelo.Compra;

/**
 *
 * @author Administrador
 */
public class CompraDA {
    
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    public int GenerarCompra(Compra compra){
        int idCompras;
        String sql="INSERT INTO compras (idCliente,idPago,FechaCompras,Monto,Estado)VALUES(?,?,?,?,?)";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, compra.getCliente().getId());
            ps.setInt(2, compra.getIdpago());
            ps.setString(3, compra.getFecha());
            ps.setDouble(4, compra.getMonto());
            ps.setString(5, compra.getEstado());
            r = ps.executeUpdate();
            
            
            sql = "SELECT @@IDENTITY AS idCompras";
            rs = ps.executeQuery(sql);
            rs.next();
            idCompras = rs.getInt("idCompras");
            rs.close();
            
            for (Carrito detalle: compra.getDetallecompras()) {
                sql = "INSERT INTO detalle_compras(idProducto, idCompras, Cantidad, PrecioCompra)VALUES(?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1, detalle.getIdProducto());
                ps.setInt(2, idCompras);
                ps.setInt(3, detalle.getCantidad());
                ps.setDouble(4, detalle.getPrecioCompra());
                r = ps.executeUpdate();
            }
            
        }catch(Exception e){
        }
        return r;
    }
    
    /*
    public static void main(String [] args){
        Compra pda = new Compra();
        for (Object p: pda.getDetallecompras()) {
            System.out.println(p);
        }
    }
    */
}
