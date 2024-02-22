package modelo;
/**
 * @author Flávio
 * Classe Modelo para manipulação dos dados de Compra
 */

/**
 * Importação da biblioteca que permite a utilização da variavel Date
 */ 
import java.util.Date;

public class Compra {
/**
 * Declaração das variaveis
 */ 
    private int idCompra;
    private Date data;
    private Double valorFinal;
    private Usuario usuario;
    private Flyers flyers;
    private String status;
    
    public Compra(){}

/**
 * Encapsulamento das variaveis
 */     
    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Double getValorFinal() {
        return valorFinal;
    }

    public void setValorFinal(Double valorFinal) {
        this.valorFinal = valorFinal;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public Flyers getFlyers() {
        return flyers;
    }

    public void setFlyers(Flyers flyers) {
        this.flyers = flyers;
    }
    
    public Compra(int idCompra, Date data, Double valorFinal, Usuario usuario,Flyers flyers, String status){
        this.idCompra = idCompra;
        this.data = data;
        this.valorFinal = valorFinal;
        this.usuario = usuario;
        this.flyers = flyers;
    }


}
