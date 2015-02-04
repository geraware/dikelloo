<%-- 
    Document   : listaventas
    Created on : 20-ene-2015, 14:02:06
    Author     : gerardo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="reportes.proveedores.ReportesProveedores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas</title>
        <%
            ReportesProveedores daoReportes = new ReportesProveedores();
            ResultSet ventas = null;
            ventas = daoReportes.getDetallesVenta();
        %>
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <link rel="stylesheet" href="css/jquery-ui.css">
        <script src="js/utilerias.js"></script>
    </head>
    <body>
        <h3>Reporte de ventas</h3>
        <hr/>
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
        <table border="1" cellspacing="0" cellpadding="2" bordercolor="000000">
            <tr>
                <td>
                    <b>CODIGO_DISTRIBUIDOR</b>
                </td>
                <td>
                    <b>CODIGO_CEDIS</b>
                </td>
                <td>
                    <b>CODIGO_RUTA</b>
                </td>
                <td>
                    <b>CODIGO_CLIENTE</b>
                </td>
                <td>
                    <b>TIPO_MOVIMIENTO</b>
                </td>
                <td>
                    <b>FECHA</b>
                </td>
                <td>
                    <b>CODIGO_PRODUCTO</b>
                </td>
                <td>
                    <b>UNIDADES</b>
                </td>
                <td>
                    <b>PESOS</b>
                </td>
            </tr>
            <%
                while(ventas.next())
                {
            %>
            <tr>
                <td>
                    DIK
                </td>
                <td>
                    <%= ventas.getString("idZona") %>
                </td>
                <td>
                    <%= ventas.getString("idZona") + "-" + ventas.getString("idRuta") %>
                </td>
                <td>
                    <%= ventas.getString("idCliente") %>
                </td>
                <td>
                    SALE
                </td>
                <td>
                    <%= ventas.getString("fecha") %>
                </td>
                <td>
                    <%= ventas.getString("codigo") %>
                </td>
                <td>
                    <%= ventas.getString("cantidad") %>
                </td>
                <td>
                    <%= ventas.getString("precioVenta") %>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
