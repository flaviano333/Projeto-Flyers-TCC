<%-- 
    Document   : listaflyers1
    Created on : 01/11/2023, 14:44:24
    Author     : Flávio
--%>

<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Conversa"%>
<%@page import="modelo.ConversaDAO"%>
<%@page import="java.util.Base64"%>
<%@page import="modelo.Flyers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.FlyersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <title>ListaConversa</title>
        <link rel ="stylesheet" href="assets/css/style.css">
        <link rel="preload" href="assets/css/style.css" as="style">  
        <script>
            function scrollToBottom() {
                var scrollableContent = document.getElementById('scrollableContent');
                scrollableContent.scrollTop = scrollableContent.scrollHeight;
            }

            function showOptionsPopUp(messageId) {
                var optionsPopUp = document.getElementById('optionsPopUp');
                optionsPopUp.style.display = 'block';
                optionsPopUp.dataset.messageId = messageId;

                // Preencha o campo de entrada no formulário com o ID da mensagem
                document.getElementById('messageIdInput').value = messageId;
            }

            function hideOptionsPopUp() {
                var optionsPopUp = document.getElementById('optionsPopUp');
                optionsPopUp.style.display = 'none';
            }            
        </script> 
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <style>
            #optionsPopUp {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                border: 1px solid #d4d4d4;
                padding: 10px;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                z-index: 1;
            }
            .scrollable-content{
                width:100%;
            max-height: 600px;
            overflow-y: auto;                
            }
        </style>        
    </head>
    <body>
        <div id="scrollableContent" class="scrollable-content">
            <div align="center">
                <div id='atualizarchat'>            
                <table id="TabelasConversa"> 
                    
                    <%                                            
                        try {
                            ConversaDAO cDB = new ConversaDAO();
                            ArrayList<Conversa> lista;
                            String posicao = null;
                            String voce = null;
                            
                            cDB.conectar();
                            lista = cDB.listarConversa(usuarioId, destinatario);
                            cDB.desconectar();
                            for(Conversa c:lista){
                                if((c.getUsuario().getPerfil().getIdPerfil() == 1)){
                                    posicao = "right";
                                    voce = " - você";
                                }else{
                                    posicao = "left";
                                    voce = "";                                    
                                }
                    %>                                 
                                <tr>
                                    <td align="<%=posicao %>"><%=c.getUsuario().getNome() + voce + ": " %></td>
                                    <% if(c.getUsuario().getPerfil().getIdPerfil() == 1){ %> 
                                        <td><span onclick="showOptionsPopUp('<%=c.getId()%>')">&#8226;&#8226;&#8226;</span></td>
                                    <% } %>
                                </tr>                                    
                                <tr>
                                    <td align="<%=posicao %>"><%=c.getMensagem() %></td>
                                </tr>
                                <% if(c.getImagemArquivo() != null && c.getImagemArquivo().length > 0){ %>
                                    <tr>
                                        <td align="<%=posicao %>"><img width="300px" src="data:image/png;base64,<%= Base64.getEncoder().encodeToString(c.getImagemArquivo()) %>" /></td>
                                    </tr>
                                <% } %>
                                <tr>
                                    <td><br></td>
                                </tr>                               
                            <%                                    
                            }
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    %>
                    <tr align="right">
                </table>
            </div>
                    <br>
                    <table>
                        <td align='right'>
                            <form  action="enviar_mensagem.do?idDestinatario=<%=destinatario %>" method="post" enctype="multipart/form-data" >
                                <input style="display: none" value="<%=usuarioId%>" name="usuarioId">
                                <input style="display: none" value="<%=destinatario %>" name="destinatarioId">
                                <textarea input type="text" name="mensagem" rows="1" cols="85" style="resize: none; border-radius:25px; padding:8px; font-size:15px;" /></textarea><input type="file" name="imagemArquivo" >
                                <input type="submit" class="estilo-botao-azul" value="Enviar"/>
                            </form>                             
                        </td>
                    </tr>
                    </table>
        </div>
        <div id="optionsPopUp">
            <div align="right"><button class="estilo-botao-vermelho" onclick="hideOptionsPopUp()" >&times;</button></div>
            <br>
            <form name="form_acoes_mensagem" method="post">
                <input type="hidden" id="messageIdInput" name="messageId">
                <p><input type="text" style="padding:8px; font-size:15px; border-radius:25px;"size="50" id="passwordInput" name="mensagem" placeholder="Insira sua nova mensagem"></p>
                <button type="submit" class="estilo-botao-verde" formaction="alterar_mensagem.do?idDestinatario=<%=destinatario %>">Alterar mensagem</button>
                <button type="submit" class="estilo-botao-vermelho" formaction="excluir_mensagem.do?idDestinatario=<%=destinatario %>">Excluir mensagem</button>
            </form>
        </div>
</div>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                scrollToBottom();
                atualizarConversa();
            });
            function atualizarConversa() {
                var destinatarioId =  <%=destinatario %>;  // Substitua pelo ID do destinatário desejado
                $.ajax({
                    url: 'atualizar_conversa.do?destinatarioId=' + destinatarioId,
                    type: 'GET',
                    dataType: 'json',
                    success: function (mensagens) {
                        setInterval(atualizarConversa, 6000); // Chama a função a cada 5 segundos (5000 milissegundos)
                        exibirMensagensNaInterface(mensagens); // Role até o final após a atualização
                    },
                    error: function () {
                        console.error('Erro ao obter mensagens do servidor.');
                        atualizarConversa();
                    }
                });
            }
function exibirMensagensNaInterface(mensagens) {
    console.log('Função exibirMensagensNaInterface chamada');
    var divAtualizar = $('#atualizarchat');
    divAtualizar.empty();

    // Inicia a construção da string HTML
    var htmlString = '<table id="TabelasConversa">';

    for (var i = 0; i < mensagens.length; i++) {
        var mensagem = mensagens[i];
        var posicao = null;
        var voce = null;

        if (mensagem && mensagem.usuario && mensagem.usuario.perfil) {
            if (mensagem.usuario.perfil.idPerfil !== 1) {
                posicao = "left";
            } else {
                posicao = "right";
            }

            if (mensagem.usuario.perfil.idPerfil === 1) {
                voce = " - você";
            } else {
                voce = "";
            }
        }

        // Adiciona uma nova linha para cada mensagem
        htmlString += '<tr>';

        // Adiciona célula para o nome do usuário
        htmlString += '<td align="' + posicao + '">' + (mensagem.usuario.nome + voce + ": " || "") + "</td>";

        if (mensagem && mensagem.usuario && mensagem.usuario.perfil && mensagem.usuario.perfil.idPerfil === 1) {
            htmlString += '<td><span onclick="showOptionsPopUp(' + (mensagem.id || '') + ')">&#8226;&#8226;&#8226;</span></td>';
        }

        // Fecha a célula e a linha
        htmlString += '</tr>';

        // Adiciona uma nova linha antes de cada mensagem
        htmlString += '<tr>';

        // Adiciona célula para a mensagem
        htmlString += '<td align="' + posicao + '">' + (mensagem.mensagem || '') + '</td>';

        // Fecha a célula e a linha
        htmlString += '</tr>';

        if ((mensagem.imagemArquivo || []).length > 0) {
            var base64Image = 'data:image/png;base64,' + arrayBufferToBase64(mensagem.imagemArquivo);

            // Adiciona uma nova linha antes da imagem
            htmlString += '<tr>';

            // Adiciona célula para a imagem
            htmlString += '<td align="' + posicao + '"><img width="300px" src="' + base64Image + '" /></td>';

            // Fecha a célula e a linha
            htmlString += '</tr>';
            htmlString += '<br>';
        }
    }
    // Fecha a tabela

    // Atribui a string HTML à div
    divAtualizar.html(htmlString);
}
            function arrayBufferToBase64(buffer) {
                var binary = '';
                var bytes = new Uint8Array(buffer);
                var len = bytes.byteLength;
                for (var i = 0; i < len; i++) {
                    binary += String.fromCharCode(bytes[i]);
                }
                return btoa(binary);
            }           
        </script>
    </body>
</html>