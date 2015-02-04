<%-- 
    Document   : inventario
    Created on : 20-ene-2015, 15:36:16
    Author     : gerardo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="reportes.proveedores.ReportesProveedores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventario</title>
        <%
            ReportesProveedores daoReportes = new ReportesProveedores();
            ResultSet inventario = null;
            inventario = daoReportes.getInventariosPorRutas();
        %>
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <link rel="stylesheet" href="css/jquery-ui.css">
        <script src="js/utilerias.js"></script>
    </head>
    <body style="font-family: Tahoma, Arial">
        <h3>Inventario</h3>
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
        <hr/>
        <table border="1" cellspacing="0" cellpadding="2" bordercolor="000000">
            <tr>
                <td>
                    <b>CODIGO_DISTRIBUIDOR</b>
                </td>
                <td>
                    <b>CODIGO_CEDI</b>
                </td>
                <td>
                    <b>CODIGO_RUTA</b>
                </td>
                <td>
                    <b>CODIGO_PRODUCTO</b>
                </td>
                <td>
                    <b>FECHA</b>
                </td>
                <td>
                    <b>TIPO_INVENTARIO</b>
                </td>
                <td>
                    <b>ESTATUS</b>
                </td>
                <td>
                    <b>INVENTARIO</b>
                </td>
            </tr>
            <%
                while(inventario.next())
                {
            %>
            <tr>
                <td>
                    DIK
                </td>
                <td>
                    <%= inventario.getString("id") %>
                </td>
                <td>
                    <%= inventario.getString("id") + "-" + inventario.getString("idRuta") %>
                </td>
                <td>
                    <%= inventario.getString("codigo") %>
                </td>
                <td>
                    
                </td>
                <td>
                    INWAREHOUSE
                </td>
                <td>
                    AVAILABLE
                </td>
                <td>
                    <%= inventario.getString("cantidad") %>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
