<%-- 
    Document   : listaflyers1
    Created on : 01/11/2023, 14:44:24
    Author     : Flávio
--%>

<%@page import="java.util.Base64"%>
<%@page import="modelo.Flyers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.FlyersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ListaFlyers1G</title>
    </head>
    <body>
        <div align="center">            
        <table id="TabelasFlyers">
            <tr>
                <td align="center"> <h3 style="position:absolute; transform: translateX(-50%);left:50%; top: 23%;"> Lista de flyers </h3></td>
            </tr>             
             <%                                            
                            try {
                                FlyersDAO uDB = new FlyersDAO();
                                ArrayList<Flyers> lista;
                                uDB.conectar();
                                lista = uDB.listar();
                                uDB.desconectar();
                                for(Flyers f:lista){
                                    %>
                                    <% 
                                        byte[] imagemBytes = f.getImagem(); // Obtém os bytes da imagem
                                        String base64Image = Base64.getEncoder().encodeToString(imagemBytes);                                    
                                    %> 
                                    <tr><td>
                                            <table id="TabelasTd">
                                    <tr>
                                        <td align="center"><b>Flyer</b></td>
                                        <td align="center"><b>Nome</b></td>
                                        <td align="center"><b>Descrição</b></td>
                                        <td align="center"><b>Preço</b></td>
                                    </tr>                                    
                                    <tr>
                                        <td align="center"><img width="50%" src="data:image/png;base64,<%= base64Image %>" /></td>
                                        <td align="center"><%=f.getNome() %></td>                                       
                                        <td align="left" style="max-width: 200px; word-wrap: break-word; white-space: normal;"><%=f.getDescricao() %></td>
                                        <td align="center">R$<%=f.getPreco() %></td>
                                        <td align="center"><a class="estilo-botao-verde" href='alterar_flyer.jsp?id=<%=f.getIdFlyers() %>'>Alterar</a></td>
                                        <td align="center"><a class="estilo-botao-vermelho" href='excluir_flyer.do?id=<%=f.getIdFlyers() %>'>Excluir</a></td>
                                    </tr>    
                                    <tr>
                                        <td align="center"></td>
                                    </tr>                                                 
                                            </table>
                                        </td></tr>
                                    

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
