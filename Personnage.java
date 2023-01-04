import java.util.Arrays;

public class Personnage {
    protected String nom;
    protected int x;
    protected int y;
    protected int pv;
    protected int dps;
    protected Objet casque;
    protected Objet torse;
    protected Objet gants;
    protected Objet pantalon;
    protected Objet bottes;
    protected Objet arme;
    protected Carte carte;


    //getters//

    public String getNom() {
        return nom;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public int getPv() {
        return pv;
    }

    public int getDps() {
        return dps;
    }

    public Objet getCasque() {
        return casque;
    }

    public Objet getTorse() {
        return torse;
    }

    public Objet getGants() {
        return gants;
    }

    public Objet getPantalon() {
        return pantalon;
    }

    public Objet getBottes() {
        return bottes;
    }

    public Objet getArme() {
        return arme;
    }

    public Carte getCarte() {
        return carte;
    }
    //setters//

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setX(int x) {
        boolean b = x > 0 && x <= carte.getTaille()[1] ;
        if (b)
        this.x = x;
    }

    public void setY(int y) {
        boolean b = y > 0 && y <= carte.getTaille()[0] ;
        if (b)
        this.y = y;
    }

    public void setPv(int pv) {
        this.pv = pv;
    }

    public void setDps(int dps) {
        this.dps = dps;
    }

    public void setCasque(Objet casque) {
        this.casque = casque;
    }

    public void setTorse(Objet torse) {
        this.torse = torse;
    }

    public void setGants(Objet gants) {
        this.gants = gants;
    }

    public void setPantalon(Objet pantalon) {
        this.pantalon = pantalon;
    }

    public void setBottes(Objet bottes) {
        this.bottes = bottes;
    }

    public void setArme(Objet arme) {
        this.arme = arme;
    }
    public void setCarte(Carte carte) {
        this.carte = carte;
    }

    public Personnage(Carte carte, int x, int y, String nom, int pv, int dps){
        this.setCarte(carte);
        this.carte.addPersonnage(this);
        this.setX(x);
        this.setY(y);
        this.setNom(nom);
        this.setPv(pv);
        this.setDps(dps);

    }
    public Personnage(int x, int y, int pv, int dps){
        this.setX(x);
        this.setY(y);
        this.setPv(pv);
        this.setDps(dps);
    }

    public Personnage equiperPersonnage(Objet objet){
        String TypeObjet=objet.getTypeObjet().toLowerCase();
       if (TypeObjet.equals("casque")) this.setCasque(objet);
       else if (TypeObjet=="torse") this.setTorse(objet);
       else if (TypeObjet=="gant") this.setGants(objet);
       else if (TypeObjet=="pantalon") this.setPantalon(objet);
       else if (TypeObjet=="bottes") this.setBottes(objet);
       else if (TypeObjet=="arme") this.setArme(objet);
       return this;
    }

    public Personnage deplacer(String input){
        System.out.println("Ecrire Z Q S D pour se déplacer "+System.lineSeparator()+ "L pour quitter");
        switch (input.toLowerCase()) {
            case "z" :
                this.setY(this.getY() - 1);
                break;
            case "s" :
            this.setY(this.getY() + 1);
                break;
            case "q" :
                this.setX(this.getX() - 1);
                break;
            case "d":
                this.setX(this.getX() + 1);
                break;
            default :
                System.out.println("Entrée incorrecte");
                break;
        }


        return this;
    }
}
