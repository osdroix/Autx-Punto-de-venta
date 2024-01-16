/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import Entidades.Producto;
import Entidades.empleado;
import Entidades.tiquet;
import Entidades.usuarios;
import java.util.ArrayList;
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
public class CRUDTest {
    
    public CRUDTest() {
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
     * Test of listarId method, of class CRUD.
     */
    @Test
    public void testListarId() {
        System.out.println("listarId");
        int id = 0;
        CRUD instance = new CRUD();
        Producto expResult = null;
        Producto result = instance.listarId(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of eliminarusu method, of class CRUD.
     */
    @Test
    public void testEliminarusu() {
        System.out.println("eliminarusu");
        int i = 0;
        int expResult = 0;
        int result = CRUD.eliminarusu(i);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of guardarEmple method, of class CRUD.
     */
    @Test
    public void testGuardarEmple() {
        System.out.println("guardarEmple");
        empleado e = null;
        int expResult = 0;
        int result = CRUD.guardarEmple(e);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of guardarEmple2 method, of class CRUD.
     */
    @Test
    public void testGuardarEmple2() {
        System.out.println("guardarEmple2");
        empleado e = null;
        int expResult = 0;
        int result = CRUD.guardarEmple2(e);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of guardarProductos method, of class CRUD.
     */
    @Test
    public void testGuardarProductos() {
        System.out.println("guardarProductos");
        Producto e = null;
        int expResult = 0;
        int result = CRUD.guardarProductos(e);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of guardartiquet method, of class CRUD.
     */
    @Test
    public void testGuardartiquet() {
        System.out.println("guardartiquet");
        tiquet e = null;
        int expResult = 0;
        int result = CRUD.guardartiquet(e);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of guardartiquetCliente method, of class CRUD.
     */
    @Test
    public void testGuardartiquetCliente() {
        System.out.println("guardartiquetCliente");
        tiquet e = null;
        int expResult = 0;
        int result = CRUD.guardartiquetCliente(e);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of guardar method, of class CRUD.
     */
    @Test
    public void testGuardar() {
        System.out.println("guardar");
        usuarios e = null;
        int expResult = 0;
        int result = CRUD.guardar(e);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of guardar2 method, of class CRUD.
     */
    @Test
    public void testGuardar2() {
        System.out.println("guardar2");
        usuarios e = null;
        int expResult = 0;
        int result = CRUD.guardar2(e);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of validarregistro method, of class CRUD.
     */
    @Test
    public void testValidarregistro() throws Exception {
        System.out.println("validarregistro");
        String nombre = "";
        CRUD instance = new CRUD();
        boolean expResult = false;
        boolean result = instance.validarregistro(nombre);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of validarEmple method, of class CRUD.
     */
    @Test
    public void testValidarEmple() throws Exception {
        System.out.println("validarEmple");
        String nombre = "";
        CRUD instance = new CRUD();
        boolean expResult = false;
        boolean result = instance.validarEmple(nombre);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUsu method, of class CRUD.
     */
    @Test
    public void testGetUsu() {
        System.out.println("getUsu");
        ArrayList<usuarios> expResult = null;
        ArrayList<usuarios> result = CRUD.getUsu();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getMostrarUsu method, of class CRUD.
     */
    @Test
    public void testGetMostrarUsu() {
        System.out.println("getMostrarUsu");
        String numero = "";
        ArrayList<usuarios> expResult = null;
        ArrayList<usuarios> result = CRUD.getMostrarUsu(numero);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getEmp method, of class CRUD.
     */
    @Test
    public void testGetEmp() {
        System.out.println("getEmp");
        ArrayList<empleado> expResult = null;
        ArrayList<empleado> result = CRUD.getEmp();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAdmin method, of class CRUD.
     */
    @Test
    public void testGetAdmin() {
        System.out.println("getAdmin");
        ArrayList<empleado> expResult = null;
        ArrayList<empleado> result = CRUD.getAdmin();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getMostrardatos method, of class CRUD.
     */
    @Test
    public void testGetMostrardatos() {
        System.out.println("getMostrardatos");
        String usuario = "";
        ArrayList<empleado> expResult = null;
        ArrayList<empleado> result = CRUD.getMostrardatos(usuario);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getproductos method, of class CRUD.
     */
    @Test
    public void testGetproductos() {
        System.out.println("getproductos");
        String numero = "";
        ArrayList<Producto> expResult = null;
        ArrayList<Producto> result = CRUD.getproductos(numero);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getmostrarproductos method, of class CRUD.
     */
    @Test
    public void testGetmostrarproductos() {
        System.out.println("getmostrarproductos");
        int numero = 0;
        ArrayList<Producto> expResult = null;
        ArrayList<Producto> result = CRUD.getmostrarproductos(numero);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBuscador method, of class CRUD.
     */
    @Test
    public void testGetBuscador() {
        System.out.println("getBuscador");
        String numero = "";
        ArrayList<Producto> expResult = null;
        ArrayList<Producto> result = CRUD.getBuscador(numero);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getMostartiquetcarro method, of class CRUD.
     */
    @Test
    public void testGetMostartiquetcarro_0args() {
        System.out.println("getMostartiquetcarro");
        ArrayList<tiquet> expResult = null;
        ArrayList<tiquet> result = CRUD.getMostartiquetcarro();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getMostartiquetcarro method, of class CRUD.
     */
    @Test
    public void testGetMostartiquetcarro_int() {
        System.out.println("getMostartiquetcarro");
        int i = 0;
        ArrayList<tiquet> expResult = null;
        ArrayList<tiquet> result = CRUD.getMostartiquetcarro(i);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBuscartiquetcarro method, of class CRUD.
     */
    @Test
    public void testGetBuscartiquetcarro() {
        System.out.println("getBuscartiquetcarro");
        int i = 0;
        ArrayList<tiquet> expResult = null;
        ArrayList<tiquet> result = CRUD.getBuscartiquetcarro(i);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getMostartiquet method, of class CRUD.
     */
    @Test
    public void testGetMostartiquet() {
        System.out.println("getMostartiquet");
        ArrayList<tiquet> expResult = null;
        ArrayList<tiquet> result = CRUD.getMostartiquet();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBuscartiquet method, of class CRUD.
     */
    @Test
    public void testGetBuscartiquet() {
        System.out.println("getBuscartiquet");
        String nombre = "";
        ArrayList<tiquet> expResult = null;
        ArrayList<tiquet> result = CRUD.getBuscartiquet(nombre);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
