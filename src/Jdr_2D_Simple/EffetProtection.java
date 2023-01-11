package Jdr_2D_Simple;

public class EffetProtection extends Objet{

    protected int defense;
    protected int duree;

    public int getDefense(){
        return defense;
    }

    public EffetProtection setDefense(int defense){
        this.defense = defense;
        return this;
    }

    public int getDuree(){
        return duree;
    }

    public EffetProtection setDuree(int duree){
        this.duree = duree;
        return this;
    }

    public EffetProtection(String nomObjet, int prixObjet, int quantiteObjet, int poidsObjet, boolean recompenseObjet, boolean queteObjet, int defense, int duree, int xPostion, int yPosition){
        super(nomObjet, prixObjet, quantiteObjet, poidsObjet, recompenseObjet, queteObjet, xPostion, yPosition);
        this.defense = defense;
        this.duree = duree;
    }
}
