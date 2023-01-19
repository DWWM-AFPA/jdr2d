import org.postgresql.util.PSQLException;

import javax.swing.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Properties;
import java.util.Scanner;

public class Database {

    private static final String con = "jdbc:postgresql://10.113.28.39:5432/jdr2d_matthieu";
    private static final String user = "mballand";
    private static final String pswd = "Azerty123";




    public static void connect(String fileName) throws FileNotFoundException, IOException,SQLException {
        Properties prop = new Properties();
        try {
            prop.load(new FileInputStream(fileName));
        } catch (FileNotFoundException e) {
            File config = new File(fileName);
            PrintStream file= new PrintStream(config);
            Scanner scan = new Scanner(System.in);
            System.out.println("Entrez l'adresse IP du serveur :");
            file.print("connection=jdbc:postgresql://"+scan.nextLine()+":5432/");
            System.out.println("Entrez le nom de la base de donnée :");
            file.println(scan.nextLine());
            System.out.println("Entrez le nom d'utilisateur :");
            file.println("user="+scan.nextLine());
            System.out.println("Entrez le mot de passe :");
            file.println("password="+scan.nextLine());
            prop.load(new FileInputStream(fileName));
        }
        Connection conn = DriverManager.getConnection(prop.getProperty("connection"),prop);
        Statement st;
        conn.close();
    }

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

    protected static void title(String title){
        String lineSeparator = " ".repeat(80);
        System.out.println(lineSeparator);
        System.out.print("  ");
        System.out.println(title);
        System.out.println(lineSeparator);
    }

    protected static ArrayList<Object> listOfAll(String title, String sql, Statement st) throws SQLException{
        ResultSet rs = st.executeQuery(sql);
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();
        // rsmd.getColumnClassName();
        title(title);
        ArrayList<Object> retour = new ArrayList<>();


        while (rs.next()) {
            String[] result = new String[columnCount];
            for (int i = 1; i < columnCount; i++) {
                result[i]=rs.getString(i);
            }
            retour.add(result);
        }

        rs.close();
        return retour;
    }
}
