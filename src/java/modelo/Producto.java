/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author Administrador
 */
public class Producto {
    
    int id;
    String tipo;
    String nombre;
    String fecha;
    double precio;
    int num,id_prove;
    String descripcion;
    
    
    public Producto(){
        
    }

    public Producto(int id, String tipo, String nombre, String fecha, double precio, int num, int id_prove, String descripcion) {
        this.id = id;
        this.tipo = tipo;
        this.nombre = nombre;
        this.fecha = fecha;
        this.precio = precio;
        this.num = num;
        this.id_prove = id_prove;
        this.descripcion = descripcion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
    public int getId_prove() {
        return id_prove;
    }

    public void setId_prove(int id_prove) {
        this.id_prove = id_prove;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
    