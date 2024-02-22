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
        <table id="TabelasFlyers">
            
             <%                                            
                    try {
                        CompraDAO compraDAO = new CompraDAO();
                        ArrayList<Compra> lista;
                        compraDAO.conectar();
                        lista = compraDAO.carregaPorUsuario(u.getId());
                        compraDAO.desconectar();
                        boolean algumItemComStatusNocarrinho = false;
                        double total = 0.0;
                        for (Compra c : lista) {
                            
                            byte[] imagemBytes = c.getFlyers().getImagem(); // Obtém os bytes da imagem
                            String base64Image = Base64.getEncoder().encodeToString(imagemBytes);
                            if ("nocarrinho".equals(c.getStatus())) {
                                 algumItemComStatusNocarrinho = true;    
                                 total += c.getValorFinal();
                    %>  
                    <tr>
                        <td>
                            <table id="TabelasTd">
                                <tr>
                                    <td align="center" width="30%"> <%= c.getFlyers().getNome() %><br><img src="data:image/png;base64,<%= base64Image %>" />  </td>
                                    <td align="left">Data da compra: <%= c.getData() %>
                                        <br>Descrição: <%= c.getFlyers().getDescricao() %>
                                        <br> Preço: R$<%= c.getValorFinal() %>                                          
                                        <form  action="cancelar_compra.do" method="post">
                                            <input style="display: none" value="<%=c.getIdCompra()%>" name="idCompra"> 
                                            <input class="estilo-botao-vermelho" type="submit" value="Remover flyer"/>
                                        </form>  
                                        <br>
                                        <form  action="mudar_status_pagar_compra.do" method="post">
                                            <input style="display: none" value="<%=c.getIdCompra()%>" name="idCompra"> 
                                            <input class="estilo-botao-verde"type="submit" value="Enviar para o caixa">
                                        </form>                                        
                                    </td>
                                   
                                </tr>                                
                            </table>
                        </td>
                    </tr>

                    <%
                            }

                        }%>
                    <%
                        
                        
                        
%>                        
                        
                        
                                               
                        <tr>
                                <td align="center">
                                    <% if (!algumItemComStatusNocarrinho) {
                                            out.println("Sem itens no carrinho!!!");
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
