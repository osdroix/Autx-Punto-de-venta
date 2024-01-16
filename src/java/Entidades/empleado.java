/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import Backend.CRUD;
import Backend.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author osdroix
 */
public class empleado {
  private String nombre,app,app2,correo,sexo,fecha,direccion,postal,telefono,usuario,contra;
    private int usu,tipo,edad,emple;
public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApp() {
        return app;
    }

    public void setApp(String app) {
        this.app = app;
    }

    public String getApp2() {
        return app2;
    }

    public void setApp2(String app2) {
        this.app2 = app2;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getPostal() {
        return postal;
    }

    public void setPostal(String postal) {
        this.postal = postal;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public int getUsu() {
        return usu;
    }

    public void setUsu(int usu) {
        this.usu = usu;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getEmple() {
        return emple;
    }

    public void setEmple(int emple) {
        this.emple = emple;
    }
 public empleado Validarempleado(String user, String contra){
        empleado a=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        /*u=null;*/
        try{
              cn = Conexion.getConnection();
            String sql="SELECT * FROM empleado WHERE Usuario_emple=? AND Contra_emple=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1,user);
            pr.setString(2,contra);
            rs=pr.executeQuery();
            while(rs.next()){
                a=new empleado();
                 a.setUsu(rs.getInt("Id_emple"));
                 a.setTipo(rs.getInt("Id_tipo_emple"));
                a.setFecha(rs.getString("Fecha_emple"));
                a.setDireccion(rs.getString("Direccion_emple"));
                a.setPostal(rs.getString("postal_emple"));
                a.setUsuario(rs.getString("Usuario_emple"));
                a.setContra(rs.getString("Contra_emple"));
                a.setTelefono(rs.getString("Telefono_emple"));

          
                break;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            a=null;
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