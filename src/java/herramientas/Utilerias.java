/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package herramientas;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author Leon
 */
public class Utilerias {
    
    public static boolean isNumeric( String s ){
    try{
        double y = Double.parseDouble( s );
        return true;
    }
    catch( NumberFormatException err ){
        return false;
    }
}
    
    public static String fechaCompleta(String fecha) throws ParseException
    {
        try {
            String[] valores = fecha.split("/");
            SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy/dd/MM");
            GregorianCalendar cal = new GregorianCalendar();

            cal.setTime(formatoDelTexto.parse(fecha));

            String diaSemana = "";
            String mes = "";

            switch(Integer.parseInt(valores[2]))
            {
                case 1:
                    mes = "Enero";
                    break;
                case 2:
                    mes = "Febrero";
                    break;
                case 3:
                    mes = "Marzo";
                    break;
                case 4:
                    mes = "Abril";
                    break;
                case 5:
                    mes = "Mayo";
                    break;
                case 6:
                    mes = "Junio";
                    break;
                case 7:
                    mes = "Julio";    
                    break;
                case 8:
                    mes = "Agosto";
                    break;
                case 9:
                    mes = "Septiembre";
                    break;
                case 10:
                    mes = "Octubre";    
                    break;
                case 11:
                    mes = "Noviembre";
                    break;
                case 12:
                    mes = "Diciembre";     
                    break;
            }

            switch(cal.get(Calendar.DAY_OF_WEEK))
            {
                case 1:
                    diaSemana = "Domingo";
                    break;
                case 2:
                    diaSemana = "Lunes";
                    break;
                case 3:
                    diaSemana = "Martes";
                    break;
                case 4:
                    diaSemana = "Miercoles";
                    break;
                case 5:
                    diaSemana = "Jueves";
                    break;
                case 6:
                    diaSemana = "Viernes";
                    break;
                case 7:
                    diaSemana = "Sabado";
                    break;
            }

            return diaSemana + " " + valores[1] + " de " + mes + " del " + valores[0];
        } catch (Exception e) {
            return "";
        }
        
    }
    
}
