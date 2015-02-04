<%-- 
    Document   : reportecompras
    Created on : 12-ene-2015, 13:55:31
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
        <title>Reporte de compras</title>
        <%
            int idProveedor = 0;
            if(request.getParameter("idProveedor") != null)
            {
                idProveedor = Integer.parseInt(request.getParameter("idProveedor"));
            }
            Compras compras = new Compras();
            ResultSet proveedores = compras.getProveedores();
            ResultSet comprasRealizadas = null;
            if(idProveedor == 0)
            {
                comprasRealizadas = compras.getCompras();
            }else
            {
                comprasRealizadas = compras.getComprasPorProveedor(idProveedor);
            }
            
            if(request.getParameter("fechaInicial") != null)
            {
                if(request.getParameter("fechaFinal") != null)
                {
                    String fechaInicial = request.getParameter("fechaInicial");
                    String fechaFinal = request.getParameter("fechaFinal");
                    comprasRealizadas = compras.getCompras(fechaInicial, fechaFinal);
                }
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
    <body style="font-family: Tahoma, Arial">
        <h2>Reporte de compras</h2>
        
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
        <table style="width: 100%">
            <tr>
                <td>
                    <form action="reportecompras.jsp" method="POST">
                        <table border="1" cellspacing="0" cellpadding="2" bordercolor="000000" style="background-color: #c6dbdd">
                            <tr>
                                <td><b>Selecciona el Provedor</b></td>
                                <td>
                                    <select name="idProveedor">
                                        <option value="0"></option>
                                        <%
                                            while(proveedores.next())
                                            {
                                        %>
                                        <option value="<%= proveedores.getInt("id") %>"><%= proveedores.getString("nombre") %></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </td>
                                <td>
                                    <input type="submit" value="Filtrar" />
                                </td>
                            </tr>
                        </table>
                        </form>
                </td>
                <td>
                    <form action="reportecompras.jsp" method="POST">
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
                        </form>
                </td>
            </tr>
        </table>            
        <hr/>
        <table>
            <tr>
                <td><b>Fecha</b></td>
                <td><b>Factura</b></td>
                <td><b>Total</b></td>
                <td><b>Proveedor</b></td>
                <td><b>RFC</b></td>
                <td><b>Comprador</b></td>
                <td><b></b></td>
                
            </tr>
            <%
                float total = 0;
                while(comprasRealizadas.next())
                {
                    //total += productos.getFloat("subtotal");
            %>
           <tr>
                <td style="text-align: left"><%= comprasRealizadas.getString("fecha") %></td>
                <td style="text-align: left"><%= comprasRealizadas.getString("numFactura") %></td>
                <td style="text-align: left">$ <%= df.format(comprasRealizadas.getFloat("total")) %></td>
                <td style="text-align: left">(<%= comprasRealizadas.getString("clave") %>) <%= comprasRealizadas.getString("nombre") %></td>
                <td style="text-align: left"><%= comprasRealizadas.getString("rfc") %></td>
                <td style="text-align: left"><%= comprasRealizadas.getString("comprador") %></td>
                <td style="text-align: left"><a href="detallescompras.jsp?idCompra=<%= comprasRealizadas.getString("id") %>">Detalles</a></td>
            </tr>
            <%
                }
            %>
            
        </table>
    </body>
</html>
