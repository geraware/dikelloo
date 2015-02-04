<%-- 
    Document   : movimientosalmacen
    Created on : 22-ene-2015, 13:01:21
    Author     : gerardo
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="reportes.almacenes.InventariosAlmacenes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movimientos del Almacen</title>
        <%
            int idAlmacen = 0;
            String fechaInicial = "";
            String fechaFinal = "";
            
            InventariosAlmacenes inventario = new InventariosAlmacenes();
            ResultSet almacenes = inventario.getAlmacenes();
            
            if(request.getParameter("idAlmacen") != null)
            {
                idAlmacen = Integer.parseInt(request.getParameter("idAlmacen"));
            }
            
            if(request.getParameter("fechaInicial") != null)
            {
                if(request.getParameter("fechaFinal") != null)
                {
                    fechaInicial = request.getParameter("fechaInicial");
                    fechaFinal = request.getParameter("fechaFinal");
                }
            }
            
            InventariosAlmacenes dInventarios = new InventariosAlmacenes();
            ResultSet movimientos = null;
            
            if(idAlmacen == 0)
            {
                movimientos = dInventarios.getLogsMovimientos(fechaInicial, fechaFinal);
            }else
            {
                movimientos = dInventarios.getLogsMovimientos(fechaInicial, fechaFinal, idAlmacen);
            }
            
            DecimalFormatSymbols simbolo=new DecimalFormatSymbols();
            simbolo.setDecimalSeparator('.');
            simbolo.setGroupingSeparator(',');
            DecimalFormat df = new DecimalFormat("###,###.##", simbolo);
            
        %>
        <link rel="stylesheet" href="../assets/font-awesome-4.2.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../assets/fancy-buttons/fancy-buttons.css">
        <script src="../js/jquery-1.10.2.js"></script>
        <script src="../js/jquery-ui.js"></script>
        <link rel="stylesheet" href="../css/jquery-ui.css">
        <script src="../js/utilerias.js"></script>
        <script>
             $(function() {
                $( "#fechaInicial" ).datepicker();
                $( "#fechaFinal" ).datepicker();
             });
        </script>
    </head>
    <body style="font-family: Tahoma, Arial;">
        <h3>Movimientos realizados en los almacenes</h3>
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
        <form method="POST">
        <table style="width: 100%"  border="1" cellspacing="0" cellpadding="2" bordercolor="000000">
            <tr>
                <td valign="top">
                    <table>
                        <tr>
                            <td><b>Seleccione el Almacen</b></td>
                        </tr>
                        <tr>
                            <td>
                                <select name="idAlmacen">
                                    <option value="0"></option>
                                    <%
                                        while(almacenes.next())
                                        {
                                    %>
                                    <option value="<%= almacenes.getInt("id") %>"><%= almacenes.getString("nombre") %></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                   <table border="1" cellspacing="0" cellpadding="2" bordercolor="000000" style="background-color: #c6dbdd">
                        <tr>
                            <td>
                                <b>Fecha inicial:</b>
                                <input type="text" id="fechaInicial" name="fechaInicial" style="border-radius: 3px; font-size: 14px"/>
                            </td>
                            <td>
                                <b>Fecha final:</b>
                                <input type="text" id="fechaFinal" name="fechaFinal" style="border-radius: 3px; font-size: 14px"/>
                            </td>
                            <td>
                                <input type="submit" value="Filtrar" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </form>
        <hr/>
        <table border="1" cellspacing="0" cellpadding="2" bordercolor="000000">
            <tr>
                <td>
                    <b>Tipo</b>
                </td>
                <td>
                    <b>Fecha</b>
                </td>
                <td>
                    <b>Almacen</b>
                </td>
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
                    <b>Precio</b>
                </td>
                <td>
                    <b>Cantidad</b>
                </td>
                <td>
                    <b>Subtotal</b>
                </td>
            </tr>
            <%
                while(movimientos.next())
                {
            %>
            <tr>
                <td>
                    <%= movimientos.getString("tipo") %>
                </td>
                <td>
                    <%= movimientos.getString("fecha") %>
                </td>
                <td>
                    <%= movimientos.getString("nombre") %>
                </td>
                <td>
                    <%= movimientos.getString("codigo") %>
                </td>
                <td>
                    <%= movimientos.getString("alterno") %>
                </td>
                <td>
                    <%= movimientos.getString("descripcion") %>
                </td>
                <td style="text-align: center">
                    $ <%= df.format(movimientos.getFloat("precio")) %>
                </td>
                <td style="text-align: center">
                    <%= movimientos.getString("cantidad") %>
                </td>
                <td style="text-align: center">
                    $ <%= df.format(movimientos.getFloat("precio") * movimientos.getFloat("cantidad")) %>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
