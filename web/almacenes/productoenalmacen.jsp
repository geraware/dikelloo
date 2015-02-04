<%-- 
    Document   : productoenalmacen
    Created on : 07-ene-2015, 16:20:15
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
        <title>Producto en Almacen</title>
        <%
            int idAlmacen = Integer.parseInt(request.getParameter("idAlmacen"));
            InventariosAlmacenes inventario = new InventariosAlmacenes();
            ResultSet productos = null;
            ResultSet almacenes = inventario.getAlmacenes();
            if(idAlmacen == 0)
            {
                productos = inventario.getInventarioAlmacenes();
            }else
            {
                productos = inventario.getInventarioAlmacen(idAlmacen);
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
        
        <h2>Reporte de inventario</h2>
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
        <form action="productoenalmacen.jsp" method="POST">
        <table border="1" cellspacing="0" cellpadding="2" bordercolor="000000">
            <tr>
                <td><b>Selecciona el Almacen</b></td>
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
                <td>
                    <input type="submit" value="Filtrar" />
                </td>
            </tr>
        </table>
        </form>            
        <hr/>
        <table style="font-size: 12px;">
            <tr>
                <td><b>Codigo</b></td>
                <td><b>Alterno</b></td>
                <td><b>Descripcion</b></td>
                <td><b>Precio</b></td>
                <td><b>utilidad</b></td>
                <td><b>IVA</b></td>
                <td><b>IEPS</b></td>
                <td><b>Almacen</b></td>
                <td><b>Cantidad</b></td>
                <td><b>Subtotal</b></td>
                <td><b>Subtotal Impuestos</b></td>
                <td><b>Utilidad</b></td>
            </tr>
            <%
                float total = 0;
                float totalImpuestos = 0;
                float totalUtilidad = 0;
                while(productos.next())
                {
                    total += productos.getFloat("subtotal");
                    totalImpuestos += (productos.getFloat("precioPublico") + (productos.getFloat("precioPublico") * ((productos.getFloat("iva") + productos.getFloat("ieps"))/100))) * productos.getFloat("cantidad");
                    totalUtilidad += productos.getFloat("subtotal") * (productos.getFloat("utilidad") / 100);
            %>
           <tr>
                <td style="text-align: center; font-size: 8px;"><%= productos.getString("codigo") %></td>
                <td style="text-align: center"><%= productos.getString("alterno") %></td>
                <td style="font-size: 8px;"><%= productos.getString("descripcion") %></td>
                <td style="text-align: center"><%= productos.getString("precioPublico") %></td>
                <td style="text-align: center"><%= df.format(productos.getFloat("utilidad")) %> %</td>
                <td style="text-align: center">$ <%= productos.getFloat("precioPublico") * (productos.getFloat("iva") / 100) %></td>
                <td style="text-align: center">$ <%= productos.getFloat("precioPublico") * (productos.getFloat("ieps") / 100) %></td>
                <td style="text-align: center"><%= productos.getString("almacen") %></td>
                <td style="text-align: center"><%= productos.getString("cantidad") %></td>
                <td style="text-align: right">$ <%= df.format(productos.getFloat("subtotal")) %></td>
                <td style="text-align: right">$ <%= df.format((productos.getFloat("precioPublico") + (productos.getFloat("precioPublico") * ((productos.getFloat("iva") + productos.getFloat("ieps"))/100))) * productos.getFloat("cantidad")) %></td>
                <td style="text-align: right">$ <%= df.format(productos.getFloat("subtotal") * (productos.getFloat("utilidad") / 100)) %></td>
                
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="9"><b>Gran total</b></td>
                <td style="text-align: right">  $ <%= df.format(total) %></td>
                <td style="text-align: right">  $ <%= df.format(totalImpuestos) %></td>
                <td style="text-align: right">  $ <%= df.format(totalUtilidad) %></td>
            </tr>
        </table>
    </body>
</html>
