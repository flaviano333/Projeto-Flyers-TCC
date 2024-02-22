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
import modelo.Conversa;
import modelo.ConversaDAO;

/**
 *
 * @author Flávio
 */
@WebServlet(name = "AlterarMensagem", urlPatterns = {"/AlterarMensagem"})
public class AlterarMensagem extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Alterar Mensagem</title>");
            out.println("</head>");
            out.println("<body>");
            String mensagem = request.getParameter("mensagem");
            int id = Integer.parseInt(request.getParameter("messageId"));
            int idDestinatario = Integer.parseInt(request.getParameter("idDestinatario"));
            if (mensagem == null || mensagem.equals("")) {
                out.print("Insira uma nova mensagem!");
            }else {
                try {
                    Conversa c = new Conversa();
                    c.setMensagem(mensagem);
                    c.setId(id);
                    ConversaDAO uDB = new ConversaDAO();
                    uDB.conectar();
                    uDB.Alterar(c);
                    uDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Mensagem alterada com sucesso com sucesso!!');");
                    if(idDestinatario == 0){
                        out.print("location.href='conversa_cliente.jsp';");
                    }else{
                        out.print("location.href='conversa_adm_1.jsp?idDestinatario="+ idDestinatario+ "';");
                    }
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
