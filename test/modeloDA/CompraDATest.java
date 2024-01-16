/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDA;

import modelo.Compra;
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
public class CompraDATest {
    
    public CompraDATest() {
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
     * Test of GenerarCompra method, of class CompraDA.
     */
    @Test
    public void testGenerarCompra() {
        System.out.println("GenerarCompra");
        Compra compra = null;
        CompraDA instance = new CompraDA();
        int expResult = 0;
        int result = instance.GenerarCompra(compra);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
