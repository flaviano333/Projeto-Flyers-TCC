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
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.Flyers;
import modelo.FlyersDAO;

/**
 *
 * @author Flávio
 */
@WebServlet(name = "AlterarFlyer", urlPatterns = {"/AlterarFlyer"})

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // Tamanho em bytes
    maxFileSize = 1024 * 1024 * 50,  // Tamanho máximo do arquivo em bytes (5MB, ajuste conforme necessário)
    maxRequestSize = 1024 * 1024 * 50 * 5  // Tamanho máximo da solicitação em bytes
)
public class AlterarFlyer extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Part filePart = request.getPart("imagem");
        InputStream fileInputStream = filePart.getInputStream();
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[40000];
        int bytesRead;
        while ((bytesRead = fileInputStream.read(buffer)) != -1) {
            output.write(buffer, 0, bytesRead);
        }
        Part filePart1 = request.getPart("arquivo");
        InputStream fileInputStream1 = filePart1.getInputStream();
        ByteArrayOutputStream output1 = new ByteArrayOutputStream();
        byte[] buffer1 = new byte[40000];
        int bytesRead1;
        while ((bytesRead1 = fileInputStream1.read(buffer1)) != -1) {
            output1.write(buffer1, 0, bytesRead1);
        }        
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Alterar Flyer</title>");
            out.println("</head>");
            out.println("<body>");
            
            int id = Integer.parseInt(request.getParameter("idFlyers"));
            out.println("as");
            
            Double preco = Double.parseDouble(request.getParameter("preco"));
            Double precoantigo = Double.parseDouble(request.getParameter("valorantigo"));
            String nome = request.getParameter("nome");
            String tipo = request.getParameter("tipo");
            String descricao = request.getParameter("descricao");
            byte[] imagem = output.toByteArray();
            byte[] arquivo = output1.toByteArray();            
            if (nome == null || nome.equals("")) {
                out.print("O campo Nome deve ser preenchido!");
            }else {
                try {
                    if(preco <= 0 || Objects.equals(preco, precoantigo)){
                        if (null != tipo)switch (tipo) {
                            case "Pacote personalizado editavel":
                                preco = 255.0;
                                break;
                            case "Pacote pronto editavel":
                                preco = 200.0;
                                break;
                            case "Pacote pronto nao editavel":
                                preco = 155.0;
                                break;
                            case "Flyer pronto editavel":
                                preco = 20.0;
                                break;
                            case "Flyer pronto nao editavel":
                                preco = 12.0;
                                break;
                            case "Flyer personalizado editavel":
                                preco = 25.0;
                                break;
                            case "Flyer personalizado nao editavel":
                                preco = 20.0;
                                break;
                            default:
                                break;
                        }                 
                    }                    
                    Flyers f = new Flyers();
                    f.setPreco(preco);
                    f.setNome(nome);
                    f.setIdFlyers(id);
                    f.setTipo(tipo);
                    f.setDescricao(descricao);
                    f.setImagem(imagem);
                    f.setArquivo(arquivo);
                    FlyersDAO uDB = new FlyersDAO();
                    uDB.conectar();
                    uDB.Alterar(f);
                    uDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Flyer alterado com sucesso!!');");
                    out.print("location.href='gerenciar_flyers.jsp';");
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
