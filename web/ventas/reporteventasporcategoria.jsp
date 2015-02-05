<%-- 
    Document   : devoluciones
    Created on : 21-ene-2015, 12:11:27
    Author     : gerardo
--%>

<%@page import="java.util.List"%>
<%@page import="reportes.objetos.valor"%>
<%@page import="reportes.ventas.Ventas"%>
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
        <title>Ventas por categoria</title>
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
            Ventas dVentas = new Ventas();
            List<valor> categorias = dVentas.getCategorias();
            Usuarios dUsuarios = new Usuarios();
            ResultSet usuarios = dUsuarios.getVendedores();
            
            if(request.getParameter("id") != null)
            {
                idUsuario = Integer.parseInt(request.getParameter("id"));
                
            }
            
            if(idUsuario == 0)
            {
                
            }else
            {
                
            }
            String fechaInicial = "";
            String fechaFinal = "";
            
            if(request.getParameter("fechaInicial") != null)
            {
                if(request.getParameter("fechaFinal") != null)
                {
                    fechaInicial = request.getParameter("fechaInicial");
                    fechaFinal = request.getParameter("fechaFinal");
                    
                }
            }
            
            DecimalFormatSymbols simbolo=new DecimalFormatSymbols();
            simbolo.setDecimalSeparator('.');
            simbolo.setGroupingSeparator(',');
            DecimalFormat df = new DecimalFormat("###,###.##", simbolo);
        %>
    </head>
    <body style="font-family: Tahoma, Arial;">
        <h2>Reporte de ventas por categorias</h2>
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
                    <form action="devoluciones.jsp" method="GET">
                        
                        </form>
                </td>
                <td>
                    <form action="reporteventasporcategoria.jsp" method="POST">
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
        <table  border="1" cellspacing="0" cellpadding="2" bordercolor="000000" >
            <tr>
                <td style="font-size: 9px">
                    <b>Vendedor</b>
                </td>
                <%
                   for(valor categoria : categorias)
                   {
                %>
                <td style="font-size: 8px">
                    <b><%= categoria.getDescripcion() %></b>
                </td>
                <%
                   }
                %>
            </tr>
            <%
                while(usuarios.next())
                {
                    int idVendedor = usuarios.getInt("id");
            %>
            <tr>
                <td style="font-size: 9px">
                    <%= usuarios.getString("nombre") %>
                </td>
                <%
                   for(valor categoria : categorias)
                   {
                       int idCategoria = categoria.getId();
                %>
                <td style="font-size: 9px; text-align: center">
                    <% 
                       float total = dVentas.getVentaPorCategoriaPorVendedor(idCategoria, idVendedor, fechaInicial, fechaFinal);
                       String color = "black";
                       if(total > 0)
                       {
                           color = "blue";
                       }
                    %>
                    <div style="color: <%= color %>">$ <%= df.format(total) %></div>
                </td>
                <%
                   }
                %>
            </tr>
            <%
                }
            %>
            <tr>
                <td></td>
                <%
                   for(valor categoria : categorias)
                   {
                       int idCategoria = categoria.getId();
                %>
                <td style="font-size: 14px">
                    <% 
                       float total = dVentas.getTotalDeCategoria(idCategoria, fechaInicial, fechaFinal);
                       String color = "black";
                       if(total > 0)
                       {
                           color = "blue";
                       }
                    %>
                    <div style="color: <%= color %>">$ <%= df.format(total) %></div>
                </td>
                <%
                   }
                %>
            </tr>
        </table>
    </body>
</html>
