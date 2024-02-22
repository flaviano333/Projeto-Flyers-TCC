<%-- 
    Document   : lista_compras_do_usuario
    Created on : 07/11/2023, 12:08:55
    Author     : Flávio
--%>
<%@page import="java.util.Base64"%>
<%@page import="modelo.Flyers"%>
<%@page import="modelo.FlyersDAO"%>
<%@page import="modelo.Compra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.CompraDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minhas compras</title>
    </head>
    <body>
        <div align="center">            
        <table >
            <tr>
                <td align="center">
             <%                                            
                    try {
                        CompraDAO compraDAO = new CompraDAO();
                        ArrayList<Compra> lista;
                        compraDAO.conectar();
                        lista = compraDAO.listar();
                        compraDAO.desconectar();
                        boolean algumItemComStatusNocarrinho = false;
                        double total = 0.0;
                        for (Compra c : lista) {
                            int idUsuario = c.getUsuario().getId();
                            String nomeUsuario = c.getUsuario().getNome();
                            byte[] imagemBytes = c.getFlyers().getImagem(); // Obtém os bytes da imagem
                            String base64Image = Base64.getEncoder().encodeToString(imagemBytes);
                            if ("A pagar".equals(c.getStatus())) {
                                 algumItemComStatusNocarrinho = true;    
                                 total += c.getValorFinal();
                    %>          
                    <table id="TabelasTd">
                                <tr>
                                    <td align="center" width="15%" > <b><%= c.getFlyers().getNome() %></b><br><img src="data:image/png;base64,<%= base64Image %>" />  </td>
                                    <td align="left"><b>Data da compra:</b> <%= c.getData() %>
                                        <br><b>Dados do comprador: </b>
                                        <br>&NonBreakingSpace;&NonBreakingSpace;&rarrhk;<b>Id: </b><%= idUsuario %>
                                        <br>&NonBreakingSpace;&NonBreakingSpace;&rarrhk;<b>Nome:</b> <%= nomeUsuario %>
                                        <br>
                                        <br><a class="estilo-botao-verde"href="conversa_adm_1.jsp?idDestinatario=<%= idUsuario %>">Verificar comprovante</a>
                                       
                                        <br>
                                        <br><a class="estilo-botao-vermelho" href="cancelar_compra.do?idCompra=<%= c.getIdCompra() %>">Cancelar compra</a>
                                        <br>
                                        <br>
                                        <form action="liberar_compra.do" method="post">
                                            <input type="hidden" value="<%=c.getIdCompra() %>" name="idCompra">
                                            <input class="estilo-botao-azul" type="submit" value="aprovar compra">
                                        </form>
                                         
                                        <br>
                                        
                                        <br><b>Descrição:</b> <%= c.getFlyers().getDescricao() %>
                                        <br> <b>Preço:</b> R$<%= c.getValorFinal() %>                                          
                                        <br> 
                                    </td>
                                   
                                </tr>
                                    <%
                                            }

                                        }%>
                                    <%



                %>
                    </table>  
                </td>
            </tr>
                   
                        
                        
                        
                                <tr>
                                    <td align="center">
                                        
                                        <br><br>                                        
                                    </td>
                                </tr>                        
                        <tr>
                                <td align="center">
                                    <% if (!algumItemComStatusNocarrinho) {
                                            out.println("Sem vendas finalizadas!!!");
                                        }  %>
                                </td>
                            </tr>
                      <%
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            
            </table>
            </div>
    </body>
</html>
