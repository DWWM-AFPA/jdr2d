import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Properties;

public class DAOObject {

    private String fileName= "DB_Config";
    private Properties config =null;
    private Connection conn = null;
    public void closeConnection(){
        try {
            this.conn.close();
        } catch (SQLException e){
            System.err.println("connection impossible à terminer" +e);
        }
    }

/*    public DAOObject(String sql) {
        this.fileName= "DB_Config";
        config=loadConfig();
        try {
            query(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public DAOObject(String sql,ArrayList<Object> args) {
        this.fileName= "DB_Config";
        config=loadConfig();
        try {
            query(sql,args);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/

    protected Properties loadConfig(){
        Properties prop= new Properties();

        try(FileInputStream fis = new FileInputStream(fileName)){
            prop.load(fis);
        } catch (FileNotFoundException e){
            System.err.println(fileName+"not found.");
            System.exit(-1);
        } catch (IOException e) {
            System.err.println("Unknown IOException");
            System.err.println(e);
            System.exit(-2);
        }
        this.fileName = fileName;
        return prop;
    }

    public Connection getConnection()throws SQLException {
        config=loadConfig();
        conn = DriverManager.getConnection(config.getProperty("connection"),config);
        return conn;
    }

    public Statement createStatement() throws SQLException{
        return getConnection().createStatement();
    }
    public PreparedStatement createPreparedStatement(String sql) throws SQLException{
        return getConnection().prepareStatement(sql);
    }
    public ResultSet query(String sql) throws SQLException{
        return createStatement().executeQuery(sql);
    }
    public ResultSet query(String sql, ArrayList<Object> args) throws SQLException{
        PreparedStatement pst = this.createPreparedStatement(sql);
        this.bindValues(pst,args);

        return pst.executeQuery();
    }

    protected  void bindValues(PreparedStatement pst,ArrayList<Object> args) throws SQLException{
        for (int i = 0; i < args.size(); i++) {
            String type= args.get(i).getClass().getSimpleName();
           // System.out.println(type);
           // System.out.println(i);
            switch (type) {
                case ("Integer"):
                    pst.setInt(i + 1, (int) args.get(i));
                    break;
                case ("String"):
                default:
                    pst.setString(i + 1, (String) args.get(i));
                    break;
            }
        }


    }

}
