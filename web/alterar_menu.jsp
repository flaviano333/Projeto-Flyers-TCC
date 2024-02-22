<%-- 
    Document   : meus_dados
    Created on : 26/10/2023, 10:23:58
    Author     : Flávio
--%>

<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
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
                                       MenuDAO mDB = new MenuDAO();   
                                       mDB.conectar();
                                       Menu m = mDB.ConsultarId(id);
                                       mDB.desconectar();
                                       if (m.getIdMenu()>0){
                                           %>                               
        <table id="FichaCadastro" width="360">                
            <tr><td>
                
                    <div align="center">
                    <h3>Alterando flyer</h3>
                    
                    </div>
                    <div align="center">
                        
                    <form name="form_menu" action="alterar_menu.do" method="post">
                        <input type="hidden" name="id" value="<%=m.getIdMenu() %>">
                        <input type="hidden" name="nome" value="<%=m.getMenu() %>">
                        <table>                            
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">Nome do menu</td><td><%=m.getMenu() %></td>                     
                        <tr>
                            <td align="center" bgcolor="#7FFFD4">Link</td><td><input value="<%=m.getLink() %>" name="link" size="41" /> </td>
                        </tr>                          
                        <tr>
                            <td><input type="submit" value="Alterar" /> </td>
                        </tr>                        
 
                        </table>
                        </form>
                    </div>
                                                <%
                                            }
                                            mDB.desconectar();
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
                    response.sendRedirect("gerenciar_menu.jsp");
                }

                %>        
    </body>
</html>
