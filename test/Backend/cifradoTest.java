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
public class cifradoTest {
    
    public cifradoTest() {
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
     * Test of validarregistro method, of class cifrado.
     */
    @Test
    public void testValidarregistro() throws Exception {
            System.out.println("validarregistro");
        String nombre = "oscar";
        cifrado instance = new cifrado();
        boolean result = instance.validarregistro(nombre);
        assertTrue("Se esperaba un resultado verdadero", result);
    }
    
}
