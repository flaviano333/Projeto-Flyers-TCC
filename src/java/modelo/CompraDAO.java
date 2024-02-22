package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Flávio
 */
public class CompraDAO extends DataBaseDAO{
    
    public CompraDAO() throws Exception {} 
    public ArrayList<Compra> carregaPorUsuario(int idUsuario) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM compra WHERE Usuario_Id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idUsuario);
        rs = pst.executeQuery();
        
        ArrayList<Compra> compras = new ArrayList<>();
        FlyersDAO flyersDAO = new FlyersDAO();
        
        while (rs.next()) {
            Compra c = new Compra();
            c.setIdCompra(rs.getInt("idCompra"));
            c.setStatus(rs.getString("Status"));
            c.setData(rs.getDate("Data"));
            c.setValorFinal(rs.getDouble("valorFinal"));
            flyersDAO.conectar();
            Flyers flyer = flyersDAO.obterFlyerPorId(rs.getInt("Flyers_Id"));
            flyersDAO.desconectar();
            c.setFlyers(flyer);
            compras.add(c);
        }
        
        return compras;
    } 
     public ArrayList<Compra> listar() throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM compra";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        
        ArrayList<Compra> compras = new ArrayList<>();
        FlyersDAO flyersDAO = new FlyersDAO();
        
        while (rs.next()) {
            Compra c = new Compra();
            c.setIdCompra(rs.getInt("idCompra"));
            UsuarioDAO uDB = new UsuarioDAO();
            uDB.conectar();
            Usuario u1 = uDB.Consultar(rs.getInt("usuario_id"));
            uDB.desconectar();
            Usuario u = new Usuario();
            u.setNome(u1.getNome());
            u.setId(u1.getId());
            c.setUsuario(u);
            c.setStatus(rs.getString("Status"));
            c.setData(rs.getDate("Data"));
            c.setValorFinal(rs.getDouble("valorFinal"));
            flyersDAO.conectar();
            Flyers flyer = flyersDAO.obterFlyerPorId(rs.getInt("Flyers_Id"));
            flyersDAO.desconectar();
            c.setFlyers(flyer);
            compras.add(c);
        }
        
        return compras;
    }   
    public void AdicionarCarrinho(Compra compra) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO Compra (Data,Status,ValorFinal,Usuario_id, Flyers_Id) VALUES(?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setDate(1, (Date) compra.getData());
        pst.setString(2, compra.getStatus());
        pst.setDouble(3, compra.getValorFinal());
        pst.setInt(4, compra.getUsuario().getId());   
        pst.setInt(5, compra.getFlyers().getIdFlyers());
        pst.execute();    
    }
    
   public void AlterarCarrinho(Compra compra) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE Compra SET Status=? WHERE idCompra=?";
        pst = conn.prepareStatement(sql);

        pst.setString(1, compra.getStatus());

        pst.setInt(2, compra.getIdCompra());
        pst.execute();
    }      
   public void ExcluirCompra(Compra compra) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM compra WHERE idCompra=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, compra.getIdCompra());
        pst.execute();
    }   
    
}
