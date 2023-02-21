package DAO;

import Entity.Player;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;

public class PlayerRepository extends DAOObject{

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

    public Player find(int id) throws Exception{
        try {
            ResultSet rs= this.query("SELECT * FROM player WHERE \"Id\" = ?;",new ArrayList<Object>(Arrays.asList(2)));
            rs.next();
            Player joueur = new Player(
                    rs.getString("Name"),
                    rs.getString("Email"),
                    rs.getString("Password"),
                    null);


            this.closeConnection();
            return joueur;

        }catch (Exception e){
            throw e;
        }
    }

}
