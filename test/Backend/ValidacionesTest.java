/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

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
public class ValidacionesTest {
    
    public ValidacionesTest() {
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
     * Test of validarUsername method, of class Validaciones.
     */
    @Test
public void testValidarUsername() {
    System.out.println("validarUsername");
    String username = "1234";
    int expResult = 0;
    int result = Validaciones.validarUsername(username);
    assertEquals(expResult, result);
}

@Test
public void testValidarCorreo() {
    System.out.println("validarCorreo");
    String correo = "oscarquintero159@gmail.com";
    int expResult = 0;
    int result = Validaciones.validarCorreo(correo);
    assertEquals(expResult, result);
}

@Test
public void testValidarPassword() {
    System.out.println("validarPassword");
    String pass = "1234";
    String passr = "1234";
    int expResult = 0;
    int result = Validaciones.validarPassword(pass, passr);
    assertEquals(expResult, result);
}

@Test
public void testValidarNumero() {
    System.out.println("validarNumero");
    String num = "5573456473";
    boolean expResult = false;
    boolean result = Validaciones.validarNumero(num);
    assertEquals(expResult, result);
}

@Test
public void testValidarFecha() {
    System.out.println("validarFecha");
    String num = "333";
    boolean expResult = false;
    boolean result = Validaciones.validarFecha(num);
    assertEquals(expResult, result);
}

@Test
public void testValidarCvv() {
    System.out.println("validarCvv");
    String num = "33223";
    boolean expResult = false;
    boolean result = Validaciones.validarCvv(num);
    assertEquals(expResult, result);
}

@Test
public void testObtenerLetras() {
    System.out.println("obtenerLetras");
    String a = "f2333r34r";
    boolean expResult = false;
    boolean result = Validaciones.obtenerLetras(a);
    assertEquals(expResult, result);
}

@Test
public void testGetComillas() {
    System.out.println("getComillas");
    String a = "32323";
    int expResult = 0;
    int result = Validaciones.getComillas(a);
    assertEquals(expResult, result);
}

    
}
