package modelo;

import java.sql.Timestamp;

/**
 * @author Flávio
 * Classe Modelo para manipulação dos dados de Conversa
 */
public class Conversa {
/**
 * Declaração das variaveis
 */  
    private int id;
    private String mensagem;
    private byte[] imagemArquivo;
    private int destinatarioId;
    private Timestamp data;
    private Usuario usuario;
    
    public Conversa(){}
    
/**
 * Encapsulamento das variaveis
 */ 
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public byte[] getImagemArquivo() {
        return imagemArquivo;
    }

    public void setImagemArquivo(byte[] imagemArquivo) {
        this.imagemArquivo = imagemArquivo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    /**
     * @return the destinatarioId
     */
    public int getDestinatarioId() {
        return destinatarioId;
    }

    /**
     * @param destinatarioId the destinatarioId to set
     */
    public void setDestinatarioId(int destinatarioId) {
        this.destinatarioId = destinatarioId;
    }
    
    public Conversa(int id, String mensagem, byte[] imagemArquivo, Usuario usuario, int destinatarioId, Timestamp data){
        this.id = id;
        this.mensagem = mensagem;
        this.imagemArquivo = imagemArquivo;
        this.usuario = usuario;
        this.destinatarioId = destinatarioId;
        this.data = data;
    } 

    public Timestamp getData() {
        return data;
    }

    public void setData(Timestamp data) {
        this.data = data;
    }
    
}
