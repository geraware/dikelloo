/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes.proveedores;

import conexion.Datos;
import java.sql.ResultSet;

/**
 *
 * @author gerardo
 */
public class ReportesProveedores extends Datos
{
    private String sql;
    
    public ResultSet getAlmacenesAbasto()
    {
        sql = "select id, nombre from almacenes where esAbasto = 1 "
                + "order by nombre";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getAlmacenes()
    {
        sql = "select id, nombre from almacenes where "
                + "order by nombre";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getInventariosPorRutas()
    {
        sql = "select a.id, r.id as idRuta, r.clave as codigoRuta, \n" +
        "p.codigo, p.alterno, p.descripcion, m.cantidad from almacenes as a, \n" +
        "productos as p, multialmacen as m, rutas as r where m.idAlmacen = a.id and \n" +
        "a.idRuta = r.id and m.idProducto = p.id order by a.id, p.codigo;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getDetallesVenta()
    {
        sql = "select z.id as idZona, p.codigo, p.alterno, p.descripcion, c.nombre, c.tipoCliente, \n" +
        "a.id as idAlmacen, a.nombre, v.cantidad, v.precioVenta, \n" +
        "date_format(v.fechaRegistro, '%d/%m/%Y') as fecha, \n" +
        "v.idVendedor, v.idVenta, r.id as idRuta, c.id as idCliente, c.clave\n" +
        " from clientes as c, almacenes as a, zonas as z, productos as p, \n" +
        "ventas as v, rutas as r where r.idZona = z.id and z.idAlmacen = a.id and \n" +
        "c.idRuta = r.id and v.idCliente = c.id and v.idProducto = p.id order by \n" +
        "z.id, a.id, p.codigo;";
        
        return this.obtenerRegistros(sql);
        
    }
    
    public ResultSet getRutas()
    {
        sql = "select z.id as idZona, z.clave, z.nombre, r.id, r.clave, r.nombre as nombreRuta, r.descripcion  \n" +
        "from rutas as r, zonas as z, almacenes as a where \n" +
        "r.idZona = z.id and z.idAlmacen = a.id order by z.id, r.id;";
        
        return this.obtenerRegistros(sql);
        
    }
    
}
