/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes.compras;

import conexion.Datos;
import java.sql.ResultSet;

/**
 *
 * @author gerardo
 */
public class Compras extends Datos
{
    private String sql;
    
    public ResultSet getProveedores()
    {
        sql = "select id, clave, nombre, rfc from proveedores order by nombre;";
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getCompras()
    {
        sql = "select date_format(c.fechaRegistro, '%d-%m-%Y') as fecha,c.id, c.numFactura, c.total, p.clave, \n" +
        "p.nombre, p.rfc, concat(u.nombre,' ',u.apellidoPaterno,' ',u.apellidoMaterno) as comprador \n" +
        " from compras as c, usuarios as u, proveedores as p where c.idUsuario = \n" +
        " u.idUsuarios and p.id = c.idProveedor order by c.fechaRegistro desc limit 0, 1000;";
        
        return this.obtenerRegistros(sql);
        
    }
    
    public ResultSet getCompras(String fechaInicial, String fechaFinal)
    {
        sql = "select date_format(c.fechaRegistro, '%d-%m-%Y') as fecha,c.id, c.numFactura, c.total, p.clave, \n" +
        "p.nombre, p.rfc, concat(u.nombre,' ',u.apellidoPaterno,' ',u.apellidoMaterno) as comprador \n" +
        " from compras as c, usuarios as u, proveedores as p where c.idUsuario = \n" +
        " u.idUsuarios and p.id = c.idProveedor and date_format(c.fechaRegistro, '%d-%m-%Y') between '" + fechaInicial + "' and '" + fechaFinal + "' order by c.fechaRegistro desc limit 0, 1000;";
        
        return this.obtenerRegistros(sql);
        
    }
    
    public ResultSet getComprasPorProveedor(int idProveedor)
    {
        sql = "select date_format(c.fechaRegistro, '%d-%m-%Y') as fecha,c.id, c.numFactura, c.total, p.clave, \n" +
        "p.nombre, p.rfc, concat(u.nombre,' ',u.apellidoPaterno,' ',u.apellidoMaterno) as comprador \n" +
        " from compras as c, usuarios as u, proveedores as p where c.idUsuario = \n" +
        " u.idUsuarios and p.id = c.idProveedor and c.idProveedor = " + idProveedor + " order by c.fechaRegistro desc limit 0, 1000;";
        
        return this.obtenerRegistros(sql);
        
    }
    
    public ResultSet getComprasDetalles(int idCompra)
    {
        sql = "select p.codigo, p.alterno, p.descripcion, c.cantidad, c.precio, c.iva, c.ieps from \n" +
        "comprasdetalles as c, productos as p where c.idProducto = p.id and \n" +
        "c.idCompra = " + idCompra + " order by p.descripcion;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getComprasDetalladas()
    {
        sql = "select co.id, date_format(co.fechaRegistro, '%d/%m/%Y') as fecha, co.numFactura\n" +
        ", p.codigo, p.alterno, p.descripcion, p.utilidad, c.cantidad, \n" +
        "c.precio, (c.precio * c.cantidad) as subtotal,\n" +
        "(c.precio * (c.iva / 100)) as iva, (c.precio * (c.ieps / 100)) as ieps,\n" +
        "((c.precio + ((c.precio * (c.iva / 100)) + (c.precio * (c.ieps / 100)))) * c.cantidad)  as totalImpuesto,\n" +
        " pro.nombre, pro.rfc, a.nombre as almacen from \n" +
        "comprasdetalles as c, productos as p, compras as co, proveedores as pro,\n" +
        "almacenes as a   \n" +
        "where c.idProducto = p.id and \n" +
        "c.idCompra = co.id and co.idProveedor = pro.id and co.idAlmacen = a.id \n" +
        "order by date_format(co.fechaRegistro, '%d/%m/%Y') desc ,p.descripcion limit 0, 1000;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getComprasDetalladas(int idProveedor)
    {
        sql = "select co.id, date_format(co.fechaRegistro, '%d/%m/%Y') as fecha, co.numFactura\n" +
        ", p.codigo, p.alterno, p.descripcion, p.utilidad, c.cantidad, \n" +
        "c.precio, (c.precio * c.cantidad) as subtotal,\n" +
        "(c.precio * (c.iva / 100)) as iva, (c.precio * (c.ieps / 100)) as ieps,\n" +
        "((c.precio + ((c.precio * (c.iva / 100)) + (c.precio * (c.ieps / 100)))) * c.cantidad)  as totalImpuesto,\n" +
        " pro.nombre, pro.rfc, a.nombre as almacen from \n" +
        "comprasdetalles as c, productos as p, compras as co, proveedores as pro,\n" +
        "almacenes as a   \n" +
        "where c.idProducto = p.id and \n" +
        "c.idCompra = co.id and co.idProveedor = pro.id and co.idProveedor = " + idProveedor + " and co.idAlmacen = a.id \n" +
        "order by date_format(co.fechaRegistro, '%d/%m/%Y') desc ,p.descripcion limit 0, 1000;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getComprasDetalladas(String fechaInicial, String fechaFinal)
    {
        sql = "select co.id, date_format(co.fechaRegistro, '%d/%m/%Y') as fecha, co.numFactura\n" +
        ", p.codigo, p.alterno, p.descripcion, p.utilidad, c.cantidad, \n" +
        "c.precio, (c.precio * c.cantidad) as subtotal,\n" +
        "(c.precio * (c.iva / 100)) as iva, (c.precio * (c.ieps / 100)) as ieps,\n" +
        "((c.precio + ((c.precio * (c.iva / 100)) + (c.precio * (c.ieps / 100)))) * c.cantidad)  as totalImpuesto,\n" +
        " pro.nombre, pro.rfc, a.nombre as almacen from \n" +
        "comprasdetalles as c, productos as p, compras as co, proveedores as pro,\n" +
        "almacenes as a   \n" +
        "where c.idProducto = p.id and \n" +
        "c.idCompra = co.id and co.idProveedor = pro.id and co.idAlmacen = a.id and " +
        "date_format(co.fechaRegistro, '%d-%m-%Y') between '" + fechaInicial + "' and '" + fechaFinal + "' order by date_format(co.fechaRegistro, '%d/%m/%Y') desc ,p.descripcion limit 0, 1000;";
        
        return this.obtenerRegistros(sql);
    }
    
}
