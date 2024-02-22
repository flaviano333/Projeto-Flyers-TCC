<%-- 
    Document   : listaflyers1
    Created on : 01/11/2023, 14:44:24
    Author     : Flávio
--%>

<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
<%@page import="java.util.Base64"%>
<%@page import="modelo.Flyers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.FlyersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ListaMenus</title>
    </head>
    <body>
        <div align="center">            
        <table id="TabelasFlyers">
            <tr>
                <td align="center"> <h3 style="position:absolute; transform: translateX(-50%);left:50%; top:23%;"> Lista de menus </h3></td>
            </tr>             
             <%                                            
                            try {
                                MenuDAO mDB1 = new MenuDAO();
                                ArrayList<Menu> lista;
                                mDB1.conectar();
                                lista = mDB1.listar();
                                mDB1.desconectar();
                                for(Menu m:lista){
                                    %>
                                    <tr>
                                        <td>
                                            <table id="TabelasTd">
                                                <tr>
                                                    <td align="center"><b>Id</b></td>
                                                    <td align="center"><b>Menu</b></td>
                                                    <td align="center"><b>Link</b></td>
                                                </tr>                                    
                                                <tr>

                                                    <td align="center"><%=m.getIdMenu() %></td>                                       
                                                    <td align="center"><%=m.getMenu() %></td>
                                                    <td align="center"><%=m.getLink() %></td>
                                                    <td align="center"><a class="estilo-botao-verde" href='alterar_menu.jsp?id=<%=m.getIdMenu() %>'>Alterar</a></td>
                                                    <td align="center"><a class="estilo-botao-vermelho" href='excluir_menu.do?id=<%=m.getIdMenu() %>'>Excluir</a></td>
                                                </tr>    
                                                <tr>
                                                    <td align="center"></td>
                                                </tr>                                                
                                            </table>
                                        </td>
                                    </tr>
                                     

                                    <%
                                }
                                
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                %>
            
            </table>
            </div>
                <br>
    </body>
</html>
