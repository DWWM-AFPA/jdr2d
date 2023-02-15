package DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;



    public class PersonnageRepository extends DAOObject{

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

        public Personnage find(int id) throws Exception{
            try {
                ResultSet rs= this.query(
                        "SELECT * FROM personnage\n" +
                                "JOIN lieu ON personnage.id_lieu=lieu.id_lieu\n" +
                            "WHERE personnage.id_personnage = ?;",new ArrayList<Object>(Arrays.asList(2)));
                rs.next();
                System.out.println("Instance carte : "+ CarteRegistre.getInstance().getCarte(rs.getString("nom_lieu")));
                System.out.println("nom du lieu trouvé dans la DB :"+rs.getString("nom_lieu"));
                System.out.println("nom du perso trouvé dans la DB :"+rs.getString("nom_personnage") + rs.getInt("id_lieu"));
                Carte carte= CarteRegistre.getInstance().getCarte(rs.getString("nom_lieu"));
                if (carte==null){
                    carte = new CarteRepository().find(rs.getInt("id_lieu"));
                }


                Personnage joueur = new Personnage(
                        //recupere la carte
                        carte,
                        //recupere la position
                        rs.getString("position"),
                        //recupere le nom
                        rs.getString("nom_personnage"),

                        100,//pv
                        100);//dps)

                this.closeConnection();
                return joueur;

            }catch (Exception e){
                throw e;
            }
        }

    }



