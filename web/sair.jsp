<%-- 
    Document   : sair
    Created on : 22/10/2023, 17:09:53
    Author     : Fl�vio
--%>
<%
    session.removeAttribute("usuario");
    response.sendRedirect("index.jsp");

%>