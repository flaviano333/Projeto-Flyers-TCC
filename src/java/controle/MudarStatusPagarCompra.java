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
import modelo.Compra;
import modelo.CompraDAO;

/**
 *
 * @author Flávio
 */
@WebServlet(name = "MudarStatusPagarCompra", urlPatterns = {"/MudarStatusPagarCompra"})
public class MudarStatusPagarCompra extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Mudar status compra</title>");
            out.println("</head>");
            out.println("<body>");
            String id = request.getParameter("idCompra");
            if (id == null || id.equals("")) {
                out.print("Nenhuma compra encontrada!!!");
            } else {
                try {
                    Compra c = new Compra();
                    c.setIdCompra(Integer.parseInt(id));
                    c.setStatus("A pagar");
                    CompraDAO pDB = new CompraDAO();
                    pDB.conectar();
                    pDB.AlterarCarrinho(c);
                    pDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Escolha um meio de pagamento!!!');");
                    out.print("location.href='carrinho_a_pagar.jsp';");
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
