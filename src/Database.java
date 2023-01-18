import org.postgresql.util.PSQLException;

import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;

public class Database {
    private static final String con = "jdbc:postgresql://10.113.28.39:5432/jdr2d_matthieu";
    private static final String user = "mballand";
    private static final String pswd = "Azerty123";

    public static ArrayList<String> viewTable(String query,int columnIndex) {
        ArrayList<String> retour= new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(con, user, pswd); Statement st = connection.createStatement()) {
            ResultSet rs = st.executeQuery(query);
            while (rs.next())
                retour.add(rs.getString(columnIndex));
            // Properties config =
        } catch (
                SQLException e) {
            System.err.println("Erreur " + e);
        }
        return retour;
    }

    public static void createEntry(String table,String column,String value){
        try(Connection connection = DriverManager.getConnection(con, user, pswd); Statement st = connection.createStatement()) {
            String sql =String.format("INSERT INTO %S (%s) VALUES ('%s')",table,column,value);
            st.executeQuery(sql);
            System.out.println("Requête effectuée : "+sql);


        } catch (SQLException e) {
            System.err.println("Erreur " + e);
        }
    }
    public static void addPlayer(String name,String email,String password){
        try(Connection connection = DriverManager.getConnection(con, user, pswd); Statement st = connection.createStatement()) {
            String sql =String.format("SELECT add_player('%s','%s','%s','%s');",name,email,password,password);
            ResultSet rs =st.executeQuery(sql);
            while (rs.next())
                if(Objects.equals(rs.getString(1), "t"))
                    System.out.println("Requête effectuée : "+sql);
                else
                    System.out.println("Erreur dans l'insertion");


        } catch (SQLException e) {
            System.err.println("Erreur " + e);
        }

    }
}
