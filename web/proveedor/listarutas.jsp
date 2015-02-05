<%-- 
    Document   : listarutas
    Created on : 20-ene-2015, 14:01:53
    Author     : gerardo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="reportes.proveedores.ReportesProveedores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Almacenes</title>
        <%
            ReportesProveedores daoReportes = new ReportesProveedores();
            ResultSet cedis = daoReportes.getAlmacenes();
            ResultSet rutas = daoReportes.getRutas();
        %>
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="../assets/font-awesome-4.2.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../assets/fancy-buttons/fancy-buttons.css">
        <script src="js/utilerias.js"></script>
    </head>
    <body style="font-family: Tahoma, Arial">
        <h3>CEDIS</h3>
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
                <td><b>CODIGO</b></td>
                <td><b>NOMBRE</b></td>
                <td><b>CODIGO_DISTRIBUIDOR</b></td>
            </tr>
            <%
                while(cedis.next())
                {
            %>
            <tr>
                <td><%= cedis.getString("id") %></td>
                <td><%= cedis.getString("nombre") %></td>
                <td>DIK</td>
            </tr>
            <%
                }
            %>
        </table>
        <br/>
        <h3>Rutas</h3>
        <hr/>
        <table border="1" cellspacing="0" cellpadding="2" bordercolor="000000">
            <tr>
                <td>
                    <b>CODIGO_RUTA</b>
                </td>
                <td>
                    <b>NOMBRE_RUTA</b>
                </td>
                <td>
                    <b>CODIGO_CEDIS</b>
                </td>
                <td>
                    <b>TIPO</b>
                </td>
                <td>
                    <b>INACTIVIDAD</b>
                </td>
            </tr>
            <%
                while(rutas.next())
                {
            %>
            <tr>
                <td>
                    <%= rutas.getString("idZona") + "-" + rutas.getString("id") %>
                </td>
                <td>
                    <%= rutas.getString("nombreRuta") %>
                </td>
                <td>
                    <%= rutas.getString("idZona") %>
                </td>
                <td>
                    <%= rutas.getString("descripcion") %>
                </td>
                <td>
                    
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
