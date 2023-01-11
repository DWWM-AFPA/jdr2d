package Jdr_2D_Simple;

public class Compte_Utilisateur {
    //Membres
    protected String pseudo;
    protected String courriel;
    protected String motPasseCompte;
    protected boolean valide;

    public String getPseudo(){
        return pseudo;
    }

    public Compte_Utilisateur setPseudo(String pseudo){
        this.pseudo = pseudo;
        return this;
    }

    public String getCourriel(){
        return courriel;
    }

    public Compte_Utilisateur setCourriel(String courriel){
        this.courriel = courriel;
        return this;
    }

    public String getMotPasseCompte(){
        return motPasseCompte;
    }

    public boolean getValide(){
        return valide;
    }

    public Compte_Utilisateur setValide(boolean valide){
        this.valide = valide;
        return this;
    }

}
