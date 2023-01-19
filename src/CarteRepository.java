import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;

public class CarteRepository extends DAOObject {
    public void insert(){
        //TODO
        // return
    }
    public void update(){
        //TODO
        // return
    }
    public void delete(){
        //TODO
        // return
    }

    public Carte find(int id) throws Exception{
        try {
            ResultSet rs= this.query("SELECT * FROM lieu WHERE \"id_lieu\" = ?;",new ArrayList<Object>(Arrays.asList(id)));
            rs.next();
            Carte carte = new Carte(
                    rs.getString("nom_lieu"),
                    rs.getString("description_lieu"),
                    50,50);

            this.closeConnection();
            return carte;

        }catch (Exception e){
            throw e;
        }
    }

}
