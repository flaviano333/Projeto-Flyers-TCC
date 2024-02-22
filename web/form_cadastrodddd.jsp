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
        <link rel="preload" href="assets/js/menu2.js" as="script">
     
    </head>
    <body>
        <div class="banner">
            <table width="100%">
                <tr>
                    <td>
                        <img width="70px" src="assets/imagens/menu.png" alt="Clique para abrir ou fechar o menu" id="btnMenu2">
                    </td>                    
                    <td>
                        <a href="paginaPrincipal.jsp"><img width="300px" src="assets/imagens/logo.png" id="btnLogo" alt="learned"></a>
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
                    <li><a id="linha" href="index.jsp">Página principal</a></li>
                    <li><a href="#" id="voltar"><label id="linha">Retornar para a página anterior</label></a></li>
                </ul>
            </nav>
        </div>          
               
        <table id="FichaCadastro" width="360">                
            <tr><td>
                    <div align="center">
                        
                        <form name="form_usuario" action="cadastrar_usuario.do" method="post" onsubmit="return validaFormCadastroU();">
                            <div align="center"> 
                            <h2>Ficha de cadastro</h2>
                            </div>
                            <table>
                                
                                <tr>
                                    <td bgcolor="#7FFFD4">Nome:</td>
                                    <td><input type="text" placeholder="Insira o seu nome" name="nome" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#7FFFD4">Login:</td>
                                    <td><input type="text" placeholder="Crie um login" name="login" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#7FFFD4">Senha:</td>
                                    <td><input type="password" placeholder="Crie uma senha" name="senha" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#7FFFD4">Cpf:</td>
                                    <td>
                                        <input placeholder="Insira o seu cpf" type="text" name="cpf" size="30" />
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#7FFFD4">Telefone:</td>
                                    <td>
                                        <input type="text" placeholder="Insira o seu número de telefone" name="telefone" size="30" />
                                    </td>
                                </tr>  
                                <tr>
                                    <td bgcolor="#7FFFD4">E-mail:</td>
                                    <td>
                                        <input type="text" placeholder="Insira o seu email" name="email" size="30" />
                                    </td>
                                </tr>                                   
                                <tr>
                                    <td><input type="submit" value="Cadastrar" /> </td>
                                </tr>
                            </table>
                        </form>
                
                    </td>
                </tr>
            </table>
               
        <script src='assets/js/menu2.js'></script>
      
    </body>
</html>
