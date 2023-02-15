package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class ObjetRepository extends DAOObject {
    public Objet insert(String nom, String Stats, boolean equipe, boolean ouvert, String description, int prix, int type, int poids) throws SQLException {
   /*     try {
            ResultSet rs= this.query("INSERT INTO objet(nom_objet,statistique_objet,equipe,ouvert,description_objet, prix,id_type_objet,poids) VALUES (?,?,?,?,?,?,?,?);",new ArrayList<Object>(Arrays.asList(nom,description,carte)));
            this.closeConnection();
            return new Entity.Objet(nom,description,50,50);

        }catch (Exception e){
            throw e;
        }*/
        //TODO
return null   ;
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
            ResultSet rs= this.query("SELECT * FROM objet " +
                    "JOIN type_objet ON objet.id_type_objet=type_objet=id"+
                    "WHERE \"id_objet\" = ?;",new ArrayList<Object>(Arrays.asList(id)));
            rs.next();
            boolean estPose=rs.getInt("id_personnage")==0;
            if (estPose) {
                Objet objet = new Objet(
                        CarteRegistre.getInstance().getCarte(rs.getString("nom_lieu")),//type Entity.Carte
                        rs.getString("position"),   //type String -pos
                        rs.getString("nom"),        //type String -nom
                        rs.getInt("id_type_objet"), //type TypeObjet    -type
                        rs.getInt("poids"),    //type int - poids
                        0,
                        Objet.TypeEffet.ATTAQUE
                        /* rs.getBoolean("equipe")*/);   //type boolean
                //rs.getBoolean("ouvert"),
                //rs.getString("description_objet"),
                //rs.getInt("prix")
                this.closeConnection();
                return objet;
                }
            else {
                Objet objet = new Objet(
                //Entity.CarteRegistre.getInstance().getCarte(rs.getString("nom_lieu")),//type Entity.Carte
                rs.getString("nom"),        //type String -nom
                rs.getInt("id_type_objet"), //type TypeObjet    -type
                rs.getInt("poids"),    //type int - poids
                0,
                Objet.TypeEffet.ATTAQUE,
                PersonnageRegistre.getInstance().getPersonnage(rs.getString("nom_personnage")));

                /* rs.getBoolean("equipe")*/
                this.closeConnection();
                return objet;
            }



        }catch (Exception e){
            throw e;
        }
    }

}
