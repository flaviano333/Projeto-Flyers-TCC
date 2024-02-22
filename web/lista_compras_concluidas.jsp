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
                            if ("concluida".equals(c.getStatus())) {
                                 algumItemComStatusNocarrinho = true;    
                                 total += c.getValorFinal();
                    %>  
                                <tr>
                                    <td align="center" width="30%"> <%= c.getFlyers().getNome() %><br><img src="data:image/png;base64,<%= base64Image %>" />  </td>
                                    <td align="left">Data da compra: <%= c.getData() %>
                                        <br>Descrição: <%= c.getFlyers().getDescricao() %>
                                        <br> Preço: R$<%= c.getValorFinal() %>                                          
                                        <br>
                                        <br>
                                        <a class="estilo-botao-verde" href="download.do?img=<%= base64Image %>" download="<%= c.getFlyers().getNome() %>">Baixar Arquivo</a>
                                    </td>
                                   
                                </tr>
                    <%
                            }

                        }%>
                    <%
                        
                        
                        
%>                        
                        
                        
                        
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td align="right"><br><br>                                        
                                    </td>
                                </tr>                        
                        <tr>
                                <td align="center">
                                    <% if (!algumItemComStatusNocarrinho) {
                                            out.println("Sem compras finalizadas!!!");
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
