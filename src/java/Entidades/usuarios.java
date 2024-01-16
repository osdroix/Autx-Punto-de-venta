
package Entidades;
import Backend.CRUD;
import Backend.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class usuarios {
    private String nombre,apellido,apellido2,correo,contra,sexo,usuario,inf,usu;
    private int id,edad,tipo,persona,tarjeta,rela;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public usuarios Validarusuario(String user, String contra){
        usuarios a=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        /*u=null;*/
        try{
              cn = Conexion.getConnection();
            String sql="SELECT * FROM cliente WHERE Nom_cliente=? AND Contra_cliente=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1,user);
            pr.setString(2,contra);
            rs=pr.executeQuery();
            while(rs.next()){
                a=new usuarios();
                 a.setRela(rs.getInt("Id_usu_cliente"));
                 a.setTipo(rs.getInt("Id_tipo_cliente"));
                a.setUsuario(rs.getString("Nom_cliente"));
                a.setContra(rs.getString("Contra_cliente"));
          
                break;
                
            }
        }catch(SQLException ex){
            a=null;
        }finally{
            try{;
                rs.close();
            }catch(SQLException ex){
                
            }
        }
        return a;
    }
    public usuarios Nombre(String nom){
        usuarios a=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        /*u=null;*/
        try{
              cn = Conexion.getConnection();
            String sql="SELECT * FROM usu WHERE nom_usu=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1,nom);
            rs=pr.executeQuery();
            while(rs.next()){
                a=new usuarios();
                a.setNombre(rs.getString("nom_usu"));

          
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

 public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getPersona() {
        return persona;
    }

    public void setPersona(int persona) {
        this.persona = persona;
    }

    public String getInf() {
        return inf;
    }

    public void setInf(String inf) {
        this.inf = inf;
    }

   

    public int getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(int tarjeta) {
        this.tarjeta = tarjeta;
    }

    public String getUsu() {
        return usu;
    }

    public void setUsu(String usu) {
        this.usu = usu;
    }

    public int getRela() {
        return rela;
    }

    public void setRela(int rela) {
        this.rela = rela;
    }
  
}