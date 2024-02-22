package modelo;

/**
 *
 * @author Flávio
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
public class FlyersDAO extends DataBaseDAO{
    public FlyersDAO() throws Exception {} 
    public void Cadastrar(Flyers flyers) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO flyers (Nome,Tipo,Imagem,Descricao, Preco, Arquivo) VALUES(?,?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, flyers.getNome());
        pst.setString(2, flyers.getTipo());
        pst.setBytes(3, flyers.getImagem());
        pst.setString(4, flyers.getDescricao());
        pst.setDouble(5, flyers.getPreco());
        pst.setBytes(6, flyers.getArquivo());
        pst.execute();
    }      
   public void Alterar(Flyers flyers) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE flyers SET Nome=?,Tipo=?,Imagem=?,Descricao=?, Preco=?, Arquivo=? WHERE idFlyers=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, flyers.getNome());
        pst.setString(2, flyers.getTipo());
        pst.setBytes(3, flyers.getImagem());
        pst.setString(4, flyers.getDescricao());
        pst.setDouble(5, flyers.getPreco());
        pst.setBytes(6, flyers.getArquivo());
        pst.setInt(7, flyers.getIdFlyers());
        pst.execute();
    } 
    public void excluir(Flyers flyers) throws Exception {
     PreparedStatement pst;
     String sql = "DELETE FROM flyers WHERE idFlyers=?";
     pst = conn.prepareStatement(sql);
     pst.setInt(1, flyers.getIdFlyers());
     pst.execute();
    }
    public ArrayList<Flyers> listar() throws Exception {
        ArrayList<Flyers> lista = new ArrayList<Flyers>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM flyers";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Flyers f = new Flyers();
            f.setIdFlyers(rs.getInt("idFlyers"));
            f.setNome(rs.getString("nome"));
            f.setTipo(rs.getString("tipo"));
            f.setImagem(rs.getBytes("imagem"));
            f.setPreco(rs.getDouble("preco"));
            f.setDescricao(rs.getString("descricao"));           
            lista.add(f);
        }

        return lista;
    }
    public Flyers obterFlyerPorId(int idFlyer) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        Flyers flyer = null;

        String sql = "SELECT * FROM Flyers WHERE idFlyers = ?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idFlyer);
        rs = pst.executeQuery();

        if (rs.next()) {
            flyer = new Flyers();
            flyer.setIdFlyers(rs.getInt("idFlyers"));
            flyer.setNome(rs.getString("nome"));
            flyer.setTipo(rs.getString("tipo"));
            flyer.setImagem(rs.getBytes("imagem"));
            flyer.setArquivo(rs.getBytes("arquivo"));
            flyer.setDescricao(rs.getString("descricao"));
            flyer.setPreco(rs.getDouble("preco"));
            // Defina outros atributos, se necessário
        }

        return flyer;
    }  
}
