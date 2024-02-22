package modelo;

import java.util.ArrayList;

/**
 * @author Flávio
 * Classe Modelo para manipulação dos dados de perfil
 */
public class Perfil {
/**
 * Declaração das variaveis
 */
    private int idPerfil;
    private String perfil;
    ArrayList<Menu> listaVinculados;

    public ArrayList<Menu> getListaVinculados() {
        return listaVinculados;
    }

    public void setListaVinculados(ArrayList<Menu> listaVinculados) {
        this.listaVinculados = listaVinculados;
    }
    
    public Perfil(){}

/**
 * Encapsulamento das variaveis
 */    
    public int getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }
    
    public Perfil(int idPerfil, String perfil){
        this.idPerfil = idPerfil;
        this.perfil = perfil;
    }
    
}
