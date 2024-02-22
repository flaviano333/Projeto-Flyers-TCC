<%-- 
    Document   : listaflyers1
    Created on : 01/11/2023, 14:44:24
    Author     : Flávio
--%>

<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
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
                <td align="center"> <h3 style="position:absolute; transform: translateX(-50%);left:50%; top:18%;"> Lista de usuários </h3></td>
            </tr>             
             <%                                            
                            try {
                                UsuarioDAO uDB1 = new UsuarioDAO();
                                ArrayList<Usuario> lista;
                                uDB1.conectar();
                                lista = uDB1.listar();
                                uDB1.desconectar();
                                for(Usuario u1:lista){
                                    %>
                                    <tr>
                                        <td>
                                            <table id="TabelasTd">
                                        
                                        
                                    
                                    <tr>
                                        <td align="center"><b>Id</b></td>
                                        <td align="center"><b>Nome</b></td>
                                        <td align="center"><b>login</b></td>
                                        <td align="center"><b>Telefone</b></td>
                                        <td align="center"><b>e-mail</b></td>
                                        <td align="center"><b>Ativar / Desativar</b></td>
                                        <td align="center"><b>Alterar Perfil</b></td>
                                    </tr>                                    
                                    <tr>

                                        <td align="center"><%=u1.getId() %></td>                                       
                                        <td align="center"><%=u1.getNome() %></td>
                                        <td align="center"><%=u1.getLogin() %></td>
                                        <td align="center"><%=u1.getTelefone() %></td>
                                        <td align="center"><%=u1.getEmail() %></td>
                                        <td align="center">
                                            <form action="alterar_status_usuario.do" method="post">
                                            <select name="status">
                                                <% if(u1.isStatus() == true){ %>
                                                <option value="true">Ativado</option>
                                                <% }else{ %>
                                                    <option value="false">Desativado</option>
                                                <% } %>
                                                <% if(u1.isStatus() == true){ %>
                                                <option value="false">Desativado</option>
                                                <% }else{ %>
                                                    <option value="true">Ativado</option>
                                                <% } %>
                                            </select>
                                            <input type="hidden" name="idUsuario" value="<%=u1.getId() %>" />
                                            <p><input type="submit" class="estilo-botao-verde" value="Mudar status" /></p>
                                            </form>
                                        </td>
                                        <td align="center">                                            
                                            <form action="alterar_perfil_usuario.do" method="post">
                                            <select name="idPerfil">
                                                <%
                                                    ArrayList<Perfil> listaPerfis;
                                                    PerfilDAO pDB1 = new PerfilDAO();
                                                    pDB1.conectar();
                                                    listaPerfis = pDB1.listar();
                                                    pDB1.desconectar(); 
                                                    for(Perfil p:listaPerfis){                                                    
                                                %>
                                                <option value="<%=p.getIdPerfil() %>"><%=p.getPerfil() %></option>
                                            <%      } %>    
                                            </select>
                                                <input type="hidden" name="idUsuario" value="<%=u1.getId() %>" />
                                            <p><input type="submit" class="estilo-botao-azul" value="Alterar perfil" /></p>
                                            </form>                                            
                                        </td>
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
