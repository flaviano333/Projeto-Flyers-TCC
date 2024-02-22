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
        <title>ListaFlyers1</title>
    </head>
    <body>
        <div align="center">            
        <table id="TabelasFlyers">
            <tr>
   
                    <td align="center">
                        <table style="position:absolute; transform: translateX(-50%);left:50%;  ">
                            <tr>
                                <td style="background-color: white; border: 1px solid #b3b3b3; border-radius:35px; transition: background-color 0.3s; height:40px; " onmouseover="this.style.backgroundColor='#e6f2ff'" onmouseout="this.style.backgroundColor=' white'">
                                    <a style="font-size:14px;text-decoration: none; color:blue;" href="paginaPrincipal.jsp"> &NonBreakingSpace;&NonBreakingSpace;Flyers não editáveis &NonBreakingSpace;&NonBreakingSpace;</a>  
                                </td>   
                                <td style="background-color: white; border: 1px solid #b3b3b3; border-radius:35px; transition: background-color 0.3s; height:40px; " onmouseover="this.style.backgroundColor='#e6f2ff'" onmouseout="this.style.backgroundColor=' white'">
                                    <a style="font-size:14px;text-decoration: none; color:blue;" href="paginaflyers_editaveis.jsp"> &NonBreakingSpace;&NonBreakingSpace;Flyers editáveis(psd) &NonBreakingSpace;&NonBreakingSpace;</a>  
                                </td>  
                                <td style="background-color: white; border: 1px solid #b3b3b3; border-radius:35px; transition: background-color 0.3s; height:40px; " onmouseover="this.style.backgroundColor='#e6f2ff'" onmouseout="this.style.backgroundColor=' white'">
                                    <a style="font-size:14px;text-decoration: none; color:blue;" href="paginaPacoteflyers_naoeditaveis.jsp"> &NonBreakingSpace;&NonBreakingSpace;Pacotes com 13 Flyers não editáveis &NonBreakingSpace;&NonBreakingSpace;</a>  
                                </td>                                
                                <td style="background-color: white; border: 1px solid #b3b3b3; border-radius:35px; transition: background-color 0.3s; height:40px; " onmouseover="this.style.backgroundColor='#e6f2ff'" onmouseout="this.style.backgroundColor=' white'">
                                    <a style="font-size:14px;text-decoration: none; color:blue;" href="paginaPacoteflyers_editaveis.jsp"> &NonBreakingSpace;&NonBreakingSpace;Pacotes com 13 Flyers editáveis(psd) &NonBreakingSpace;&NonBreakingSpace;</a>  
                                </td>                                   
                            </tr>
                        </table>
                        <br>
                        <br>
                        <br>
                    </td>
                   
            <tr>
                <td align="center"> <h3 style="position:absolute; transform: translateX(-50%);left:50%; top:34%;"> Flyers não editáveis </h3></td>
                
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
                                        if("Flyer pronto nao editavel".equals(f.getTipo())){
                                        byte[] imagemBytes = f.getImagem(); // Obtém os bytes da imagem
                                        String base64Image = Base64.getEncoder().encodeToString(imagemBytes);                                    
                                    %>
                                    <tr>
                                        <td>
                                            <table id="TabelasTd">
                                                <tr>
                                                    <td align="center"><%=f.getNome() %></td>
                                                    <td align="center">Descrição</td>
                                                    <td align="center">Preço</td>
                                                </tr>                                    
                                                <tr>
                                                    <td align="center" width="55%"><img src="data:image/png;base64,<%= base64Image %>" /></td>
                                                    <td align="left"><%=f.getDescricao() %></td>
                                                    <td align="center">R$<%=f.getPreco() %> 
                                                    <br>   
                                                    <form  action="adicionar_carrinho.do" method="post">
                                                        <input style="display: none" value="<%=f.getPreco()%>" name="valor">
                                                        <input style="display: none" value="<%=u.getId()%>" name="usuarioId"> 
                                                        <input style="display: none" value="<%=f.getIdFlyers()%>" name="idFlyers">
                                                        <input style="display: none" value="nocarrinho" name="status"> 
                                                        <input class="estilo-botao-verde" type="submit" value="Comprar"/>
                                                    </form>     
                                                </td>                                        
                                                </tr>
                                                <tr>
                                                    <td align="center"><br><br></td>
                                                </tr>                                                 
                                            </table>
                                        </td>
                                    </tr>
                                    
                                   
                                    <%
                                        }
                                }
                                
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                %>
            
            </table>
            </div>
    </body>
</html>
