/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import conexion.Conector;
import conexion.ConexionSingleton;
import herramientas.SalidaSQL;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Soporte
 */
public class Datos
{
    private ResultSet datos;
    
    public void ejecutarSQL(String sql)
    {
        //Conector conn = new Conector();
        //Connection conector = conn.getConector().getConector();
        
        
        
        
        try {
            Connection conector = ConexionSingleton.getInstancia().getConexion();
            
            if(ConexionSingleton.getInstancia().getConexion().isClosed())
            {
                ConexionSingleton.getInstancia().crearConexion();
                conector = ConexionSingleton.getInstancia().getConexion();
            }
            
            Statement declaracion = conector.createStatement();
            declaracion.executeUpdate(sql);
            
            //this.leerArchivo(sql);
                 
        } catch (SQLException ex) {
            String error = ex.getMessage();
            
        }
    }
    
    public ResultSet obtenerRegistros(String sql)
    {
        //Conector conn = new Conector();
        //Connection conector = conn.getConector().getConector();        
        
        try {
            Connection conector = ConexionSingleton.getInstancia().getConexion();
            
            if(ConexionSingleton.getInstancia().getConexion().isClosed())
            {
                ConexionSingleton.getInstancia().crearConexion();
                conector = ConexionSingleton.getInstancia().getConexion();
            }
            Statement declaracion = conector.createStatement();
            datos = declaracion.executeQuery(sql);
            return datos;
        } catch (SQLException ex) 
        {
            String error = ex.getMessage();
            return null;
        }finally {
            
        }      
        
        
        
    }
    
    public void leerArchivo(String sql)
    {
        File archivo = null;
        FileWriter fr = null;
 
      try {
         // Apertura del fichero y creacion de BufferedReader para poder
         // hacer una lectura comoda (disponer del metodo readLine()).
         archivo = new File ("/log_" + SalidaSQL.getFechaDelServidor().replace("-", "_").replace(":", "_").replace(".", "_") + ".txt");
         fr = new FileWriter (archivo);
         fr.write(sql);
         fr.close();
          System.err.println(archivo.getAbsolutePath());
      }
      catch(Exception e){
         e.printStackTrace();
          System.err.println(e.getMessage());
      }finally{
         // En el finally cerramos el fichero, para asegurarnos
         // que se cierra tanto si todo va bien como si salta
         // una excepcion.
         try{                   
            if( null != fr ){  
               fr.close();    
            }                 
         }catch (Exception e2){
            e2.printStackTrace();
            System.err.println(e2.getMessage());
         }
      }
    }
    
    
    
}
