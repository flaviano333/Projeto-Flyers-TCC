/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Flávio
 */
@WebServlet(name = "Download", urlPatterns = {"/Download"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // Tamanho em bytes
    maxFileSize = 1024 * 1024 * 50,  // Tamanho máximo do arquivo em bytes (5MB, ajuste conforme necessário)
    maxRequestSize = 1024 * 1024 * 50 * 5  // Tamanho máximo da solicitação em bytes
)
public class Download extends HttpServlet {
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("application/octet-stream");
    try (OutputStream outputStream = response.getOutputStream()) {
        // Recupera o conteúdo base64 do banco de dados (substitua esta linha pela lógica real)
        String base64Image = request.getParameter("img");

        if (base64Image != null) {
            // Obtém o nome do arquivo (substitua esta linha pela lógica real)
            String nomeDoArquivo = "arquivo";

            // Converte a string base64 para bytes
            byte[] arquivoBytes = Base64.getDecoder().decode(base64Image);

            // Define o cabeçalho para o nome do arquivo
            response.setHeader("Content-Disposition", "attachment; filename=\"" + nomeDoArquivo + "\"");
            response.setContentLength(arquivoBytes.length);

            // Escreve os bytes do arquivo na resposta
            outputStream.write(arquivoBytes);
        } else {
            // Lógica para lidar com a ausência do parâmetro 'img'
            response.getWriter().println("Parâmetro 'img' ausente");
        }
    } finally {

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
