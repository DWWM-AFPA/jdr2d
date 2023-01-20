import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class ObjetRepository extends DAOObject {
    public Objet insert(String nom, String Stats,boolean equipe,boolean ouvert,String description,int prix,int type,int poids) throws SQLException {
        try {
            ResultSet rs= this.query("INSERT INTO objet(nom_objet,statistique_objet,equipe,ouvert,description_objet, prix,id_type_objet,poids) VALUES (?,?,?,?,?,?,?,?);",new ArrayList<Object>(Arrays.asList(nom,description,carte)));
            this.closeConnection();
            return new Objet(nom,description,50,50);

        }catch (Exception e){
            throw e;
        }
    }
    public void update(){
        //TODO
        // return
    }
    public void delete(){
        //TODO
        // return
    }

    public Objet find(int id) throws Exception{
        try {
            ResultSet rs= this.query("SELECT * FROM objet WHERE \"id_objet\" = ?;",new ArrayList<Object>(Arrays.asList(id)));
            rs.next();
            Objet objet = new Objet(
                    rs.getString("nom_objet"),
                    rs.getString("statistique_objet"),
                    rs.getBoolean("equipe"),
                    rs.getBoolean("ouvert"),
                    rs.getString("description_objet"),
                    rs.getInt("prix"),
                    rs.getInt("id_type_objet"),
                    rs.getInt("poids"));

            this.closeConnection();
            return objet;

        }catch (Exception e){
            throw e;
        }
    }

}
