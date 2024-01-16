/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.crypto.Cipher;

/**
 *
 * @author osdroix
 */
public class cifrado {
  
    public boolean validarregistro(String nombre) throws SQLException{
        Connection con = Conexion.getConnection();
        String q = "SELECT * FROM cliente WHERE Nom_cliente='"+nombre+"'";
        PreparedStatement ps = con.prepareStatement(q);
        ResultSet rs = ps.executeQuery();
        
        return rs.next();
}
}
