/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package herramientas;

import conexion.Datos;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author Soporte
 */
public class SalidaSQL 
{
    public static void generarArchivo(String sql)            
    {
        File archivo = new File("/salida.txt");
        if(archivo.exists())
        {
            archivo.delete();          
        }                
        
        try {
            BufferedWriter bw = new BufferedWriter(new FileWriter("/salida.txt"));
            bw.write(sql);
            bw.close();
        } catch (Exception e) {
            
        }
    }
    
    public static int totalDeRegistros(ResultSet resultSet)
    {
        try {
            
            int contador = 0;
            while(resultSet.next())
            {
                contador ++;
            }
            
            return contador;
            
        } catch (Exception e) {
            return 0;
        }
    }
    
    public static String getFechaDelServidor()
    {
        Datos datos = new Datos();
        ResultSet fechas = datos.obtenerRegistros("SELECT date_format(now(), '%Y/%d/%m') AS fecha");
        try {
            fechas.next();
            return fechas.getString("fecha");
        } catch (Exception e) {
            return "";
        }
    }
    
    public static int getAnio()
    {
        Datos datos = new Datos();
        ResultSet fechas = datos.obtenerRegistros("SELECT date_format(now(), '%Y') AS fecha");
        try {
            fechas.next();
            return fechas.getInt("fecha");
        } catch (Exception e) {
            return 0;
        }
    }
    
    public static int getNumeroSemana()
    {
//        String fecha[] = getFechaDelServidor().split("/");
//        int year = Integer.parseInt(fecha[0]);
//        int month = Integer.parseInt(fecha[2]);
//        int dayOfMonth = Integer.parseInt(fecha[1]);
//        GregorianCalendar dia = new GregorianCalendar(year, month, dayOfMonth);
//        
        int semana = Integer.parseInt(new SimpleDateFormat("w").format(new java.util.Date()));
        
        return semana;
        
    }
    
    public static int getNumeroSemana(String valor)
    {
        String fecha[] = valor.split("/");
        
        int year = Integer.parseInt(fecha[0]);
        int month = Integer.parseInt(fecha[2]);
        int dayOfMonth = Integer.parseInt(fecha[1]);
        
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month, dayOfMonth);
        
        int semana = Integer.parseInt(new SimpleDateFormat("w").format(calendar));
        
        
        return semana;
        
        
        
    }
    
    
}
