/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Administrador
 */
public class Cliente {
    private int id;
    private String nombre;
    private String apaterno;
    private String amaterno;
    private String usuario_cliente;
    private String password_cliente;
    private String telefono_cliente;
    private String correo_cliente;
    private String direccion_cliente;
    
    public Cliente(){
        
    }

    public Cliente(int id, String nombre, String apaterno, String amaterno, String usuario_cliente, String password_cliente, String telefono_cliente, String correo_cliente, String direccion_cliente) {
        this.id = id;
        this.nombre = nombre;
        this.apaterno = apaterno;
        this.amaterno = amaterno;
        this.usuario_cliente = usuario_cliente;
        this.password_cliente = password_cliente;
        this.telefono_cliente = telefono_cliente;
        this.correo_cliente = correo_cliente;
        this.direccion_cliente = direccion_cliente;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApaterno() {
        return apaterno;
    }

    public void setApaterno(String apaterno) {
        this.apaterno = apaterno;
    }

    public String getAmaterno() {
        return amaterno;
    }

    public void setAmaterno(String amaterno) {
        this.amaterno = amaterno;
    }

    public String getUsuario_cliente() {
        return usuario_cliente;
    }

    public void setUsuario_cliente(String usuario_cliente) {
        this.usuario_cliente = usuario_cliente;
    }

    public String getPassword_cliente() {
        return password_cliente;
    }

    public void setPassword_cliente(String password_cliente) {
        this.password_cliente = password_cliente;
    }

    public String getTelefono_cliente() {
        return telefono_cliente;
    }

    public void setTelefono_cliente(String telefono_cliente) {
        this.telefono_cliente = telefono_cliente;
    }

    public String getCorreo_cliente() {
        return correo_cliente;
    }

    public void setCorreo_cliente(String correo_cliente) {
        this.correo_cliente = correo_cliente;
    }

    public String getDireccion_cliente() {
        return direccion_cliente;
    }

    public void setDireccion_cliente(String direccion_cliente) {
        this.direccion_cliente = direccion_cliente;
    }
    
    
}
