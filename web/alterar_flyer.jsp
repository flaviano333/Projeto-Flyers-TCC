<%-- 
    Document   : meus_dados
    Created on : 26/10/2023, 10:23:58
    Author     : Flávio
--%>

<%@page import="modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.FlyersDAO"%>
<%@page import="modelo.Flyers"%>
<%@page import="modelo.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Learned</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="apple-touch-icon" sizes="180x180" href="assets/imagens/icone/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="assets/imagens/icone/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="assets/imagens/icone/favicon-16x16.png">
        <link rel="manifest" href="/site.webmanifest">
        <link rel ="stylesheet" href="assets/css/style.css">
        <link rel="preload" href="assets/css/style.css" as="style">
        <link rel="preload" href="assets/js/script.js" as="script">
     
    </head>
    <body>
            <%

        Usuario u = new Usuario();
        try{
            u = (Usuario) session.getAttribute("usuario");
            
            int usuarioId = u.getId();
            session.setAttribute("usuarioId", usuarioId); 
            int idPerfil = u.getPerfil().getIdPerfil();
%>        
        <div class="banner">
            <table width="100%">
                <tr>
                    <td>
                        <img width="50px" src="assets/imagens/menu.png" alt="Clique para abrir ou fechar o menu" id="btnMenu2">
                    </td>                    
                    <td>
                        <a href="paginaPrincipal.jsp"><img width="300px" src="assets/imagens/logo.png" id="btnLogo" alt="learned"></a>
                    </td>
                    <td >
                        <img width="0px" src="assets/imagens/user.png" alt="Clique para abrir ou fechar o menu" id="btnMenu">
                        <a href="carrinho.jsp"><img width="50px" src="assets/imagens/carrinho.png" alt="Clique para ver o carrinho" id="btnCarrinho"></a>
                    </td>
                     <%   if(idPerfil != 1){ %>
                    <td>
                        <a href="conversa_cliente.jsp"><img width="46px" src="assets/imagens/chat.png" alt="Clique para ver o chat" id="btnChat"></a>
                    </td>                   
                </tr>
                    <% }else{ %>
                        <td>
                            <a href="conversa_adm.jsp"><img width="46px" src="assets/imagens/chat.png" alt="Clique para ver o chat" id="btnChat"></a>
                        </td>                              
                     <%   }%>
               
            </table>
        </div>
        <div id="menu2" class="menu2 effect2">
            <nav >
                <div style="text-align: left;">
                    <img src="imagens/excluir.png" alt="Clique para fechar o menu" id="btnClose2">
                    <button id="btnClose2">X</button>
                    
                </div>
                <ul>
                    <li><br><br><br> <% out.print("<a id='linha2'>Seja bem-vindo <b>" + u.getNome() + "</b>!" + "<p>&nbsp;</p></a>");%></li>
                    
                    <li><%

                        if (u == null){
                            response.sendRedirect("index.jsp");
                        }
                        %></li>                     
                    <li><a id="linha" href="paginaPrincipal.jsp">Página principal</a></li>                  
                    <li><a id="linha" href="meus_dados.jsp">Meus Menus</a></li>  
                    <li><a id="linha" href="sair.jsp">Sair</a></li>  
                </ul>
            </nav>
        </div>        
 
                               <% 
                        int id = Integer.parseInt(request.getParameter("id"));
                        try {
                                       FlyersDAO uDB = new FlyersDAO();   
                                       uDB.conectar();
                                       Flyers f = uDB.obterFlyerPorId(id);
                                       uDB.desconectar();
                                       if (f.getIdFlyers()>0){
                                           %>                               
        <table id="FichaCadastro" width="360">                
            <tr><td>
                
                    <div align="center">
                    <h3>Alterando flyer</h3>
                    
                    </div>
                    <div align="center">
                        
                    <form name="form_flyer" action="alterar_flyer.do" method="post" enctype="multipart/form-data" onsubmit="return validaFormCadastroF();">
                        <input type="hidden" name="idFlyers" value="<%=f.getIdFlyers() %>">
                        <input type="hidden" name="valorantigo" value="<%=f.getPreco() %>">
                        <table>                            
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">Nome</td><td><input type="text" value="<%=f.getNome() %>"  name="nome" size="41" /> </td>                     
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">Descrição</td><td align="center"><textarea  input type="text" name="descricao" rows="4" cols="43" style="resize: none; border-radius:6px;" /><%=f.getDescricao() %></textarea> </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">Preço</td><td><input value="<%=f.getPreco() %>" type="number" step="0.01" id="preco" name="preco" size="41" /> </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#7FFFD4"> Tipo </td> 
                            <td align="left"><select width="100%" name="tipo">
                                <option value="Pacote personalizado editavel">Pacote personalizado editavel</option>
                                <option value="Pacote pronto editavel">Pacote pronto editavel</option>
                                <option value="Pacote pronto nao editavel">Pacote pronto nao editavel</option>
                                <option value="Flyer pronto editavel">Flyer pronto editavel</option>
                                <option value="Flyer pronto nao editavel">Flyer pronto nao editavel</option>
                                <option value="Flyer personalizado editavel">Flyer personalizado</option>
                                <option value="Flyer personalizado nao editavel">Flyer personalizado nao editavel</option>
                                <option value="Pronto">Pronto</option>
                                </select>
                            </td>
                        </tr>                          
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">Imagem</td><td><input type="file" id="imagem" name="imagem" accept="image/*">  </td>
                        </tr> 
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">Arquivo</td><td><input type="file" id="arquivo" name="arquivo">  </td>
                        </tr>                          
                        <tr>
                            <td><input type="submit" value="Alterar" /> </td>
                        </tr>                        
 
                        </table>
                        </form>
                    </div>
                                                <%
                                            }
                                            uDB.desconectar();
                                        } catch (Exception erro) {
                                            erro.printStackTrace();
                                        }
                            %> 
                </td>
        </tr>
        </table>
               
        <script src='assets/js/script.js'></script>
                 <%
                }catch(Exception e){
                    //out.print(e);
                    response.sendRedirect("paginaPrincipal.jsp");
                }

                %>        
    </body>
</html>
