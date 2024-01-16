/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import Backend.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author osdroix
 */
public class superadmin {
     private String nombre,contra;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }
    public superadmin Validarsa(String user, String contra){
        superadmin a=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        /*u=null;*/
        try{
              cn = Conexion.getConnection();
            String sql="SELECT * FROM superadm WHERE nom_sa=? AND contra_sa=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1,user);
            pr.setString(2,contra);
            rs=pr.executeQuery();
            while(rs.next()){
                a=new superadmin();
                a.setNombre(rs.getString("nom_sa"));
                a.setContra(rs.getString("contra_sa"));


          
                break;
            }
        }catch(SQLException ex){
            return a;
        }finally{
            try{
                rs.close();
                pr.close();
                rs.close();
            }catch(SQLException ex){
                
            }
        }
        return a;
    }
}
