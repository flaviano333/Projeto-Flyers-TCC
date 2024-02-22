<%-- 
    Document   : meus_dados
    Created on : 26/10/2023, 10:23:58
    Author     : Flávio
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
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
                                       UsuarioDAO uDB = new UsuarioDAO();   
                                       uDB.conectar();
                                       Usuario u1 = uDB.Consultar(id);
                                       uDB.desconectar();
                                       if (u.getId()>0){
                                           %>                  
                </ul>
            </nav>
        </div>                
        <table id="FichaCadastro" width="360">                
            <tr><td>
                
                    <div align="center">
                    <h3>Alterando meus dados</h3>
                    
                    </div>
                    <div align="center">
                        
                    <form name="form_alterar_usuario" action="alterar_usuario.do" method="post">
                        <input type="hidden" name="id" value="<%=u.getId() %>">
                        <table>                            
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">Nome</td><td><input type="text" value="<%=u1.getNome() %>" name="nome" size="30" /> </td>
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">Login</td><td><input type="text" value="<%=u1.getLogin() %>" name="login" size="30" /> </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">Senha</td><td><input type="password" value="<%=u1.getSenha() %>" name="senha" size="30" /> </td>
                        </tr>                        
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">E-mail</td><td><input type="text" value="<%=u1.getEmail() %>" name="email" size="30" /> </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">Telefone</td><td><input type="text" value="<%=u1.getTelefone() %>" name="telefone" size="30" /> </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">CPF</td><td><input type="text" value="<%=u1.getCpf() %>" name="cpf" size="30" /> </td>
                        </tr>
                        <tr>
                            <td><input class="estilo-botao-azul" type="submit" value="Alterar" /> </td>
                        </tr>                        
                            
                                                
                                                <%
                                            }
                                            uDB.desconectar();
                                        } catch (Exception erro) {
                                            erro.printStackTrace();
                                        }
                            %>
                        </table>
                        </form>
                    </div>
 
                </td>
        </tr>
        </table>
               
        <script src='assets/js/script.js'></script>

                <%
                }catch(Exception e){
                    //out.print(e);
                    response.sendRedirect("meus_dados.jsp");
                }

                %>          
    </body>
</html>
