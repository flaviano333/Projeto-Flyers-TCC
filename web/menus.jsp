<%-- 
    Document   : menus
    Created on : 31/10/2023, 20:01:12
    Author     : Flávio
--%>

<%@page import="modelo.Perfil"%>
<%@page import="modelo.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

Usuario usuario = new Usuario();

try{
    usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null){
        response.sendRedirect("paginaPrincipal.jsp");
    }
    %>  
        
        <table>
            <tr>
        <%
        PerfilDAO pDB = new PerfilDAO();
        
               
        pDB.conectar();
        
        ArrayList<Menu> listaMenu = pDB.menusVinculados(usuario.getPerfil().getIdPerfil());
        
        for(Menu m: listaMenu){
        %>      
                <td style="background-color: white; border: 1px solid #b3b3b3; border-radius:35px; transition: background-color 0.3s; height:40px; " onmouseover="this.style.backgroundColor='#e6f2ff'" onmouseout="this.style.backgroundColor=' white'">
                    <a style="text-decoration: none; color:blue;" href="<%=m.getLink() %>"> &NonBreakingSpace;&NonBreakingSpace;<%=m.getMenu() %> &NonBreakingSpace;&NonBreakingSpace;</a> 
                </td>
        <%
        }
        pDB.desconectar();
        %>
            </tr>
        </table>
    
<%
}catch(Exception e){
    out.print(e);

}

%>