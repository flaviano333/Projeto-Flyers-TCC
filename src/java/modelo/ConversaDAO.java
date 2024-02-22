package modelo;

/**
 *@author Flávio
 *Importação das bibliotecas para a conexão com o banco de dados
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ConversaDAO extends DataBaseDAO{

    public ConversaDAO() throws Exception {}   

    public void EnviarMensagem(Conversa conversa) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO conversa (Mensagem,Imagem_Arquivo,Usuario_Id,Usuario_DestinatarioId) VALUES(?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, conversa.getMensagem());
        pst.setBytes(2, conversa.getImagemArquivo());
        pst.setInt(3, conversa.getUsuario().getId());
        pst.setInt(4, conversa.getDestinatarioId());
        pst.execute();
    } 

    public void Alterar(Conversa conversa) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE conversa SET Mensagem=? WHERE ID=?";
        pst = conn.prepareStatement(sql);        
        pst.setString(1, "<p style='font-size:12px;'><b>(editada)</b></p>"+conversa.getMensagem());
        pst.setInt(2, conversa.getId());
        
        pst.execute();
    }

    public void excluir(Conversa conversa) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM conversa WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, conversa.getId());
        pst.execute();
    } 

    public ArrayList<Conversa> listarConversa(int usuarioId, int destinatarioId) throws Exception {
        ArrayList<Conversa> conversas = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM conversa WHERE (usuario_id = ? AND usuario_destinatarioid = ?) OR (usuario_id = ? AND usuario_destinatarioid = ?) ORDER BY id";
        pst = conn.prepareStatement(sql);
        Conversa c = null;
        pst.setInt(1, usuarioId);
        pst.setInt(2, destinatarioId);
        pst.setInt(3, destinatarioId);
        pst.setInt(4, usuarioId);
        rs = pst.executeQuery();
        while (rs.next()) {   
            c = new Conversa();
            c.setId(rs.getInt("id"));
            c.setMensagem(rs.getString("mensagem"));
            c.setImagemArquivo(rs.getBytes("Imagem_arquivo"));
            int idUsuarioDestinatario = rs.getInt("Usuario_destinatarioid");

            Usuario u = new Usuario();
            u.setId(idUsuarioDestinatario);

            if (idUsuarioDestinatario == usuarioId) {
                UsuarioDAO uDB = new UsuarioDAO();
                uDB.conectar();
                Usuario usuario = uDB.Consultar(destinatarioId); 
                u.setNome(usuario.getNome()); 
                u.setPerfil(usuario.getPerfil());
                uDB.desconectar();
            } else if (idUsuarioDestinatario == destinatarioId) {
                UsuarioDAO uDB = new UsuarioDAO();
                uDB.conectar();
                Usuario usuario = uDB.Consultar(usuarioId); 
                u.setNome(usuario.getNome()); 
                u.setPerfil(usuario.getPerfil());
                uDB.desconectar();
            }

            c.setUsuario(u);
            conversas.add(c);
        }
        return conversas;
    }
    
    
}
