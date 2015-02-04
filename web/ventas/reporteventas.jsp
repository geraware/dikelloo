<%-- 
    Document   : reporteventas
    Created on : 19-ene-2015, 15:04:16
    Author     : gerardo
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="reportes.ventas.Ventas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de ventas</title>
        <%
            Ventas dVentas = new Ventas();
            ResultSet ventas = null;
            ventas = dVentas.getVentas();
            
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
    <body  style="font-family: Tahoma, Arial">
        <h2>Reporte de ventas</h2>
        <div>
            <table>
                <tr>
                    <td>
                        <a href="../index.jsp" class="fancy-button medium half-right-rounded concrete up" style="width: 120px">
                            Inicio
                            <span class="icon">
                                    <i class="fa fa-chevron-up"></i>
                            </span>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
        <form>
            
        </form>
        <hr/>
        <table border="1" cellspacing="0" cellpadding="2" bordercolor="000000">
            <tr>
                <td><b>Fecha</b></td>
                <td><b>Cliente</b></td>
                <td><b>Vendedor</b></td>
                <td><b>Total</b></td>
                <td><b>Liquidado</b></td>
                <td><b>Saldo</b></td>
                <td><b></b></td>
            </tr>
            <%
                while(ventas.next())
                {
            %>
            <tr>
                <td><%= ventas.getString("fecha") %></td>
                <td><%= ventas.getString("cliente") %></td>
                <td><%= ventas.getString("vendedor") %></td>
                <td style="color: blue">$ <%= ventas.getString("total") %></td>
                <td style="color: green">$ <%= ventas.getString("liquidado") %></td>
                <td style="color: red">$ <%= ventas.getString("saldo") %></td>
                <td><a href="detallesventa.jsp?idVenta=<%= ventas.getString("id") %>">Detalles de venta</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
