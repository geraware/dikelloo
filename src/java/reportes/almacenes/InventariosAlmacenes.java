/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes.almacenes;

import conexion.Datos;
import java.sql.ResultSet;

/**
 *
 * @author gerardo
 */
public class InventariosAlmacenes extends Datos
{
    private String sql;
    
    public ResultSet getAlmacenes()
    {
        sql = "select a.id, a.nombre, concat(u.nombre,' ',u.apellidoPaterno,\n" +
        "' ',u.apellidoMaterno) as responsable, r.nombre as ruta, r.clave from \n" +
        "almacenes as a, usuarios as u, rutas as r where a.idUsuarioResponsable = \n" +
        "u.idUsuarios and a.idRuta = r.id order by a.nombre;";
        
        sql = "select * from almacenes order by nombre;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getInventarioAlmacenes()
    {
        sql = "select p.codigo, p.alterno, p.descripcion, p.precioPublico, p.utilidad,p.iva,\n" +
        "p.ieps, p.imagen, a.nombre as almacen, sum(m.cantidad) as cantidad, (sum(m.cantidad) * (p.precioPublico)) as subtotal \n" +
        " from multialmacen as m, productos as p, almacenes as a where m.idProducto = \n" +
        " p.id and m.idAlmacen = a.id group by a.id, p.id order by a.nombre, p.descripcion;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getInventarioAlmacen(int idAlmacen)
    {
        sql = "select p.codigo, p.alterno, p.descripcion, p.precioPublico, p.utilidad,p.iva,\n" +
        "p.ieps, p.imagen, a.nombre as almacen, sum(m.cantidad) as cantidad, (sum(m.cantidad) * (p.precioPublico)) as subtotal \n" +
        " from multialmacen as m, productos as p, almacenes as a where m.idProducto = \n" +
        " p.id and m.idAlmacen = a.id and a.id = " + idAlmacen + " group by a.id, p.id order by a.nombre, p.descripcion;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getLogsMovimientos()
    {
        sql = "select m.tipo, p.codigo, p.alterno, p.descripcion, a.nombre, \n" +
        "concat(u.nombre,' ',u.apellidoPaterno,' ',u.apellidoMaterno) as usuario,\n" +
        "m.cantidad, date_format(m.fechaRegistro, '%d/%m/%Y') as fecha, m.cantidad, m.precio from \n" +
        "movimientosalmacen as m, usuarios as u, productos as p, almacenes as a where \n" +
        "m.idProducto = p.id and m.idAlmacen = a.id and  m.idUsuario = u.idUsuarios \n" +
        "order by date_format(m.fechaRegistro, '%d/%m/%Y') desc limit 0, 1000;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getLogsMovimientos(String fechaInicial, String fechaFinal)
    {
        sql = "select m.tipo, p.codigo, p.alterno, p.descripcion, a.nombre, \n" +
        "concat(u.nombre,' ',u.apellidoPaterno,' ',u.apellidoMaterno) as usuario,\n" +
        "m.cantidad, date_format(m.fechaRegistro, '%d/%m/%Y') as fecha, m.cantidad, m.precio from \n" +
        "movimientosalmacen as m, usuarios as u, productos as p, almacenes as a where \n" +
        "m.idProducto = p.id and m.idAlmacen = a.id and"
        + " m.idUsuario = u.idUsuarios and date_format(m.fechaRegistro, '%d/%m/%Y')"
        + " between '" + fechaInicial + "' and '" + fechaFinal + "'" +
        " order by date_format(m.fechaRegistro, '%d/%m/%Y') desc limit 0, 1000;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getLogsMovimientos(String fechaInicial, String fechaFinal, int idAlmacen)
    {
        sql = "select m.tipo, p.codigo, p.alterno, p.descripcion, a.nombre, \n" +
        "concat(u.nombre,' ',u.apellidoPaterno,' ',u.apellidoMaterno) as usuario,\n" +
        "m.cantidad, date_format(m.fechaRegistro, '%d/%m/%Y') as fecha, m.cantidad, m.precio from \n" +
        "movimientosalmacen as m, usuarios as u, productos as p, almacenes as a where \n" +
        "m.idProducto = p.id and m.idAlmacen = a.id and"
        + " m.idUsuario = u.idUsuarios and m.idAlmacen = " + idAlmacen + " and date_format(m.fechaRegistro, '%d/%m/%Y')"
        + " between '" + fechaInicial + "' and '" + fechaFinal + "'" +
        " order by date_format(m.fechaRegistro, '%d/%m/%Y') desc limit 0, 1000;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getLogsMovimientos(String fechaInicial, String fechaFinal, String tipo)
    {
        sql = "select m.tipo, p.codigo, p.alterno, p.descripcion, a.nombre, \n" +
        "concat(u.nombre,' ',u.apellidoPaterno,' ',u.apellidoMaterno) as usuario,\n" +
        "m.cantidad, date_format(m.fechaRegistro, '%d/%m/%Y') as fecha, m.cantidad, m.precio from \n" +
        "movimientosalmacen as m, usuarios as u, productos as p, almacenes as a where \n" +
        "m.idProducto = p.id and m.idAlmacen = a.id and"
        + " m.idUsuario = u.idUsuarios and date_format(m.fechaRegistro, '%d/%m/%Y')"
        + " between '" + fechaInicial + "' and '" + fechaFinal + "'" +
        " and m.tipo = '" + tipo + "' order by date_format(m.fechaRegistro, '%d/%m/%Y') desc limit 0, 1000;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getZonas()
    {
        sql = "select id, nombre, descripcion, idAlmacen from zonas order by nombre";
        return this.obtenerRegistros(sql);
    }
    
}
