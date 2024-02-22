/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Compra;
import modelo.CompraDAO;
import modelo.Flyers;
import modelo.Usuario;

/**
 *
 * @author Flávio
 */
@WebServlet(name = "AdicionarCarrinho", urlPatterns = {"/AdicionarCarrinho"})
public class AdicionarCarrinho extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Adicionar ao carrinho</title>");
            out.println("</head>");
            out.println("<body>");

            java.sql.Timestamp timestamp = new java.sql.Timestamp(new Date().getTime()); 
            java.sql.Date data = new java.sql.Date(timestamp.getTime());
            String status = request.getParameter("status");            
            Double valorFinal = Double.parseDouble(request.getParameter("valor"));
            int usuarioId = Integer.parseInt(request.getParameter("usuarioId")); 
            int flyerId = Integer.parseInt(request.getParameter("idFlyers"));
            if (usuarioId <= 0) {
                    out.print("<script language='javascript'>");
                    out.print("alert('Você deve estar logado para efetuar uma compra!!!');");
                    out.print("location.href='index.jsp';");
                    out.print("</script>");
            }else {
                try {
                    Compra c = new Compra();
                    c.setData(data);
                    c.setStatus(status);
                    c.setValorFinal(valorFinal);
                    Usuario u = new Usuario();
                    u.setId(usuarioId);
                    c.setUsuario(u);
                    Flyers f = new Flyers();
                    f.setIdFlyers(flyerId);
                    c.setFlyers(f);
                    CompraDAO uDB = new CompraDAO();
                    uDB.conectar();
                    uDB.AdicionarCarrinho(c);              
                    uDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Item adicionado ao carrinho com sucesso!!!');");
                    out.print("location.href='carrinho.jsp';");
                    out.print("</script>");
                } catch (Exception erro) {
                    out.print(erro);
                    out.println(data + status + valorFinal + usuarioId + flyerId);
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
