<%-- 
    Document   : index
    Created on : 12-ene-2015, 10:37:52
    Author     : gerardo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Reportes Dikelloo</title>
            
            <script src="js/jquery-1.10.2.js"></script>
            <script src="js/jquery-ui.js"></script>
            <link rel="stylesheet" href="css/jquery-ui.css">
            <script src="js/utilerias.js"></script>
            <script>
                 $(function() {
                    
                 });
            </script>
        
    </head>
    <body style="font-family: Tahoma, Arial">
        <h2>Sistema de reportes DIKELLOO</h2>
        <hr/>
        <table style="width: 100%">
            <tr>
                <td style="width: 95%; padding: 10px">
                    <div style="padding: 10px;width: 95%; border-radius: 10px; background-color: #eccbb7">
                        <h3>Reportes de Almacenes</h3>
                        <table>
                            <tr>
                                <td>
                                    <a href="almacenes/productoenalmacen.jsp?idAlmacen=0">Inventario total</a>
                                </td>
                                <td>
                                    <a href="almacenes/movimientosalmacen.jsp">Movimientos</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 95%; padding: 10px">
                    <div style="padding: 10px;width: 95%; border-radius: 10px; background-color: #a4b1d5">
                        <h3>Reportes de Compras</h3>
                        <table>
                            <tr>
                                <td>
                                    <a href="compras/reportecompras.jsp?idProveedor=0">Compras realizadas</a>
                                </td>
                                <td>
                                    <a href="compras/reportecomprasdetallado.jsp?idProveedor=0">Compras detalladas</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 95%; padding: 10px">
                    <div style="padding: 10px;width: 95%; border-radius: 10px; background-color: #b3bbd1">
                        <h3>Reportes de Ventas</h3>
                        <table>
                            <tr>
                                <td>
                                    <a href="ventas/reporteventas.jsp">Ventas realizadas</a>
                                </td>
                                <td>
                                    <a href="ventas/reporteventasconsaldo.jsp">Ventas con saldo</a>
                                </td>
                                <td>
                                    <a href="ventas/reporteventasporcategoria.jsp">Ventas por categoria</a>
                                </td>
                                <td>
                                    <a href="ventas/reporteventasporcedi.jsp">Ventas por CEDI</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 95%; padding: 10px">
                    <div style="padding: 10px;width: 95%; border-radius: 10px; background-color: #c4b1da">
                        <h3>Reportes de devoluciones RMI</h3>
                        <table>
                            <tr>
                                <td>
                                    <a href="rmis/inventariormi.jsp">Inventario</a>
                                </td>
                                <td>
                                    <a href="rmis/devoluciones.jsp">Devoluciones</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 95%; padding: 10px">
                    <div style="padding: 10px;width: 95%; border-radius: 10px; background-color: #d5e3be">
                        <h3>Reportes para Proveedores</h3>
                        <table>
                            <tr>
                                <td>
                                    <a href="proveedor/listarutas.jsp">CEDIS y Rutas</a>
                                </td>
                                <td>
                                    <a href="proveedor/inventario.jsp">Inventario</a>
                                </td>
                                <td>
                                    <a href="proveedor/listaventas.jsp">Ventas por Ruta</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>
