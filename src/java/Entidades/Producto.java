/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author osdroix
 */
public class Producto {
    private String nombre,descripcion,fecha,nom_empre_prove;
    private int id_incremet,id_tipo,id_prove,num_cantidad;
    private double precio;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_incremet() {
        return id_incremet;
    }

    public void setId_incremet(int id_incremet) {
        this.id_incremet = id_incremet;
    }

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public int getNum_cantidad() {
        return num_cantidad;
    }

    public void setNum_cantidad(int num_cantidad) {
        this.num_cantidad = num_cantidad;
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

    public int getId_prove() {
        return id_prove;
    }

    public void setId_prove(int id_prove) {
        this.id_prove = id_prove;
    }

    public String getNom_empre_prove() {
        return nom_empre_prove;
    }

    public void setNom_empre_prove(String nom_empre_prove) {
        this.nom_empre_prove = nom_empre_prove;
    }
}
