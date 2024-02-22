<%-- 
    Document   : sair
    Created on : 22/10/2023, 17:09:53
    Author     : Flávio
--%>
<%
    session.removeAttribute("usuario");
    response.sendRedirect("index.jsp");

%>