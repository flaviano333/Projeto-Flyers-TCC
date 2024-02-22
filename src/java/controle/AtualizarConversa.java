/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Conversa;
import modelo.ConversaDAO;
import modelo.Usuario;

/**
 *
 * @author Flávio
 */
@WebServlet(name = "AtualizarConversa", urlPatterns = {"/AtualizarConversa"})
public class AtualizarConversa extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            // Obtenha o ID do usuário da sessão (você pode ajustar isso conforme sua lógica)


            // Obtém as mensagens do chat usando o DAO
            try{
            HttpSession session = request.getSession();
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            int usuarioId = usuario.getId();

            // Obtém o ID do destinatário (você pode ajustar isso conforme sua lógica)
            int destinatarioId = Integer.parseInt(request.getParameter("destinatarioId"));                
            ConversaDAO cDB = new ConversaDAO();
            cDB.conectar();
            ArrayList<Conversa> mensagens = cDB.listarConversa(usuarioId, destinatarioId);
            cDB.desconectar();
            // Converte a lista de mensagens para JSON
            String json = new Gson().toJson(mensagens);

            // Define o tipo de conteúdo da resposta como JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Envia a resposta de volta ao cliente
            response.getWriter().write(json);        
            }catch (Exception erro) {
                erro.printStackTrace();  // Isso imprime detalhes completos do erro no console
                out.print("Erro ao processar a requisição: " + erro.getMessage());
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