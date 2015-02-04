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
        <script>
             $(function() {
                $( "#fechaInicial" ).datepicker();
                $( "#fechaFinal" ).datepicker();
             });
        </script>
        <%
            int idUsuario = 0;
            ResultSet devoluciones = null;
            DevolucionesRMI daoRMI = new DevolucionesRMI();
            Usuarios dUsuarios = new Usuarios();
            ResultSet usuarios = dUsuarios.getVendedores();
            
            if(request.getParameter("id") != null)
            {
                idUsuario = Integer.parseInt(request.getParameter("id"));
                
            }
            
            if(idUsuario == 0)
            {
                devoluciones = daoRMI.getDevoluciones();
            }else
            {
                devoluciones = daoRMI.getDevoluciones(idUsuario);
            }
            
            if(request.getParameter("fechaInicial") != null)
            {
                if(request.getParameter("fechaFinal") != null)
                {
                    String fechaInicial = request.getParameter("fechaInicial");
                    String fechaFinal = request.getParameter("fechaFinal");
                    devoluciones = daoRMI.getDevoluciones(fechaInicial, fechaFinal);
                }
            }
            
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
        <table style="width: 100%">
            <tr>
                <td>
                    <form action="devoluciones.jsp" method="POST">
                        <table border="1" cellspacing="0" cellpadding="2" bordercolor="000000" style="background-color: #c6dbdd">
                            <tr>
                                <td><b>Selecciona el Vendedor</b></td>
                                <td>
                                    <select name="id">
                                        <option value="0"></option>
                                        <%
                                            while(usuarios.next())
                                            {
                                        %>
                                        <option value="<%= usuarios.getInt("id") %>"><%= usuarios.getString("nombre") %></option>
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
                    <form action="devoluciones.jsp" method="POST">
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
                <td>
                    <b>Precio</b>
                </td>
                <td>
                    <b>Fecha</b>
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
                <td style="text-align: center">
                    $ <%= df.format(devoluciones.getFloat("precio")) %>
                </td>
                <td>
                    <%= devoluciones.getString("fecha") %>
                </td>
            </tr>
            <%
              }                             
            %>
        </table>
    </body>
</html>
