<%-- 
    Document   : index
    Created on : 22/10/2023, 14:23:34
    Author     : Flávio
--%>

<%@page import="java.util.Base64"%>
<%@page import="modelo.Flyers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.FlyersDAO"%>
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
        
        <div class="banner">
            <table width="100%">
                <tr>
                    <td>
                        <img width="50px" src="assets/imagens/menu.png" alt="Clique para abrir ou fechar o menu" id="btnMenu2">
                    </td>                    
                    <td>
                        <a href="index.jsp"><img width="300px" src="assets/imagens/logo.png" id="btnLogo" alt="learned"></a>
                    </td>
                    <td >
                        <img width="0px" src="assets/imagens/user.png" alt="Clique para abrir ou fechar o menu" id="btnMenu">
                        <a href="carrinho.jsp"><img width="50px" src="assets/imagens/carrinho.png" alt="Clique para ver o carrinho" id="btnCarrinho"></a>
                    </td>
                     <%
                        Usuario u = new Usuario();
                    try{
                        u = (Usuario) session.getAttribute("usuario");  
                        int idPerfil = u.getPerfil().getIdPerfil();
                            if(idPerfil != 1){ %>
                    <td>
                        <a href="conversa_cliente.jsp"><img width="46px" src="assets/imagens/chat.png" alt="Clique para ver o chat" id="btnChat"></a>
                    </td>                   
                </tr>
                    <% }else{ %>
                        <td>
                            <a href="conversa_adm.jsp"><img width="46px" src="assets/imagens/chat.png" alt="Clique para ver o chat" id="btnChat"></a>
                        </td>                              
                     <%   }%>                    
                </tr>
               
            </table>
        </div>
        <div id="menu2" class="menu2 effect2">
            <nav >
                <div style="text-align: left;">
                    <img src="imagens/excluir.png" alt="Clique para fechar o menu" id="btnClose2">
                    <button id="btnClose2">X</button>
                    
                </div>
                <ul>
                    <li><br><br><br></li>
                    <li><%



                        out.print("<a id='linha2'>Seja bem-vindo <b>" + u.getNome() + "</b>!" + "<p>&nbsp;</p></a>");
                        int usuarioId = u.getId();
                        session.setAttribute("usuarioId", usuarioId);
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
        <div class="login-form" id="formulario-container">
            <label><%@ include file="login.jsp" %></label>
        </div>           
        <div id="menu" class="menu effect">
            <nav >
                <div style="text-align: left;">
                    <img src="imagens/excluir.png" alt="Clique para fechar o menu" id="btnClose">
                    <button id="btnClose">X</button>
                </div>                
            </nav>
        </div> 
                        <br>
                        <br>
                        <br>
                        <br>
            <div align="center">             
            <table id="TabelaBodyPrincipal">
               <tr>
                    <td align="center">
                        <h2>
                            Efetuar pagamento
                        </h2>
                    </td>
                </tr>                
                <tr>
                    <td align="center">
                        <table>
                            <tr>
                                <td style="background-color: white; border: 1px solid #b3b3b3; border-radius:35px; transition: background-color 0.3s; height:40px; " onmouseover="this.style.backgroundColor='#e6f2ff'" onmouseout="this.style.backgroundColor=' white'">
                                     <a style="font-size:14px;text-decoration: none; color:blue;" href="carrinho.jsp"> &NonBreakingSpace;&NonBreakingSpace;Meu carrinho &NonBreakingSpace;&NonBreakingSpace;</a>  
                                 </td>                                
                                 <td style="background-color: white; border: 1px solid #b3b3b3; border-radius:35px; transition: background-color 0.3s; height:40px; " onmouseover="this.style.backgroundColor='#e6f2ff'" onmouseout="this.style.backgroundColor=' white'">
                                     <a style="font-size:14px;text-decoration: none; color:blue;" href="carrinho_a_pagar.jsp"> &NonBreakingSpace;&NonBreakingSpace;Compras aguardando validação &NonBreakingSpace;&NonBreakingSpace;</a>  
                                 </td> 
                                 <td style="background-color: white; border: 1px solid #b3b3b3; border-radius:35px; transition: background-color 0.3s; height:40px; " onmouseover="this.style.backgroundColor='#e6f2ff'" onmouseout="this.style.backgroundColor=' white'">
                                     <a style="font-size:14px;text-decoration: none; color:blue;" href="compras_concluidas.jsp"> &NonBreakingSpace;&NonBreakingSpace;Compras concluidas &NonBreakingSpace;&NonBreakingSpace;</a>  
                                 </td>                                  
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>
                        <%@ include file="lista_pagar.jsp" %>
                        <br>
                        <br> 
                    
                    </td>
                </tr>

            </table>  
            </div>
            
                        <br>
                        <br>            

        <script src='assets/js/script.js'></script> 
                <%
                }catch(Exception e){
                    //out.print(e);
                    response.sendRedirect("index.jsp");
                }

                %>          
    </body>
</html>
