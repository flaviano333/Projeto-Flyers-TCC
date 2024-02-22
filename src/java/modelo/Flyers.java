package modelo;

/**
 *Classe Modelo para manipulação dos dados de Flyers
 * @author Flávio
 */
public class Flyers {
/**
 * Declaração das variaveis
 */
    private int idFlyers;
    private String tipo;
    private byte[] imagem;
    private String descricao;
    private Double preco;
    private String nome;
    private byte[] arquivo;
    
    public Flyers(){}

/**
 * Encapsulamento das variaveis
 */     
    public int getIdFlyers() {
        return idFlyers;
    }

    public void setIdFlyers(int idFlyers) {
        this.idFlyers = idFlyers;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public byte[] getArquivo() {
        return arquivo;
    }

    public void setArquivo(byte[] arquivo) {
        this.arquivo = arquivo;
    }
    

    public Flyers(int idFlyers, String tipo, byte[] imagem, Double preco, String nome, byte[] arquivo){
        this.idFlyers = idFlyers;
        this.tipo = tipo;
        this.imagem = imagem;
        this.descricao = descricao;
        this.preco = preco;
        this.nome = nome;
        this.arquivo = arquivo;
    }
    
}
