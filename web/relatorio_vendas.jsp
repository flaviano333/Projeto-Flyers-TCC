<%-- 
    Document   : index
    Created on : 22/10/2023, 14:23:34
    Author     : Flávio
--%>

<%@page import="modelo.MenuDAO"%>
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
            <%

        Usuario u = new Usuario();
        try{
            u = (Usuario) session.getAttribute("usuario");           
            int usuarioId = u.getId();
            session.setAttribute("usuarioId", usuarioId); 
            int idPerfil = u.getPerfil().getIdPerfil();
            MenuDAO mDB = new MenuDAO();
            Menu menu = new Menu();
            menu.setLink("meus_dados.jsp");
            menu.setMenu("Meus dados");
            mDB.conectar();
            int idmenu = mDB.inserir(menu);
            mDB.desconectar();
            PerfilDAO perfil = new PerfilDAO(); 
            perfil.conectar();
            perfil.vincularMenu(idPerfil, idmenu);
            perfil.desconectar();
            if(idmenu<0){
                MenuDAO menuDAO = new MenuDAO();
                menuDAO.conectar();
                Menu m1 = menuDAO.Consultar("Meus dados");
                menuDAO.desconectar();
                int idMenu = m1.getIdMenu();
                perfil.conectar();
                perfil.vincularMenu(idPerfil, idMenu);
                perfil.desconectar();                
            }
          
            if(idPerfil == 1){
                int numeroDeExecucoes = 5;
                String[] links = {"gerenciar_flyers.jsp", "gerenciar_menus.jsp", "gerenciar_perfis.jsp", "gerenciar_usuarios.jsp", "relatorio_vendas.jsp"};
                String[] menus = {"Gerenciar Flyers", "Gerenciar Menus", "Gerenciar Perfis", "Gerenciar Usuarios", "Relatorio de vendas"};                
                for (int i = 0; i < numeroDeExecucoes; i++) {
                    // Defina os valores de menu
                    Menu menu1 = new Menu();
                    menu1.setLink(links[i]); // Use um valor diferente em cada passagem do loop
                    menu1.setMenu(menus[i]); // Use um valor diferente em cada passagem do loop

                    // Conecta e insere no MenuDAO
                    mDB.conectar();
                    int idmenu1 = mDB.inserir(menu1);
                    mDB.desconectar();

                    // Conecta e vincula no PerfilDAO
                    perfil.conectar();
                    perfil.vincularMenu(idPerfil, idmenu1);
                    perfil.desconectar();

                    // Verifica se a inserção falhou (idmenu1 <= 0)
                    if (idmenu1 <= 0) {
                        MenuDAO menuDAO = new MenuDAO();
                        menuDAO.conectar();
                        Menu m1 = menuDAO.Consultar("Gerenciar Flyers");
                        menuDAO.desconectar();
                        int idMenu1 = m1.getIdMenu();

                        // Conecta e vincula no PerfilDAO
                        perfil.conectar();
                        perfil.vincularMenu(idPerfil, idMenu1);
                        perfil.desconectar();
                    }
                }  
            }
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
                    <li><a id="linha" href="meus_menus.jsp">Meus Menus</a></li>  
                    <li><a id="linha" href="sair.jsp">Sair</a></li>  
                </ul>
            </nav>
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
                        <div align="center">
                            <h4><%@ include file="menus.jsp" %></h4>
                        </div>
                    </td>

                
                </tr>
                <tr>
                    <td align="center" width="50%" style="vertical-align: top;">
                        <table>
                            <tr>
                                <td style="vertical-align: top;">
                        <table width="100%" >
                            <tr>
                                <td align="center" width="48%" style="vertical-align: top;">
                                    
                                    <table id="TabelasRelatoriovendas" >
                                        <tr>
                                            <td align="center" >
                                                <table >
                                                    <tr>
                                                        <td align="center" >
                                                            <h3>Lista de compras esperando análise</h3>
                                                            <%@ include file="compras_em_analise.jsp" %>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td align="center" width="48%" style="vertical-align: top;"> 
                                    <table id="TabelasRelatoriovendas">
                                        <tr>
                                            <td align="center">
                                                <table >
                                                    <tr>
                                                        <td align="center">
                                                            <h3>Relatório de vendas</h3>
                                                            <%@ include file="lista_vendas_concluidas.jsp" %>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>                      
                            </tr>                  
                        </table>                                     
                                </td>
                            </tr>
                        </table>
                       
                    </td>

                </tr>
                <tr>
                    <td >

                        <br>
                        <br> 
                    </td>

                </tr>

            </table>  
            </div>
            
                        <br>
                        <br>            

        <script src='assets/js/script.js'></script> 
        <script src="assets/js/loginmenu.js"></script>   
                <%
                }catch(Exception e){
                    //out.print(e);
                    response.sendRedirect("paginaPrincipal.jsp");
                }

                %>          
    </body>
</html>
