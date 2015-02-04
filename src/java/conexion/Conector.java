/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author geraware
 */
public class Conector 
{
    private static TestConnection c;
    private static ConexionSingleton con;
    
    public TestConnection getConector()
    {   
        try {
            
            
            if(c == null)
            {
                c = new TestConnection();
            }
            
            
        } catch (Exception ex) {            
        }
        
        return c;
    }   
    
    
    
}
