/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package herramientas;

import sun.security.util.Password;

/**
 *
 * @author Leon
 */
public class OperacionesFraccion 
{
    
    public static double getValorDecimal(String numero)
    {
        if(numero.contains(" ") || numero.contains("/"))
        {
        
            String[] valores = numero.split(" ");            
            double unidades = Integer.parseInt(valores[0]);
            String[] decimales = valores[1].split("/");
            Fraccion fraccion = new Fraccion(Integer.parseInt(decimales[0]), Integer.parseInt(decimales[1]));

            double fracc = fraccion.doubleValue();

            return unidades + fracc;
            
        }else
        {
            return Double.parseDouble(numero);
        }
        
    }
    
    public static boolean igualQue(String numero1, String numero2)
    {
        double num1 = getValorDecimal(numero1);
        double num2 = getValorDecimal(numero2);
        
        if(num1 == num2)
        {
            return true;
        }else
        {
            return false;
        }
    }
    
    public static boolean menorQue(String numero, String menorQue)
    {
        double num = getValorDecimal(numero);
        double menor = getValorDecimal(menorQue);
        
        if(num < menor)
        {
            return true;
        }else
        {
            return false;
        }
    }
    
    public static boolean mayorQue(String numero, String mayorQue)
    {
        double num = getValorDecimal(numero);
        double mayor = getValorDecimal(mayorQue);
        
        if(num > mayor)
        {
            return true;
        }else
        {
            return false;
        }
    }
    
    public static String suma(String num1, String num2)
    {
        try {
            double numero1 = getValorDecimal(num1);
            double numero2 = getValorDecimal(num2);
            return pasarAFraccion(numero1 + numero2);
        } catch (Exception e) {
            System.err.println("Error en Fracciones: " + e.getMessage());
            return "0";
        }
    }
    
    public static String resta(String num1, String num2)
    {
        try {
            double numero1 = getValorDecimal(num1);
            double numero2 = getValorDecimal(num2);
            return pasarAFraccion(numero1 - numero2);
        } catch (Exception e) {
            System.err.println("Error en Fracciones: " + e.getMessage());
            return "0";
        }
    }
    
    public static String pasarAFraccion(double x) 
    {
        int whole = (int) x;
        int denominator = 64;
        int numerator = (int)( (x - whole) * denominator );

        if (numerator == 0) 
        {
            return String.valueOf(whole);
        }
        while ( numerator % 2 == 0 ) // simplify fraction
        {
            numerator /= 2;
            denominator /=2;
        }
        return whole + " " + numerator + "/" + denominator;
    }
}
