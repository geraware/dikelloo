/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes.usuarios;

import conexion.Datos;
import java.sql.ResultSet;

/**
 *
 * @author gerardo
 */
public class Usuarios extends Datos
{
    
    private String sql = "";
    
    public ResultSet getVendedores()
    {
        sql = "select concat(nombre,' ',apellidoPaterno,' ',apellidoMaterno) as nombre,"
                + "idUsuarios as id from usuarios where"
                + " rol = 1 order by concat(nombre,' ',apellidoPaterno,' ',apellidoMaterno)";
        
        return this.obtenerRegistros(sql);
    }
    
}
