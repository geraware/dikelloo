/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package herramientas;

/**
 *
 * @author Leon
 */
public class GlosarioDisenio 
{
    public static String getTema(String tema)
    {
        String nombreTema = "";
        
        if(tema.equals("LB"))
        {
            nombreTema = "Lady Baroque";
        }else if(tema.equals("WF"))
        {
            nombreTema = "Wild Flower";
        }else if(tema.equals("DE"))
        {
            nombreTema = "Deluxe";
        }else if(tema.equals("PB"))
        {
            nombreTema = "Princess Baroque";
        }else if(tema.equals("FL"))
        {
            nombreTema = "Flower Love";
        }else if(tema.equals("IN"))
        {
            nombreTema = "Icon";
        }else if(tema.equals("RO"))
        {
            nombreTema = "Romantico";
        }else if(tema.equals("UR"))
        {
            nombreTema = "Urbano";
        }else if(tema.equals("ET"))
        {
            nombreTema = "Etnico";
        }else if(tema.equals("ST"))
        {
            nombreTema = "Sin Tema";
            
        }else if(tema.equals("PW"))
        {
            nombreTema = "Pretty Woman";
            
        }else if(tema.equals("PR"))
        {
            nombreTema = "Pretty";
            
        }else if(tema.equals("GY"))
        {
            nombreTema = "Gypsy";
            
        }else if(tema.equals("FU"))
        {
            nombreTema = "Funky";
            
        }else if(tema.equals("TR"))
        {
            nombreTema = "Tropics";
            
        }else if(tema.equals("TP"))
        {
            nombreTema = "Tropical Punch";
            
        }else if(tema.equals("VI"))
        {
            nombreTema = "Vintage";
            
        }else if(tema.equals("NO"))
        {
            nombreTema = "Nomada";
            
        }else if(tema.equals("RG"))
        {
            nombreTema = "World Romance-Rodeo Glam";
            
        }else if(tema.equals("CN"))
        {
            nombreTema = "World Romance-Chic Nomad";
            
        }else if(tema.equals("GR"))
        {
            nombreTema = "Grunge";
            
        }else if(tema.equals("EM"))
        {
            nombreTema = "Emozione";
            
        }else if(tema.equals("SC"))
        {
            nombreTema = "Summer City";
            
        }
        
        
        return nombreTema;
    }
    
    public static String getDisenador(String disenador)
    {
        String nombreDisenador = "";
        
        if(disenador.equals("1"))
        {
            nombreDisenador = "Sara Tejada";
        }else if(disenador.equals("2"))
        {
            nombreDisenador = "Erandi Garcia";
        }else if(disenador.equals("3"))
        {
            nombreDisenador = "David Riveros";
        }else if(disenador.equals("4"))
        {
            nombreDisenador = "Ana Camperos";
        }else if(disenador.equals("5"))
        {
            nombreDisenador = "Karen Bedolla Osorio";
        }else if(disenador.equals("X"))
        {
            nombreDisenador = "Antiguo Desarrollo";
        }
        
        return nombreDisenador;
        
    }
    
    public static String getSegmento(String valor)
    {
        String nombre = "";
        
        if(valor.equals("1"))
        {
            nombre = "Dama";
            
        }else if(valor.equals("2"))
        {
            nombre = "Niña";
            
        }else if(valor.equals("3"))
        {
            nombre = "Teens";
            
        }else if(valor.equals("5"))
        {
            nombre = "Junior";
            
        }else if(valor.equals("6"))
        {
            nombre = "Extra Dama";
            
        }else if(valor.equals("8"))
        {
            nombre = "Extra Caballero";
            
        }else if(valor.equals("7"))
        {
            nombre = "Caballero";
            
        }else if(valor.equals("4"))
        {
            nombre = "Niño";
            
        }
        
        return nombre;
        
    }
    
    public static String getLinea(String valor)
    {
        String nombre = "";
        
        if(valor.equals("B"))
        {
            nombre = "Basico";
        }else if(valor.equals("E"))
        {
            nombre = "Estrategico";
        }else if(valor.equals("M"))
        {
            nombre = "Moda";
        }else if(valor.equals("J"))
        {
            nombre = "Jeggins";
        }
        
        return nombre;
        
    }
    
    public static String getCorte(String valor)
    {
        String nombre = "";
        
        if(valor.equals("TU"))
        {
            nombre = "Tubo";
        }else if(valor.equals("TO"))
        {
            nombre = "Tobillero";
        }else if(valor.equals("RE"))
        {
            nombre = "Recto";
        }else if(valor.equals("CA"))
        {
            nombre = "Capri";
        }else if(valor.equals("CM"))
        {
            nombre = "Campana";
        }else if(valor.equals("SC"))
        {
            nombre = "Semi Campana";
        }else if(valor.equals("FA"))
        {
            nombre = "Falda";
            
        }else if(valor.equals("SH"))
        {
            nombre = "Short";
        }else if(valor.equals("SR"))
        {
            nombre = "Semi Recto";
        }
        
        return nombre;
        
    }
    
    public static String getColeccion(String valor)
    {
        String nombre = "";
        
        if(valor.equals("V"))
        {
            nombre = "Verano";
        }else if(valor.equals("I"))
        {
            nombre = "Invierno";
        }
        
        return nombre;
    }
}
