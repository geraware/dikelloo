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
                comprasRealizadas = compras.getComprasDetalladas();
            }else
            {
                comprasRealizadas = compras.getComprasDetalladas(idProveedor);
            }
            
            if(request.getParameter("fechaInicial") != null)
            {
                if(request.getParameter("fechaFinal") != null)
                {
                    String fechaInicial = request.getParameter("fechaInicial");
                    String fechaFinal = request.getParameter("fechaFinal");
                    comprasRealizadas = compras.getComprasDetalladas(fechaInicial, fechaFinal);
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
                    <form action="reportecomprasdetallado.jsp" method="POST">
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
                    <form action="reportecomprasdetallado.jsp" method="POST">
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
        <table style="font-size: 10px" border="1" cellspacing="0" cellpadding="2" bordercolor="000000">
            <tr>
                <td><b>Fecha</b></td>
                <td><b>Factura</b></td>
                <td><b>Codigo</b></td>
                <td><b>Alterno</b></td>
                <td><b>Descripcion</b></td>
                <td><b>Utilidad</b></td>
                <td><b>Cantidad</b></td>
                <td><b>Precio</b></td>
                <td><b>Subtotal</b></td>
                <td><b>IVA</b></td>
                <td><b>IEPS</b></td>
                <td><b>Subtotal Impuesto</b></td>
                <td><b>Precio con utilidad por pieza</b></td>
                <td><b>Subtotal con utilidad sin impuestos</b></td>
                <td><b>Utilidad obtenida</b></td>
                <td><b>Proveedor</b></td>
                <td><b>RFC</b></td>
                <td><b>Almacen</b></td>
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
                <td style="text-align: left"><%= comprasRealizadas.getString("codigo") %></td>
                <td style="text-align: left"><%= comprasRealizadas.getString("alterno") %></td>
                <td style="text-align: left"><%= comprasRealizadas.getString("descripcion") %></td>
                <td style="text-align: center"><%= df.format(comprasRealizadas.getFloat("utilidad")) %> %</td>
                <td style="text-align: center"><%= df.format(comprasRealizadas.getFloat("cantidad")) %></td>
                <td style="text-align: center">$ <%= df.format(comprasRealizadas.getFloat("precio")) %></td>
                <td style="text-align: center">$ <%= df.format(comprasRealizadas.getFloat("subtotal")) %></td>
                <td style="text-align: center">$ <%= df.format(comprasRealizadas.getFloat("iva")) %></td>
                <td style="text-align: center">$ <%= df.format(comprasRealizadas.getFloat("ieps")) %></td>
                <td style="text-align: center">$ <%= df.format(comprasRealizadas.getFloat("totalImpuesto")) %></td>
                <td style="text-align: center">$ <%= df.format(comprasRealizadas.getFloat("precio") * (1 + (comprasRealizadas.getFloat("utilidad") / 100))) %> </td>
                <td style="text-align: center">$ <%= df.format(comprasRealizadas.getFloat("cantidad") * (comprasRealizadas.getFloat("precio") * (1 + (comprasRealizadas.getFloat("utilidad") / 100)))) %> </td>
                <td style="text-align: center">$ <%= df.format((comprasRealizadas.getFloat("cantidad") * (comprasRealizadas.getFloat("precio") * (1 + (comprasRealizadas.getFloat("utilidad") / 100)))) - comprasRealizadas.getFloat("subtotal")) %> </td>
                <td style="text-align: left"><%= comprasRealizadas.getString("nombre") %></td>
                <td style="text-align: left"><%= comprasRealizadas.getString("rfc") %></td>
                <td style="text-align: left"><%= comprasRealizadas.getString("almacen") %></td>
            </tr>
            <%
                }
            %>
            
        </table>
    </body>
</html>
