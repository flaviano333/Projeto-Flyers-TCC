package modelo;

/**
 * @author Flávio
 * Importação das bibliotecas para a conexão com o banco de dados
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UsuarioDAO extends DataBaseDAO{
    
    public UsuarioDAO() throws Exception {} 

    public void Cadastrar(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO usuario (Login,Senha,Nome,Cpf, Telefone, email, Status, Perfil_idPerfil) VALUES(?,?,?,?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, usuario.getLogin());
        pst.setString(2, usuario.getSenha());
        pst.setString(3, usuario.getNome());
        pst.setString(4, usuario.getCpf());
        pst.setString(5, usuario.getTelefone());
        pst.setString(6, usuario.getEmail());
        pst.setBoolean(7, usuario.isStatus());
        pst.setInt(8, 2);
        pst.execute();
    }     

    public void Alterar(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE usuario SET Login=?,Senha=?,Nome=?,Cpf=?, Telefone=?, email=?, Status=?, Perfil_idPerfil=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setString(2, usuario.getSenha());
        pst.setString(3, usuario.getNome());
        pst.setString(4, usuario.getCpf());
        pst.setString(5, usuario.getTelefone());
        pst.setString(6, usuario.getEmail());
        pst.setBoolean(7, usuario.isStatus());
        pst.setInt(8, usuario.getPerfil().getIdPerfil());
        pst.setInt(9, usuario.getId());
        pst.setString(1, usuario.getLogin());
        
        pst.execute();
    }
    public void AlterarStatus(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE usuario SET Status=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setBoolean(1, usuario.isStatus());
        pst.setInt(2, usuario.getId());
        
        pst.execute();
    }
    public void AlterarPerfil(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE usuario SET Perfil_idPerfil=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, usuario.getPerfil().getIdPerfil());
        pst.setInt(2, usuario.getId());
        
        pst.execute();
    }     
    public void excluir(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM usuario WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, usuario.getId());
        pst.execute();
    } 
    
    public Usuario Consultar(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Usuario u = new Usuario();
        if (rs.next()) {
            pst.setInt(1, id);
            Perfil p = new Perfil();
            p.setIdPerfil(rs.getInt("Perfil_idPerfil"));
            u.setId(rs.getInt("id"));
            u.setLogin(rs.getString("Login"));
            u.setSenha(rs.getString("Senha"));
            u.setNome(rs.getString("Nome"));
            u.setCpf(rs.getString("Cpf"));
            u.setTelefone(rs.getString("Telefone"));
            u.setEmail(rs.getString("email"));
            u.setStatus(rs.getBoolean("Status"));
            u.setPerfil(p);
        }

        return u;
    }   
    public ArrayList<Usuario> listar() throws Exception {
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Usuario u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setLogin(rs.getString("login"));
            u.setCpf(rs.getString("cpf"));
            u.setTelefone(rs.getString("telefone"));
            u.setEmail(rs.getString("email"));
            u.setStatus(rs.getBoolean("status"));
            Perfil p = new Perfil();
            p.setIdPerfil(rs.getInt("Perfil_idPerfil")); 
            u.setPerfil(p);
            lista.add(u);
        }

        return lista;
    }    
    public void ativar_desativar(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE usuario SET Status WHERE Login=?";
        pst = conn.prepareStatement(sql);
        pst.setBoolean(1, usuario.isStatus());
        pst.execute();
    } 
    public Usuario logar(String login, String senha) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario WHERE login=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, login);

        rs = pst.executeQuery();
        Usuario u = new Usuario();
        Perfil p = new Perfil();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                u.setId(rs.getInt("id"));
                u.setLogin(rs.getString("login"));
                u.setNome(rs.getString("nome"));
                u.setStatus(rs.getBoolean("status"));
                u.setSenha(rs.getString("senha"));
                p.setIdPerfil(rs.getInt("Perfil_idPerfil"));
                u.setPerfil(p);

            }
        }
        return u;
    }    
}
