<%-- 
    Document   : devoluciones
    Created on : 21-ene-2015, 12:11:27
    Author     : gerardo
--%>

<%@page import="reportes.usuarios.Usuarios"%>
<%@page import="reportes.devoluciones.DevolucionesRMI"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Devoluciones de RMI</title>
        <link rel="stylesheet" href="../assets/font-awesome-4.2.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../assets/fancy-buttons/fancy-buttons.css">
        <script src="../js/jquery-1.10.2.js"></script>
        <script src="../js/jquery-ui.js"></script>
        <link rel="stylesheet" href="../css/jquery-ui.css">
        <script src="../js/utilerias.js"></script>
        
        <%
            
            ResultSet devoluciones = null;
            DevolucionesRMI daoRMI = new DevolucionesRMI();
            
            devoluciones = daoRMI.getInventarioDevoluciones();
            
            DecimalFormatSymbols simbolo=new DecimalFormatSymbols();
            simbolo.setDecimalSeparator('.');
            simbolo.setGroupingSeparator(',');
            DecimalFormat df = new DecimalFormat("###,###.##", simbolo);
        %>
    </head>
    <body style="font-family: Tahoma, Arial;">
        <h2>Reporte de devoluciones</h2>
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
        <table>
            <tr>
                <td>
                    <b>Codigo</b>
                </td>
                <td>
                    <b>Alterno</b>
                </td>
                <td>
                    <b>Descripcion</b>
                </td>
                <td>
                    <b>Cantidad</b>
                </td>
            </tr>
            <%
              while(devoluciones.next())
              {
            %>
            <tr>
                <td>
                    <%= devoluciones.getString("codigo") %>
                </td>
                <td>
                    <%= devoluciones.getString("alterno") %>
                </td>
                <td>
                    <%= devoluciones.getString("descripcion") %>
                </td>
                <td style="text-align: center">
                    <%= devoluciones.getString("cantidad") %>
                </td>
            </tr>
            <%
              }                             
            %>
        </table>
    </body>
</html>
