package Entidades;
import Backend.CRUD;
import Backend.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class administrador {
    private String usuario,nombre,correo,telefono,celular,contra;
    private int id,num;

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
   


    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }
    
    public administrador ValidarAdm(String user, String contra){
        administrador a=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        /*u=null;*/
        try{
              cn = Conexion.getConnection();
            String sql="SELECT * FROM admin WHERE nom_adm=? AND contra_adm=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1,user);
            pr.setString(2,contra);
            rs=pr.executeQuery();
            while(rs.next()){
                a=new administrador();
                a.setId(rs.getInt("id_adm"));
                a.setNum(rs.getInt("num_adm"));
                a.setNombre(rs.getString("nom_adm"));
                a.setCorreo(rs.getString("corr_adm"));
                a.setContra(rs.getString("contra_adm"));


          
                break;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
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

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
}