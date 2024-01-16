/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author osdroix
 */
public class CarritoTest {
    
    public CarritoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getItem method, of class Carrito.
     */
    @Test
    public void testGetItem() {
        System.out.println("getItem");
        Carrito instance = new Carrito();
        int expResult = 0;
        int result = instance.getItem();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setItem method, of class Carrito.
     */
    @Test
    public void testSetItem() {
        System.out.println("setItem");
        int item = 0;
        Carrito instance = new Carrito();
        instance.setItem(item);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getIdProducto method, of class Carrito.
     */
    @Test
    public void testGetIdProducto() {
        System.out.println("getIdProducto");
        Carrito instance = new Carrito();
        int expResult = 0;
        int result = instance.getIdProducto();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setIdProducto method, of class Carrito.
     */
    @Test
    public void testSetIdProducto() {
        System.out.println("setIdProducto");
        int idProducto = 0;
        Carrito instance = new Carrito();
        instance.setIdProducto(idProducto);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getNombres method, of class Carrito.
     */
    @Test
    public void testGetNombres() {
        System.out.println("getNombres");
        Carrito instance = new Carrito();
        String expResult = "";
        String result = instance.getNombres();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setNombres method, of class Carrito.
     */
    @Test
    public void testSetNombres() {
        System.out.println("setNombres");
        String nombres = "";
        Carrito instance = new Carrito();
        instance.setNombres(nombres);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDescripcion method, of class Carrito.
     */
    @Test
    public void testGetDescripcion() {
        System.out.println("getDescripcion");
        Carrito instance = new Carrito();
        String expResult = "";
        String result = instance.getDescripcion();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setDescripcion method, of class Carrito.
     */
    @Test
    public void testSetDescripcion() {
        System.out.println("setDescripcion");
        String descripcion = "";
        Carrito instance = new Carrito();
        instance.setDescripcion(descripcion);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPrecioCompra method, of class Carrito.
     */
    @Test
    public void testGetPrecioCompra() {
        System.out.println("getPrecioCompra");
        Carrito instance = new Carrito();
        Double expResult = null;
        Double result = instance.getPrecioCompra();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setPrecioCompra method, of class Carrito.
     */
    @Test
    public void testSetPrecioCompra() {
        System.out.println("setPrecioCompra");
        Double precioCompra = null;
        Carrito instance = new Carrito();
        instance.setPrecioCompra(precioCompra);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCantidad method, of class Carrito.
     */
    @Test
    public void testGetCantidad() {
        System.out.println("getCantidad");
        Carrito instance = new Carrito();
        int expResult = 0;
        int result = instance.getCantidad();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setCantidad method, of class Carrito.
     */
    @Test
    public void testSetCantidad() {
        System.out.println("setCantidad");
        int cantidad = 0;
        Carrito instance = new Carrito();
        instance.setCantidad(cantidad);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSubTotal method, of class Carrito.
     */
    @Test
    public void testGetSubTotal() {
        System.out.println("getSubTotal");
        Carrito instance = new Carrito();
        double expResult = 0.0;
        double result = instance.getSubTotal();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setSubTotal method, of class Carrito.
     */
    @Test
    public void testSetSubTotal() {
        System.out.println("setSubTotal");
        double subTotal = 0.0;
        Carrito instance = new Carrito();
        instance.setSubTotal(subTotal);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
