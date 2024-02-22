
package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author Flávio
 */
public class PerfilDAO extends DataBaseDAO{
    
    public PerfilDAO() throws Exception {
    }

    public void excluir(Perfil perfil) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM perfil WHERE idPerfil=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, perfil.getIdPerfil());
        pst.execute();
    }
    
    public ArrayList<Perfil> listar() throws Exception {
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM perfil";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Perfil p = new Perfil();
            p.setIdPerfil(rs.getInt("idPerfil"));
            p.setPerfil(rs.getString("perfil"));
            lista.add(p);
        }

        return lista;
    }
    public void inserir(Perfil perfil) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO perfil (perfil) VALUES(?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, perfil.getPerfil());
        pst.execute();
    }
    public Perfil consultar(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM perfil WHERE idPerfil=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Perfil p = new Perfil();
        if (rs.next()) {
            p.setIdPerfil(rs.getInt("idPerfil"));
            p.setPerfil(rs.getString("perfil"));
        }
        return p;
    } 
    public void alterar(Perfil perfil) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE perfil SET perfil=? WHERE idPerfil=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, perfil.getPerfil());
        pst.setInt(2, perfil.getIdPerfil());
        pst.execute();
    }
    public void vincularMenu(int idPerfil, int idMenu) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT IGNORE INTO perfil_menu (idPerfil, idMenu) VALUES (?, ?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idPerfil);
        pst.setInt(2, idMenu);
        pst.execute();
    } 
    public void desvincularMenu(int id_menu, int id_perfil) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM perfil_menu WHERE idPerfil=? AND idMenu=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id_perfil);
        pst.setInt(2, id_menu);
        pst.execute();
    }
   
    public ArrayList<Menu> menusVinculados(int id_perfil) throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu WHERE idMenu IN(SELECT idMenu FROM perfil_menu WHERE idPerfil=?)";
        pst = conn.prepareStatement(sql);

        pst.setInt(1, id_perfil);

        rs = pst.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setIdMenu(rs.getInt("idMenu"));
            m.setMenu(rs.getString("menu"));
            m.setLink(rs.getString("link"));
            lista.add(m);
        }

        return lista;
    }
    public ArrayList<Menu> menusDesvinculados(int id_perfil) throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu WHERE idMenu NOT IN(SELECT idMenu FROM perfil_menu WHERE idPerfil=?)";
        pst = conn.prepareStatement(sql);

        pst.setInt(1, id_perfil);

        rs = pst.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setIdMenu(rs.getInt("idMenu"));
            m.setMenu(rs.getString("menu"));
            m.setLink(rs.getString("link"));
            lista.add(m);
        }

        return lista;
    }    
    
}
