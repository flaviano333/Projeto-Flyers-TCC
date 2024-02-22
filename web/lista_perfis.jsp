<%-- 
    Document   : listaflyers1
    Created on : 01/11/2023, 14:44:24
    Author     : Flávio
--%>

<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
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
                <td align="center"> <h3 style="position:absolute; transform: translateX(-50%);left:50%; top:23%;"> Lista de perfis </h3></td>
            </tr>             
             <%                                            
                            try {
                                PerfilDAO pDB1 = new PerfilDAO();
                                ArrayList<Perfil> lista;
                                pDB1.conectar();
                                lista = pDB1.listar();
                                pDB1.desconectar();
                                for(Perfil p:lista){
                                    %>
                                    <tr>
                                        <td>
                                            <table id="TabelasTd">
                                    <tr>
                                        <td align="center"><b>Id</b></td>
                                        <td align="center"><b>Perfil</b></td>
                                        <td align="center"><b>Vincular Menu</b></td>
                                        <td align="center"><b>Desvincular Menu</b></td>
                                    </tr>                                    
                                    <tr>

                                        <td align="center"><%=p.getIdPerfil() %></td>                                       
                                        <td align="center"><%=p.getPerfil() %></td>
                                        <td align="center">
                                            <form action="vincular_menu.do" method="post">
                                            <select name="vincularmenu">
                                                <%
                                                    ArrayList<Menu> listaMenuDesvinculado;
                                                    pDB1.conectar();
                                                    listaMenuDesvinculado = pDB1.menusDesvinculados(p.getIdPerfil());
                                                    pDB1.desconectar(); 
                                                    for(Menu m:listaMenuDesvinculado){                                                    
                                                %>
                                                <option value="<%=m.getIdMenu() %>"><%=m.getMenu() %></option>
                                            <%      } %>    
                                            </select>
                                            <input type="hidden" name="idPerfil" value="<%=p.getIdPerfil() %>" />
                                            <p><input type="submit"class="estilo-botao-verde" value="Vincular" /></p>
                                            </form>
                                        </td>
                                        <td align="center">                                            
                                            <form action="desvincular_menu.do" method="post">
                                            <select name="desvincularmenu">
                                                <%
                                                    ArrayList<Menu> listaMenuVinculado;
                                                    pDB1.conectar();
                                                    listaMenuVinculado = pDB1.menusVinculados(p.getIdPerfil());
                                                    pDB1.desconectar(); 
                                                    for(Menu m:listaMenuVinculado){                                                    
                                                %>
                                                <option value="<%=m.getIdMenu() %>"><%=m.getMenu() %></option>
                                            <%      } %>    
                                            </select>
                                            <input type="hidden" name="idPerfil" value="<%=p.getIdPerfil() %>" />
                                            <p><input class="estilo-botao-vermelho" type="submit" value="Desvincular" /></p>
                                            </form>                                            
                                        </td>
                                        <td align="center"><a class="estilo-botao-verde" href='alterar_perfil.jsp?id=<%=p.getIdPerfil() %>'>Alterar</a></td>
                                        <td align="center"><a class="estilo-botao-vermelho" href='excluir_perfil.do?id=<%=p.getIdPerfil() %>'>Excluir</a></td>
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
