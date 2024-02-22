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
                    </td>
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
                    <li id="mostrar-formulario"><a id="linha" href="#">Fazer Login</a>
                    </li>  
                    <li><a id="linha" href="form_cadastro.jsp">Registre-se</a></li>                    
                    <li><a id="linha" href="index.jsp">Página principal</a></li>                    

                    
                </ul>
            </nav>
        </div>
        <div class="login-form" id="formulario-container">
            <label><%@ include file="login.jsp" %></label>
            <% Usuario u = new Usuario();%>
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
                    <td>
                        <br>
                        <div align="center">
                            <table id="TabelaMensagemPrincipal">
                                <tr>
                                    <td align="center">
                                        Seja bem-vindo!<br>
                                        Aqui você encontra um grande catalógo de arquivos de flyers em psd(projetos editáveis do photoshop)<br>
                                        Selecione uma categoria nos menus abaixo ou nos envie uma mensagem no icone de chat acima para solicitar um flyer personalizado!  
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td >
                            <%@ include file="listaflyers1.jsp" %>
                        <br>
                        <br> 
                    </td>
                </tr>

            </table>  
            </div>
            
                        <br>
                        <br>            

        <script src='assets/js/script.js'></script>       
    </body>
</html>
