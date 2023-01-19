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
                        "    JOIN positionne_test ON positionne_test.id_personnage= personnage.id_personnage ; WHERE \"Id\" = ?;",new ArrayList<Object>(Arrays.asList(2)));
                rs.next();
               /* Personnage joueur = new Personnage(
                        rs.getInt("id_lieu"),
                        rs.getString("position"),
                        rs.getString("nom_personnage"),
                        null);*/

                this.closeConnection();
                return null;

            }catch (Exception e){
                throw e;
            }
        }

    }



