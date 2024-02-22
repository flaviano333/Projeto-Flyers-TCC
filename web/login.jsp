<%-- 
    Document   : login
    Created on : 23/10/2023, 23:42:51
    Author     : Flávio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Formulário de Login</title>
    <link rel="stylesheet" type="text/css" href="assets/css/login.css">
</head>
<body>
    
    <div id="formulario-container" class="formulario-container"><button id="mostrar-formulario"></button>
        <div id="formulario" class="formulario">
            <button id="fechar-formulario" class="botaofechar">×</button>
            <h2>Acesse sua conta</h2>
            <br>
            <form name="form_login" action="efetuar_login.do" method="post" onsubmit="return validaForm();">
                <div align="center">
                <input type="text" id="usuario" placeholder="Login" name="login">
                <input type="password" id="senha" placeholder="Senha" name="senha">
                <br>
                <a class="textoesquerda" href="#">Esqueci minha senha</a>
                <button class='botaoentrar' type="submit"><b>Entrar</b></button>
                <br>
                <br>
                <spam class="textocentro">Não tem uma conta? </spam><a class="textoa" href="form_cadastro.jsp">Cadastre-se</a>
                <br>

                
                </div>
            </form>
        </div>
    </div>
    <script src="assets/js/loginform.js"></script>
</body>
</html>
