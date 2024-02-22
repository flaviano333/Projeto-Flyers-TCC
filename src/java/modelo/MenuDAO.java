/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Flávio
 */
public class MenuDAO extends DataBaseDAO {

    public MenuDAO() throws Exception {
    }
    public void excluir(Menu m) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM menu WHERE idMenu=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, m.getIdMenu());
        pst.execute();
    }

    public ArrayList<Menu> listar() throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu";
        pst = conn.prepareStatement(sql);
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

    public int inserir(Menu m) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT IGNORE INTO menu (menu, link) VALUES (?, ?)";
        pst = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, m.getMenu());
        pst.setString(2, m.getLink());
        pst.executeUpdate();

        // Obtém as chaves geradas
        ResultSet generatedKeys = pst.getGeneratedKeys();

        // Verifica se há chaves geradas e retorna o ID (ou -1 se não houver)
        if (generatedKeys.next()) {
            return generatedKeys.getInt(1);
        } else {
            return -1;
        }
    }

    public Menu carregaPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu WHERE idMenu=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Menu m = new Menu();
        if (rs.next()) {
            m.setIdMenu(rs.getInt("id"));
            m.setMenu(rs.getString("menu"));
            m.setLink(rs.getString("link"));
        }
        return m;
    }
    public Menu Consultar(String menu) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu WHERE Menu=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, menu);
        rs = pst.executeQuery();
        Menu m = new Menu();
        if (rs.next()) {
            m.setIdMenu(rs.getInt("idMenu"));
            m.setMenu(rs.getString("Menu"));
            m.setLink(rs.getString("Link"));
        }

        return m;
    }
    public Menu ConsultarId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu WHERE idMenu=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Menu m = new Menu();
        if (rs.next()) {
            m.setIdMenu(rs.getInt("idMenu"));
            m.setMenu(rs.getString("Menu"));
            m.setLink(rs.getString("Link"));
        }

        return m;
    }    
    public void alterar(Menu m) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE menu SET menu=?, link=? WHERE idMenu=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, m.getMenu());
        pst.setString(2, m.getLink());
        pst.setInt(3, m.getIdMenu());
        pst.execute();
    }
}