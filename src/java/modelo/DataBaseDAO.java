package modelo;

//@author Flávio

//Importação das bibliotecas de conexão com o Banco de Dados
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseDAO {
    //Driver JDBC
    public static  final String DRIVER = "com.mysql.jdbc.Driver";
    //URL de conexao com o banco
    public static  final String URL = "jdbc:mysql://localhost:3306/projetoflyers";
    //Usuario do banco
    private static  final String DB_USER = "root";
    //Senha do banco
    private static  final String DB_SENHA = "";
    //Objeto de conexao
    protected Connection conn;

    //Inicializa uma instância do DAO
    public DataBaseDAO() throws Exception {
        //Tenta carregar o Driver
        Class.forName(DRIVER);
    }
    //Obtem a conexao via JDBC
    public void conectar() throws SQLException{
        conn = DriverManager.getConnection(URL, DB_USER, DB_SENHA);
    }
    //Fecha a conexao
    public void desconectar() throws SQLException {
        //verifica se esta conectado
        if(conn != null){
            conn.close();
        }else{
            //Se a conexao ja estiver fechada envia msg de erro
            throw new SQLException("A conexao ja esta fechada!");
        }
    }    
    
}
