/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes.ventas;

import conexion.Datos;
import java.sql.ResultSet;

/**
 *
 * @author gerardo
 */
public class Ventas extends Datos 
{
    private String sql;
    
    public ResultSet getVentas()
    {
        sql = "select v.id, c.nombre as cliente,\n" +
        "concat(u.nombre,' ',u.apellidoPaterno,' ',u.apellidoMaterno) as vendedor\n" +
        ", v.total, v.totalLiquidado as liquidado,\n" +
        " v.saldo, date_format(v.fechaRegistro, '%d-%m-%Y') as fecha \n" +
        " from ventasdetalles as v, clientes as c, usuarios as u where \n" +
        " v.idVendedor = u.idUsuarios and v.idCliente = c.id order by v.fechaRegistro desc \n" +
        " limit 0, 100;";
        
        return this.obtenerRegistros(sql);
        
    }
    
    public ResultSet getVentasConSaldo()
    {
        sql = "select v.id, c.nombre as cliente,\n" +
        "concat(u.nombre,' ',u.apellidoPaterno,' ',u.apellidoMaterno) as vendedor\n" +
        ", v.total, v.totalLiquidado as liquidado,\n" +
        " v.saldo, date_format(v.fechaRegistro, '%d-%m-%Y') as fecha \n" +
        " from ventasdetalles as v, clientes as c, usuarios as u where \n" +
        " v.idVendedor = u.idUsuarios and v.idCliente = c.id and v.saldo > 0 order by v.fechaRegistro desc \n" +
        " ";
        
        return this.obtenerRegistros(sql);
        
    }
    
    public ResultSet getVenta(int idVenta)
    {
        sql = "select v.id, c.nombre as cliente,\n" +
        "concat(u.nombre,' ',u.apellidoPaterno,' ',u.apellidoMaterno) as vendedor\n" +
        ", v.total, v.totalLiquidado as liquidado,\n" +
        " v.saldo, date_format(v.fechaRegistro, '%d-%m-%Y') as fecha \n" +
        " from ventasdetalles as v, clientes as c, usuarios as u where \n" +
        " v.idVendedor = u.idUsuarios and v.idCliente = c.id and v.id = " + idVenta;
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getDetallesVenta(int idVenta)
    {
        sql = "select p.codigo, p.descripcion, p.alterno, \n" +
        "v.cantidad, v.precioVenta, v.iva, v.ieps from ventas as v, productos as p \n" +
        "where v.idProducto = p.id and v.idVenta = " + idVenta
        + " order by p.descripcion;";
        
        return this.obtenerRegistros(sql);
    }
    
    public ResultSet getMovimientos(int idVenta)
    {
        sql = "select m.tipo, m.total, date_format(m.fechaCobro, '%d-%m-%Y') as fecha,\n" +
        " m.referencia,\n" +
        "m.banco, concat(u.nombre,' ',u.apellidoPaterno,' ',u.apellidoMaterno) as vendedor\n" +
        " from movimientospagos as m, usuarios as u where m.idUsuario = u.idUsuarios and \n" +
        " m.idVenta = " + idVenta + " order by m.fechaRegistro desc;";
        
        return this.obtenerRegistros(sql);
    }
    
    
    
}
