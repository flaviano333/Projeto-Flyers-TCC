/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Perfil;
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 *
 * @author Flávio
 */
@WebServlet(name = "AlterarUsuario", urlPatterns = {"/alterar_usuario.do"})
public class AlterarUsuario extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Alterar Usuario</title>");
            out.println("</head>");
            out.println("<body>");
            
            int id = Integer.parseInt(request.getParameter("id"));
            boolean status = true;
            String nome = request.getParameter("nome");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            String cpf = request.getParameter("cpf");
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");

            if (nome == null || nome.equals("")) {
                out.print("O campo Nome deve ser preenchido!");
            } else if (login == null || login.equals("")) {
                out.print("O campo Login deve ser preenchido!");
            } else if (senha == null || senha.equals("")) {
                out.print("O campo Senha deve ser preenchido!");
            }else {
                try {
                    Usuario u = new Usuario();
                    UsuarioDAO usDB = new UsuarioDAO();
                    Perfil p = new Perfil();
                    usDB.conectar();
                    Usuario us = usDB.Consultar(id);
                    usDB.desconectar();
                    int idPerfil = us.getPerfil().getIdPerfil();
                    p.setIdPerfil(idPerfil);                    
                    u.setPerfil(p);
                    u.setId(id);
                    u.setNome(nome);
                    u.setLogin(login);
                    u.setSenha(senha);
                    u.setCpf(cpf);
                    u.setEmail(email);
                    u.setTelefone(telefone);
                    u.setStatus(status);
                    UsuarioDAO uDB = new UsuarioDAO();
                    uDB.conectar();
                    uDB.Alterar(u);
                    uDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Dados alterados com sucesso! Faça login novamente para que as alterações entrem em vigor!');");
                    out.print("location.href='sair.jsp';");
                    out.print("</script>");
                } catch (Exception erro) {
                    out.print(erro);
                }

            }

            out.println("</body>");
            out.println("</html>");


        } finally { 
            out.close();
        }
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
