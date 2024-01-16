
package Backend;




import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author osdroix
 */
public class Conexion {


    public static Connection getConnection(){


        Statement st = null;
        Connection con = null;
        String URL = "jdbc:mysql://10.100.36.53:3306/autx?useSSL=false";
        String userName = "root";//Mi usuario
        String password = "QOPxkb50831";//Mi password


        try{

            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection) DriverManager.getConnection(URL,userName,password); 
            st = con.createStatement();
            System.out.println("Se conecto a la base de datos");

        }catch(Exception e){

            System.out.println("No se conecto a la bd");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());

        }

        return con;

    } 
}