package modelo;
/**
 * @author Flávio
 * Classe Modelo para manipulação dos dados de Menu
 */
public class Menu {
/**
 * Declaração das variaveis
 */ 
    private int idMenu;
    private String menu;
    private String link;
    
    public Menu(){}

/**
 * Encapsulamento das variaveis
 */       
    public int getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
    public Menu(int idMenu, String menu, String link){
        this.idMenu = idMenu;
        this.menu = menu;
        this.link = link;        
    }
    
}
