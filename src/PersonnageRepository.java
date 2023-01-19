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
                ResultSet rs= this.query("SELECT * FROM personnage\n" +
                        "    JOIN lieu ON personnage.id_lieu=lieu.id_lieu\n" +
                        "    JOIN positionne_test ON positionne_test.id_personnage= personnage.id_personnage WHERE personnage.id_personnage = ?;",new ArrayList<Object>(Arrays.asList(2)));
                rs.next();
                System.out.println(rs.getString("nom_personnage"));
                Personnage joueur = new Personnage(
                        //recupere la carte
                        CarteRegistre.getInstance().getCarte(rs.getString("nom_lieu")),
                        //recupere la position
                        rs.getString("position"),
                        //recupere le nom
                        rs.getString("nom_personnage"),

                        100,//pv
                        100);//dps)

                this.closeConnection();
                return null;

            }catch (Exception e){
                throw e;
            }
        }

    }



