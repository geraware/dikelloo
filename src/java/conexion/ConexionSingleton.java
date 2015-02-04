/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Leon
 */
public class ConexionSingleton 
{
    private static ConexionSingleton instancia = null;
    private java.sql.Connection conexion = null;
    
    private String servidor;
    private String usuario;
    private String password;
    private String bd;
    
    private ConexionSingleton() {
    }
    
    public static ConexionSingleton getInstancia() {
        if (instancia == null) {
        instancia = new ConexionSingleton();
        }
        return instancia;
    }
    /* devuelve true si se ha creado correctamente */
    public boolean crearConexion() 
    {
        try 
        {
            leerArchivo();
            
            Class.forName("com.mysql.jdbc.Driver");
            //conexion = DriverManager.getConnection ("jdbc:mysql://localhost/seveneleven20022014","root", "");
            //conexion = DriverManager.getConnection ("jdbc:mysql://201.120.74.195/seveneleven","sesap", "$sesap123");
            //conexion = DriverManager.getConnection ("jdbc:mysql://localhost/respaldosesap23junio2013","root", "");
            //conexion = DriverManager.getConnection ("jdbc:mysql://localhost/seveneleven_17102013","root", "");
            System.err.println("jdbc:mysql://" + servidor + "/" + bd + ":" + usuario + ":" + password);
            conexion = DriverManager.getConnection ("jdbc:mysql://" + servidor + "/" + bd,usuario, password);
            
            
            //conexion = DriverManager.getConnection ("jdbc:mysql://192.168.1.1/seveneleven","sesap", "$sesap123");
        } 
        catch (ClassNotFoundException e) 
        {
            //System.err.println(e.getMessage());
            return false;
        } catch (SQLException e) {
            //System.err.println(e.getMessage());
            return false;
        }
            return true;
    }
            
    public java.sql.Connection getConexion() 
    {
        if (conexion == null) 
        {
            crearConexion();
        }
        return conexion;
        
    }
    
    public void leerArchivo()
    {
        File archivo = null;
      FileReader fr = null;
      BufferedReader br = null;
 
      try {
         // Apertura del fichero y creacion de BufferedReader para poder
         // hacer una lectura comoda (disponer del metodo readLine()).
         archivo = new File ("/dikelloo.txt");
         fr = new FileReader (archivo);
         br = new BufferedReader(fr);
 
         servidor = br.readLine();
         usuario = br.readLine();
         password = br.readLine();
         bd = br.readLine();
         
//         servidor = "localhost";
//         usuario = "root";
//         password = "";
//         bd = "seveneleven";
      }
      catch(Exception e){
         //e.printStackTrace();
      }finally{
         // En el finally cerramos el fichero, para asegurarnos
         // que se cierra tanto si todo va bien como si salta
         // una excepcion.
         try{                   
            if( null != fr ){  
               fr.close();    
            }                 
         }catch (Exception e2){
            //e2.printStackTrace();
         }
      }
    }
    
}
