/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package herramientas;

import conexion.Datos;
import java.sql.ResultSet;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author Leon
 */
public class OperacionesFechas 
{
    public static int getFecha(String fechaInicial, String fechaFinal)
    {
        String[] fInicial = fechaInicial.split("-");
        String[] fFinal = fechaFinal.split("-");
        Calendar c = Calendar.getInstance();
        
        Calendar fechaInicio = new GregorianCalendar();
        fechaInicio.set(Integer.parseInt(fInicial[0]), Integer.parseInt(fInicial[1]), Integer.parseInt(fInicial[2]));
        Calendar fechaFin = new GregorianCalendar();
        fechaFin.set(Integer.parseInt(fFinal[0]), Integer.parseInt(fFinal[1]), Integer.parseInt(fFinal[2]));
        
        c.setTimeInMillis(fechaFin.getTime().getTime() - fechaInicio.getTime().getTime());
        
        return c.get(Calendar.DAY_OF_YEAR);
    }
    
    public static int getDias(String fechaInicial, String fechaFinal)
    {
        Datos datos = new Datos();
        ResultSet resultados = datos.obtenerRegistros("select timestampdiff(day, "
                + "str_to_date('" + fechaInicial + "','%Y/%d/%m'), str_to_date('" + fechaFinal + "','%Y/%d/%m')) as dias");
        try {
            resultados.next();
            return resultados.getInt("dias");
        } catch (Exception e) {
            return 0;
        }
    }
    
}
