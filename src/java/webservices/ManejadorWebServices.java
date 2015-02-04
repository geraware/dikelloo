/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webservices;

/**
 *
 * @author gerardo
 */
public class ManejadorWebServices 
{

    public String almacenes() {
        webservices.WSAlmacenes_Service service = new webservices.WSAlmacenes_Service();
        webservices.WSAlmacenes port = service.getWSAlmacenesPort();
        return port.almacenes();
    }
    
    
}
