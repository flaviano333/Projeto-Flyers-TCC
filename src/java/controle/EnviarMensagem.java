/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.Conversa;
import modelo.ConversaDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;


/**
 *
 * @author 339202
 */
@WebServlet(name = "EnviarMensagem", urlPatterns = {"/EnviarMensagem"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // Tamanho em bytes
    maxFileSize = 1024 * 1024 * 50,  // Tamanho máximo do arquivo em bytes (5MB, ajuste conforme necessário)
    maxRequestSize = 1024 * 1024 * 50 * 5  // Tamanho máximo da solicitação em bytes
)
public class EnviarMensagem extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Part filePart = request.getPart("imagemArquivo");
        InputStream fileInputStream = filePart.getInputStream();
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[40000];
        int bytesRead;
        while ((bytesRead = fileInputStream.read(buffer)) != -1) {
            output.write(buffer, 0, bytesRead);
        }        
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Enviar mensagem</title>");
            out.println("</head>");
            out.println("<body>");

            String mensagem = request.getParameter("mensagem");
            int idUsuario = Integer.parseInt(request.getParameter("usuarioId"));
            int idDestinatario = Integer.parseInt(request.getParameter("destinatarioId"));
            byte[] imagemArquivo = output.toByteArray();
            int Destinatario = Integer.parseInt(request.getParameter("idDestinatario"));
            
            if (mensagem == null || mensagem.equals("")) {
                out.print("O campo mensagem deve ser preenchido!");
            }else {
                try {
                    Conversa c = new Conversa();
                    c.setImagemArquivo(imagemArquivo);
                    c.setMensagem(mensagem);
                    Usuario u = new Usuario();
                    u.setId(idUsuario);
                    c.setUsuario(u);
                    UsuarioDAO uDB = new UsuarioDAO();
                    uDB.conectar();
                    Usuario usuario = uDB.Consultar(idUsuario);
                    int idPerfil = usuario.getPerfil().getIdPerfil();
                    uDB.desconectar();
                    c.setDestinatarioId(idDestinatario);
                    ConversaDAO cDB = new ConversaDAO();
                    cDB.conectar();
                    cDB.EnviarMensagem(c);
                    cDB.desconectar();
                    out.print("<script language='javascript'>");
                    if(Destinatario == 0){
                        out.print("location.href='conversa_cliente.jsp';");
                    }else{
                        out.print("location.href='conversa_adm_1.jsp?idDestinatario="+ Destinatario+ "';");
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
