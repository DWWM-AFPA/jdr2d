package Jdr_2D_Simple;

import java.util.ArrayList;

public class Personnage extends Position {
    //Menmbres
    protected String nomPesonnage;
    protected int xpPersonnage;
    protected int pvPersonnage;
    protected int monnaiePersonnage;
    protected boolean vivantPersonnage;
    protected ArrayList<Objet> inventairePersonnage;
    protected ArrayList<Objet> etatPersonnage;

    protected enum EMPLACEMENTBIJOUX{COUP, MAIN_DROITE, MAIN_GAUCHE};
    protected  enum emplacementPersonnage{TETE, TORSE, MAIN, PIED, EMPLACEMENTBIJOUX};

    //Getter et Setter
    public String getNomPesonnage() {
        return nomPesonnage;
    }

    public Personnage setNomPesonnage(String nomPesonnage) {
        this.nomPesonnage = nomPesonnage;
        return this;
    }

    public int getXpPersonnage() {
        return xpPersonnage;
    }

    public Personnage setXpPersonnage(int xpPersonnage) {
        this.xpPersonnage = xpPersonnage;
        return this;
    }

    public int getPvPersonnage() {
        return pvPersonnage;
    }

    public Personnage setPvPersonnage(int pvPersonnage) {
        this.pvPersonnage = pvPersonnage;
        return this;
    }

    public int getMonnaiePersonnage() {
        return monnaiePersonnage;
    }

    public Personnage setMonnaiePersonnage(int monnaiePersonnage) {
        this.monnaiePersonnage = monnaiePersonnage;
        return this;
    }

    public boolean getVivantPersonnage() {
        return vivantPersonnage;
    }

    public Personnage setVivantPersonnage(boolean vivantPersonnage) {
        this.vivantPersonnage = vivantPersonnage;
        return this;
    }

    public ArrayList<Objet> getInventairePersonnage() {
        return inventairePersonnage;
    }

    public Personnage setInventairePersonnage(ArrayList<Objet> inventairePersonnage) {
        this.inventairePersonnage = inventairePersonnage;
        return this;
    }

    public ArrayList<Objet> getEtatPersonnage() {
        return etatPersonnage;
    }

    public Personnage setEtatPersonnage(ArrayList<Objet> etatPersonnage) {
        this.etatPersonnage = etatPersonnage;
        return this;
    }

    public Personnage(String nomPesonnage, int xpPersonnage, int pvPersonnage, int monnaiePersonnage, boolean vivantPersonnage, ArrayList<Objet> inventairePersonnage, ArrayList<Objet> etatPersonnage, int xPosition, int yPosition) {
        super(xPosition, yPosition);
        this.nomPesonnage = nomPesonnage;
        this.xpPersonnage = xpPersonnage;
        this.pvPersonnage = pvPersonnage;
        this.monnaiePersonnage = monnaiePersonnage;
        this.vivantPersonnage = vivantPersonnage;
        this.inventairePersonnage = new ArrayList<>();
        this.etatPersonnage = new ArrayList<>();
    }

    public void AjoutsObjetsEmplacements(){

    }

}
