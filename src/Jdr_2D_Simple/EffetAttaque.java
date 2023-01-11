package Jdr_2D_Simple;

public class EffetAttaque extends Objet{

    protected int degat;
    protected int duree;

    public int getDegat(){
        return degat;
    }

    public EffetAttaque setDegat( int degat){
        this.degat = degat;
        return this;
    }

    public int getDuree(){
        return duree;
    }

    public EffetAttaque setDuree(int duree){
        this.duree = duree;
        return this;
    }

    public EffetAttaque(String nomObjet, int prixObjet, int quantiteObjet, int poidsObjet, boolean recompenseObjet, boolean queteObjet, int degat, int duree, int xPosition, int yPosition) {
        super(nomObjet, prixObjet, quantiteObjet, poidsObjet, recompenseObjet, queteObjet, xPosition, yPosition);
        this.degat = degat;
        this.duree = duree;
    }
}
