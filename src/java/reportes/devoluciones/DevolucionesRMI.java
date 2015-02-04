/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes.devoluciones;

import conexion.Datos;
import java.sql.ResultSet;

/**
 *
 * @author gerardo
 */
public class DevolucionesRMI extends Datos
{
    private String sql;
    
    public ResultSet getInventarioDevoluciones()
    {
        sql = "select p.codigo, p.alterno, p.descripcion, sum(d.cantidad) as cantidad \n" +
        "from devolucionesalmacen as d, \n" +
        "productos as p where d.idProducto = p.id group by p.id\n" +
        "order by p.descripcion";
        
        return this.obtenerRegistros(sql);
        
    }
    
    public ResultSet getDevoluciones()
    {
        sql = "select p.codigo, p.alterno, p.descripcion, d.cantidad as cantidad,\n" +
        "d.precio, d.iva, d.ieps, d.fechaCaducidad, d.comentario, \n" +
        "date_format(d.fechaRegistro, '%d/%m/%Y') as fecha from devoluciones as d, \n" +
        "productos as p where d.idProducto = p.id order by date_format(d.fechaRegistro, '%d/%m/%Y') desc, p.descripcion";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getDevoluciones(int idVendedor)
    {
        sql = "select p.codigo, p.alterno, p.descripcion, d.cantidad as cantidad,\n" +
        "d.precio, d.iva, d.ieps, d.fechaCaducidad, d.comentario, \n" +
        "date_format(d.fechaRegistro, '%d/%m/%Y') as fecha from devoluciones as d, \n" +
        "productos as p where d.idProducto = p.id and d.idVendedor = " + idVendedor 
        + " order by date_format(d.fechaRegistro, '%d/%m/%Y') desc,"
        + " p.descripcion";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getDevoluciones(String fechaInicial, String fechaFinal)
    {
        sql = "select p.codigo, p.alterno, p.descripcion, d.cantidad as cantidad,\n" +
        "d.precio, d.iva, d.ieps, d.fechaCaducidad, d.comentario, \n" +
        "date_format(d.fechaRegistro, '%d/%m/%Y') as fecha from devoluciones as d, \n" +
        "productos as p where d.idProducto = p.id and date_format(d.fechaRegistro, '%d-%m-%Y') between '" + fechaInicial
        + "' and '" + fechaFinal + "' order by date_format(d.fechaRegistro, '%d/%m/%Y') desc,"
        + " p.descripcion";
        
        return this.obtenerRegistros(sql);
    }
    
}
