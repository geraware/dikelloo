/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webservices;

import com.google.gson.Gson;
import conexion.Datos;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import reportes.almacenes.InventariosAlmacenes;
import reportes.objetos.valor;

/**
 *
 * @author gerardo
 */
@WebService(serviceName = "wscedis")
public class wscedis {

    private final Gson gson;
    private final InventariosAlmacenes almacenes;
    public wscedis()
    {
        gson = new Gson();
        almacenes = new InventariosAlmacenes();
    }
    
    @WebMethod(operationName = "almacenes")
    public String almacenes() {
        List<valor> valores = new ArrayList<>();
        try {
            ResultSet registros = almacenes.getAlmacenes();
            
            while(registros.next())
            {
                valores.add(new valor(registros.getInt("id"), registros.getString("nombre")));
            }
            
        } catch (SQLException ex) {
            System.err.println("WS Cedis: " + ex.getMessage());
        }
        
        return gson.toJson(valores);
    }
    
//    @WebMethod(operationName = "almacenes")
//    public String inventario(@WebParam(name = "id") String txt)
//    {
//        return "";
//    }
    
}
