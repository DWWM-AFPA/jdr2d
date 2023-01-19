import java.util.ArrayList;

public class Player {
    protected String nom;
    protected String email;
    protected String mdp;
    protected ArrayList<Personnage> playerCharacterList;

    public Player(String nom, String email, String mdp, ArrayList<Personnage> playerCharacterList) {
        this.nom = nom;
        this.email = email;
        this.mdp = mdp;
        this.playerCharacterList = null;
    }

    public String getNom() {
        return nom;
    }

    public Player setNom(String nom) {
        this.nom = nom;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public Player setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getMdp() {
        return mdp;
    }

    public Player setMdp(String mdp) {
        this.mdp = mdp;
        return this;
    }

    public String getPlayerCharacterList() {
        StringBuilder retour= null;
        if (playerCharacterList!=null) {
            for (int i = 0; i < playerCharacterList.size(); i++)
            {
                retour.append(playerCharacterList.get(i));
            }
            return retour.toString(); }
        return null;
    }

    public Player setPlayerCharacterList(ArrayList<Personnage> playerCharacterList) {
        this.playerCharacterList = playerCharacterList;
        return this;
    }

    public String toString(){
        return this.getNom() +" " +this.getEmail() + " " + this.getPlayerCharacterList();
    }
}
