<%-- 
    Document   : detallesventa
    Created on : 19-ene-2015, 16:06:45
    Author     : gerardo
--%>

<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="reportes.ventas.Ventas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de la Venta</title>
        <%
            int idVenta = Integer.parseInt(request.getParameter("idVenta"));
            Ventas dVentas = new Ventas();
            ResultSet ventas = null;
            ResultSet detalleVenta = null;
            
            ventas = dVentas.getDetallesVenta(idVenta);
            detalleVenta = dVentas.getVenta(idVenta);
            detalleVenta.next();
            
            DecimalFormatSymbols simbolo=new DecimalFormatSymbols();
            simbolo.setDecimalSeparator('.');
            simbolo.setGroupingSeparator(',');
            DecimalFormat df = new DecimalFormat("###,###.##", simbolo);
        %>
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <link rel="stylesheet" href="css/jquery-ui.css">
        <script src="js/utilerias.js"></script>
    </head>
    <body style="font-family: Tahoma, Arial">
        <h2>Detalle de la venta</h2>
        <hr/>
        <table border="1" cellspacing="0" cellpadding="2" bordercolor="000000">
            <tr>
                <td><b>Cliente:</b></td>
                <td><%= detalleVenta.getString("cliente") %></td>
            </tr>
            <tr>
                <td><b>Vendedor:</b></td>
                <td><%= detalleVenta.getString("vendedor") %></td>
            </tr>
            <tr>
                <td><b>Total:</b></td>
                <td style="color: blue">$ <%= df.format(detalleVenta.getFloat("total")) %></td>
            </tr>
            <tr>
                <td><b>Fecha:</b></td>
                <td><%= detalleVenta.getString("fecha") %></td>
            </tr>
        </table>
        <br/><br/>
        <table>
            <tr>
                <td><b>Codigo</b></td>
                <td><b>Alterno</b></td>
                <td><b>Descripcion</b></td>
                <td><b>Cantidad</b></td>
                <td><b>Precio venta</b></td>
                <td><b>IVA</b></td>
                <td><b>IEPS</b></td>
                <td><b>Subtotal</b></td>
            </tr>
            <%
                float subtotal = 0;    
                while(ventas.next())
                {
                    
                    subtotal += (ventas.getFloat("cantidad") * (ventas.getFloat("precioVenta") + (ventas.getFloat("precioVenta") * ((ventas.getFloat("iva") + ventas.getFloat("ieps")) / 100))) );
            %>
            <tr>
                <td><%= ventas.getString("codigo") %></td>
                <td><%= ventas.getString("alterno") %></td>
                <td><%= ventas.getString("descripcion") %></td>
                <td style="text-align: center"><%= ventas.getString("cantidad") %></td>
                <td style="text-align: center">$ <%= df.format(ventas.getFloat("precioVenta")) %></td>
                <td style="text-align: center"><%= ventas.getString("iva") %> %</td>
                <td style="text-align: center"><%= ventas.getString("ieps") %> %</td>
                <td style="text-align: center">$ <%= df.format(subtotal) %></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="color: blue; font-size: 18px; text-align: center">$ <%= df.format(subtotal) %></td>
            </tr>
        </table>
        <br/>
        <h2>Movimientos de pagos registrados</h2>
        <table>
            <tr>
                <td><b>Fecha</b></td>
                <td><b>Tipo</b></td>
                <td><b>Total</b></td>
                <td><b>Referencia</b></td>
                <td><b>Banco</b></td>
                <td><b>Usuario</b></td>
            </tr>
            <%
                ResultSet movimientos = dVentas.getMovimientos(idVenta);
                float saldo = 0;
                while(movimientos.next())
                {
                    saldo += movimientos.getFloat("total");
            %>
            <tr>
                <td><%= movimientos.getString("fecha") %></td>
                <td><%= movimientos.getString("tipo") %></td>
                <td>$ <%= df.format(movimientos.getFloat("total")) %></td>
                <td><%= movimientos.getString("referencia") %></td>
                <td><%= movimientos.getString("banco") %></td>
                <td><%= movimientos.getString("vendedor") %></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="6" style="color: red">Cantidad liquidada: $ <%= df.format(saldo) %></td>
            </tr>
        </table>
    </body>
</html>
