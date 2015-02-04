/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Leon
 */
public class TestConnection 
{
    //private Connection conn;
    
    public Connection getConector()
    {   
        Connection conn = null;
        
        try
        {               
               Class.forName("com.mysql.jdbc.Driver");
               
               conn = DriverManager.getConnection ("jdbc:mysql://localhost/seveneleven","root", "");
                   
           
        } catch (Exception e)
        {
          // e.printStackTrace();
           
        }
        
        return conn;
    }
    
}
