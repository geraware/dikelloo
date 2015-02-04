<%-- 
    Document   : detallescompras
    Created on : 12-ene-2015, 14:04:21
    Author     : gerardo
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="reportes.compras.Compras"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles de compra</title>
        <%
            int idCompra = Integer.parseInt(request.getParameter("idCompra"));
            Compras compras = new Compras();
            ResultSet detalles = compras.getComprasDetalles(idCompra);
            
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
        <h2>Detalles de compra</h2>
        <hr/>
        <table border="1" cellspacing="0" cellpadding="2" bordercolor="000000">
            <tr>
                <td><b>Codigo</b></td>
                <td><b>Alterno</b></td>
                <td><b>Descripcion</b></td>
                <td><b>Cantidad</b></td>
                <td><b>Precio</b></td>
                <td><b>IVA</b></td>
                <td><b>IEPS</b></td>
                <td><b>SUBTOTAL</b></td>
            </tr>
            <%
                float iva = 0;
                float ieps = 0;
                float total = 0;
                while(detalles.next())
                {
                    float impuestos = (detalles.getFloat("iva")/100) + (detalles.getFloat("ieps")/100);
                    float subtotal = detalles.getFloat("cantidad") * (detalles.getFloat("precio") + (detalles.getFloat("precio") * impuestos));
                    total += subtotal;
            %>
            <tr>
                <td><%= detalles.getString("codigo") %></td>
                <td><%= detalles.getString("alterno") %></td>
                <td><%= detalles.getString("descripcion") %></td>
                <td><%= detalles.getString("cantidad") %></td>
                <td>$ <%= df.format(detalles.getFloat("precio")) %></td>
                <td><%= df.format(detalles.getFloat("iva")) %> %</td>
                <td><%= df.format(detalles.getFloat("ieps")) %> %</td>
                <td>$ <%= df.format(subtotal) %></td>
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
                <td><b>Gran total</b></td>
                <td>$ <%= df.format(total) %></td>
            </tr>
        </table>
    </body>
</html>
