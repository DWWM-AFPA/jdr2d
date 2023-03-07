package ServerPart;

import Control.ConnexionInput;
import Control.InputType;
import DAO.PersonnageDAO;
import DAO.UtilisateurDAO;
import jdr2dcore.Direction;
import jdr2dcore.Personnage;
import jdr2dcore.Utilisateur;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;

public class Client extends Thread{

    private final Socket socket;

    private boolean connected;

    private ObjectInputStream input;

    private ObjectOutputStream output;
    private Personnage avatar;

    private Utilisateur util;
    private MapState map;


    public Client(Socket socket) throws IOException {
        this.socket=socket;
        connected=true;
        avatar=null;
        util=null;
        input=new ObjectInputStream(socket.getInputStream());
        output=new ObjectOutputStream(socket.getOutputStream());
        start();

    }

    private void connect() throws IOException, ClassNotFoundException {
        String pseudo;
        String mdp;
        ConnexionInput conn=null;
        while (util==null&&conn!=ConnexionInput.QUIT) {
            conn=(ConnexionInput) input.readObject();
            switch (conn) {
                case CONNEXION -> {
                    pseudo = (String) input.readObject();
                    mdp = (String) input.readObject();
                    try {
                        util = UtilisateurDAO.connectcompte(pseudo, mdp);
                        output.writeObject(true);
                    } catch (SQLException e) {
                        if (e instanceof SQLDataException) {
                            output.writeObject(false);
                        }
                    }
                }
                case CREATION -> create();
                case QUIT -> connected=false;
            }
        }

    }

    private void create() throws IOException, ClassNotFoundException {
        String pseudo="";
        String mdp="";
        ConnexionInput conn = null;
        String mail="";
        boolean success = false;
        while (!success) {
            conn = (ConnexionInput) input.readObject();
            switch (conn) {
                case VALIDCHOICE -> {
                    String teste_pseudo;
                    try {
                        teste_pseudo = (String) input.readObject();
                        success = UtilisateurDAO.checkpseudo(teste_pseudo);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    if (success)
                        pseudo = teste_pseudo;
                    output.writeObject(success);
                }
                case CONNEXION -> {
                    connect();
                    return;
                }
                case QUIT -> {
                    connected = false;
                    return;
                }
            }
        }
        success = false;
        while (!success) {
            conn = (ConnexionInput) input.readObject();
            switch (conn) {
                case VALIDCHOICE -> {
                    String teste_mdp;
                    try {
                        teste_mdp = (String) input.readObject();
                        success = UtilisateurDAO.checkmdp(teste_mdp);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    if (success)
                        mdp = teste_mdp;
                    output.writeObject(success);
                }
                case CONNEXION -> {
                    connect();
                    return;
                }
                case QUIT -> {
                    connected = false;
                    return;
                }
            }
        }
        success = false;
        while (!success) {
            conn = (ConnexionInput) input.readObject();
            switch (conn) {
                case VALIDCHOICE -> {
                    String teste_mail;
                    try {
                        teste_mail = (String) input.readObject();
                        success = UtilisateurDAO.checkmail(teste_mail);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    if (success)
                        mail = teste_mail;
                    output.writeObject(success);
                }
                case CONNEXION -> {
                    connect();
                    return;
                }
                case QUIT -> {
                    connected = false;
                    return;
                }
            }
        }
        try {
            UtilisateurDAO.createcompte(pseudo,mdp,mail);
            util=UtilisateurDAO.connectcompte(pseudo,mdp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void pick(){
        try {
            Hashtable<String,Integer> display=UtilisateurDAO.displaypersonnage(util);
            output.writeObject(display);
            ConnexionInput conn= (ConnexionInput) input.readObject();
            switch (conn){
                case PICKCHAR -> {
                    String nomperso= (String) input.readObject();
                    avatar= PersonnageDAO.getchar(display.get(nomperso));
                }
                case CREATION -> createchar();
                case QUIT -> connected=false;
            }
        } catch (SQLException | IOException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private void createchar(){
        String charname="";
        boolean success=false;
        ConnexionInput conn;
        while (!success){
            try {
                conn= (ConnexionInput) input.readObject();

            } catch (IOException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void pickpicture(){

    }

    public void run(){
        //TODO sequence de connection
        ConnexionInput connect;
        try {
            connect = (ConnexionInput) input.readObject();
            switch (connect) {
                case CONNEXION -> connect();

                case CREATION -> create();

                case QUIT -> connected=false;
                }
            } catch (IOException | ClassNotFoundException ex) {
            throw new RuntimeException(ex);
        }
        if(connected){
            try {
                connect=(ConnexionInput) input.readObject();
                switch (connect){
                    case PICKCHAR -> pick();
                    case CREATECHAR -> createchar();
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(connected) {
            MapPool.addClient(this);
            InputType inputType ;
            do {
                try {
                    inputType = (InputType) input.readObject();
                } catch (IOException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                switch (inputType) {
                    case MOUVNORD -> avatar.depl(Direction.NORD);
                    case MOUVWEST -> avatar.depl(Direction.OUEST);
                    case MOUVEAST -> avatar.depl(Direction.EST);
                    case MOUVSOUTH -> avatar.depl(Direction.SUD);
                    case QUIT -> connected=false;
            /*
            case TALK -> break;
            case FIGTH -> break;
            case PICK -> break;
            case QUEST -> break;

            case INVENTAIRE -> break;
            case EQUIP -> break;
            case USE -> break;
            case DROP -> break;
            */
                }
            } while (connected);
        }

    }

    //getters et setters

    public Socket getSocket() {
        return socket;
    }

    public boolean isConnected() {
        return connected;
    }

    public ObjectInputStream getInput() {
        return input;
    }

    public Personnage getAvatar() {
        return avatar;
    }

    public MapState getMap() {
        return map;
    }

    public void setConnected(boolean connected) {
        this.connected = connected;
    }

    public void setInput(ObjectInputStream input) {
        this.input = input;
    }

    public void setAvatar(Personnage avatar) {
        this.avatar = avatar;
    }

    public void setMap(MapState map) {
        this.map = map;
    }
}
