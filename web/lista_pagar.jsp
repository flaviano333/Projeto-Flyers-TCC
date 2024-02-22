<%-- 
    Document   : lista_compras_do_usuario
    Created on : 07/11/2023, 12:08:55
    Author     : Flávio
--%>
<%@page import="modelo.Pix"%>
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
        <title>Efetuar pagamento</title>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    </head>
    <body>
        <div align="center">            
        <table id="TabelasCompra">
            <tr>
                <td align="center"> 
                    <div align="left"><b>Aguardando validação do pagamento...</b></div>
                    <table width="100%">
                        
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
                            if ("A pagar".equals(c.getStatus())) {
                                 algumItemComStatusNocarrinho = true;
                                 total += c.getValorFinal();
                    %>
                    <tr><td align="left"><%= c.getFlyers().getNome() %></td><td align="right">Preço: R$<%= c.getValorFinal() %></td></tr>   <br>
                                                             
                    <%
                            }

                        }%>
                        <tr>
                            <td>
                                
                            </td>
                            <td align="right">
                                    <% if (!algumItemComStatusNocarrinho) {
                                            out.println("Sem itens no carrinho!!!");
                                        }else{  %><br><b style="font-size:30px">Valor total: R$<% out.println(total); %></b><br>                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <form  action="enviar_comprovante.do" method="post" enctype="multipart/form-data" >
                                <input type="hidden" value="<% out.println(total); %>" name="valortotal">
                                <input style="display: none" value="<%=usuarioId%>" name="usuarioId">
                                <input style="display: none" value="1" name="destinatarioIdPerfil">
                                Enviar comprovante:<br>
                                <input type="file" name="comprovante" ><input class="estilo-botao-azul" type="submit" value="enviar" >
                            </form>
                                
                            </td>
                            <td align="center" width="40%"style="background-color: white; border: 1px solid #b3b3b3; border-radius:35px; transition: background-color 0.3s; height:40px; " onmouseover="this.style.backgroundColor='#e6f2ff'" onmouseout="this.style.backgroundColor=' white'">
                                <a style="font-size:14px;text-decoration: none; display:block; color:blue;" target="_blank" href='https://link.mercadopago.com.br/learnedflyers'>Pague aqui</a>
                            </td>
                        </tr>                        
                        </table>
                    </td>
                                    
                                    
                            </tr>

            
            </table>
                
            
                      <% }
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
        </div>
    </body>
</html>
