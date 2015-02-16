<%-- 
    Document   : reporteventasporcedi
    Created on : 16-feb-2015, 10:47:44
    Author     : gerardo
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="reportes.ventas.Ventas"%>
<%@page import="reportes.almacenes.InventariosAlmacenes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de venta por CEDIS</title>
        <%
            int idCedi = 0;
            String fechaInicial = "";
            String fechaFinal = "";
            
            InventariosAlmacenes daoAlmacenes = new InventariosAlmacenes();
            Ventas daoVentas = new Ventas();
            
            if(request.getParameter("idCedi") != null)
            {
                idCedi = Integer.parseInt(request.getParameter("idCedi"));
                if(request.getParameter("fechaInicial") != null)
                {
                    if(request.getParameter("fechaFinal") != null)
                    {
                        fechaInicial = request.getParameter("fechaInicial");
                        fechaFinal = request.getParameter("fechaFinal");
                    }
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
        <h2>Reporte de ventas por CEDI</h2>
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
        <form action="reporteventasporcedi.jsp" method="POST">
        <table>
            <tr>
                <td>
                    <b>Seleccione el CEDI</b>
                </td>
            </tr>
            <tr>
                <td>
                    <select name="idCedi">
                        <%
                            ResultSet cedis = daoAlmacenes.getZonas();
                            while(cedis.next())
                            {
                        %>
                        <option value="<%= cedis.getInt("id") %>"><%= cedis.getString("nombre") %></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
        </table>
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
                    <br/><br/>
        <table>
            <tr>
                <td>
                    <b>CEDIS</b>
                </td>
                <td>
                    <b>Fecha</b>
                </td>
                <td>
                    <b>Total de Ventas</b>
                </td>
                <td>
                    <b>Total gastos</b>
                </td>
                <td>
                    <b>Venta real</b>
                </td>
            </tr>
            <%
                float totalNeto = 0f; 
                ResultSet registros = daoVentas.getVentasPorCediPorFecha(idCedi, fechaInicial, fechaFinal);
                 while(registros.next())
                 {
                     float venta = registros.getFloat("total");
                     float gasto = daoVentas.getGastosPorCediPorFecha(idCedi, registros.getString("fecha"), registros.getString("fecha"));
            %>
            <tr>
                <td>
                    <%= registros.getString("cedis") %> 
                </td>
                <td>
                    <%= registros.getString("fecha") %> 
                </td>
                <td style="text-align: center">
                    $ <%= df.format(venta) %> 
                </td>
                <td style="text-align: center">
                    $ <%= df.format(gasto) %>
                </td>
                <td>
                    $ <%= df.format(venta - gasto) %>
                </td>
            </tr>
            <%
                    totalNeto += venta - gasto;
                 }           
            %>
            <tr>
                <td>
                    
                </td>
                <td style="text-align: center">
                    
                </td>
                <td style="text-align: center">
                    
                </td>
                <td style="text-align: center">
                    
                </td>
                <td style="text-align: center; font-size: 18px">
                    $ <%= df.format(totalNeto) %>
                </td>
            </tr>
        </table>            
    </body>
</html>
