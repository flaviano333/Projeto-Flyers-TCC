package modelo;

/**
 * @author Flávio
 * Classe Modelo para manipulação dos dados de Usuario
 */
public class Usuario {
/**
 * Declaração das variaveis
 */
    private int id;
    private String login;
    private String senha;
    private String nome;
    private String cpf;
    private String telefone;
    private String email;
    private boolean status;
    protected Perfil perfil;
    
    public Usuario(){}
    
/**
 * Encapsulamento das variaveis
 */  
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }
    
    public Usuario(String login, String senha, String nome, String cpf, String telefone, String email, boolean status, Perfil perfil, int id){
        this.login = login;
        this.senha = senha;
        this.nome = nome;
        this.cpf = cpf;
        this.telefone = telefone;
        this.email = email;
        this.status = status;
        this.perfil = perfil;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
     
}
