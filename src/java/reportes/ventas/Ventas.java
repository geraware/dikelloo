/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes.ventas;

import conexion.Datos;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import reportes.objetos.valor;

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
    
    public List<valor> getCategorias()
    {
        List<valor> datos = new ArrayList<>();
        
        try {
            sql = "select id, descripcion from familias order by descripcion;";
            ResultSet valores = this.obtenerRegistros(sql);
            
            while(valores.next())
            {
                int id = valores.getInt("id");
                String descripcion = valores.getString("descripcion");
                datos.add(new valor(id, descripcion));
            }
        } catch (SQLException ex) {
            
        }
        
        return datos;
    }
    
    public float getVentaPorCategoriaPorVendedor(int idCategoria, int idVendedor, String fechaInicial, String fechaFinal)
    {
        float total = 0f;
        
        sql = "";
        
        try {
            
            ResultSet valores = null;
            
            if(fechaInicial.trim().length() > 1)
            {
                sql = "select v.idVendedor,f.descripcion, sum(v.cantidad * v.precioVenta) as total\n" +
                " from familias as f, productos as p, ventas as v, ventasdetalles as vd where \n" +
                "v.idVenta = vd.id and p.idFamilia = f.id and v.idProducto = p.id and \n" +
                "vd.estatus = 'Registrada' and v.idVendedor = " + idVendedor + " and f.id = " + idCategoria 
                + " and date_format(v.fechaRegistro, '%d-%m-%Y') between '" + fechaInicial + "' and '" + fechaFinal + "'" + " group by \n" +
                "v.idVendedor order by f.descripcion;";

                valores = this.obtenerRegistros(sql);
                
            }else
            {
                sql = "select v.idVendedor,f.descripcion, sum(v.cantidad * v.precioVenta) as total\n" +
                " from familias as f, productos as p, ventas as v, ventasdetalles as vd where \n" +
                "v.idVenta = vd.id and p.idFamilia = f.id and v.idProducto = p.id and \n" +
                "vd.estatus = 'Registrada' and v.idVendedor = " + idVendedor + " and f.id = " + idCategoria + " group by \n" +
                "v.idVendedor order by f.descripcion;";
                
                valores = this.obtenerRegistros(sql);
                
            }
            
            
            valores.next();
            total = valores.getFloat("total");
        } catch (Exception e) {
            
        }
        
        return total;
    }
    
    public float getTotalDeCategoria(int idCategoria, String fechaInicial, String fechaFinal)
    {
        float total =0f;
        
        sql = "";
        
        if(fechaInicial.trim().length() < 1)
        {
           sql = "select f.id,f.descripcion, sum(v.cantidad * v.precioVenta) as total\n" +
            " from familias as f, productos as p, ventas as v, ventasdetalles as vd where \n" +
            "v.idVenta = vd.id and p.idFamilia = f.id and v.idProducto = p.id and \n" +
            "vd.estatus = 'Registrada' and f.id = " + idCategoria + " group by \n" +
            "f.id order by f.descripcion;"; 
        }else
        {
            sql = "select f.id,f.descripcion, sum(v.cantidad * v.precioVenta) as total\n" +
            " from familias as f, productos as p, ventas as v, ventasdetalles as vd where \n" +
            "v.idVenta = vd.id and p.idFamilia = f.id and v.idProducto = p.id and \n" +
            "vd.estatus = 'Registrada' and f.id = " + idCategoria +
            " and date_format(v.fechaRegistro, '%d-%m-%Y') between '" + fechaInicial + "' and '" + fechaFinal + "'" + " group by \n" +
            "f.id order by f.descripcion;";
        }
        
        
        try {
            ResultSet valores = this.obtenerRegistros(sql);
            valores.next();
            total = valores.getFloat("total");
        } catch (Exception e) {
            
        }
        
        return total;
    }
    
    
    
}
