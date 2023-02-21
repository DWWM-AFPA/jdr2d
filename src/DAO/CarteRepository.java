package DAO;
import DAO.DAOObject;
import Entity.Carte;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class CarteRepository extends DAOObject {
    public Carte insert(String nom, String description, String carte) throws SQLException {
        try {
            ResultSet rs= this.query("INSERT INTO lieu(nom_lieu,description_lieu,carte_lieu) VALUES (?,?,?);",new ArrayList<Object>(Arrays.asList(nom,description,carte)));
            this.closeConnection();
            return new Carte(nom,description,50,50);

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
