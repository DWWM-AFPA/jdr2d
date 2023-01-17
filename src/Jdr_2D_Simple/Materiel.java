package Jdr_2D_Simple;

import java.util.ArrayList;

public class Materiel extends Objet{

    private ArrayList<EffetProtection> protection;
    private ArrayList<EffetAttaque> attaque;
    private String nomMateriel;

    public ArrayList<EffetProtection> getProtection(){
        return protection;
    }

    public Materiel setProtection(ArrayList<EffetProtection> protection){
        this.protection =protection;
        return this;
    }

    public ArrayList<EffetAttaque> getAttaque(){
        return attaque;
    }

    public Materiel setAttaque(ArrayList<EffetAttaque> attaque){
        this.attaque = attaque;
        return this;
    }

    public String getNomMateriel(){
        return nomMateriel;
    }

    public Materiel setNomMateriel(String nomEffet){
        this.nomMateriel = nomEffet;
        return this;
    }

    public Materiel(String nomObjet, int prixObjet, int quantiteObjet, int poidsObjet, boolean recompenseObjet, boolean queteObjet, int xPosition, int yPosition){
        super(nomObjet, prixObjet, quantiteObjet, poidsObjet, recompenseObjet, queteObjet, xPosition, yPosition);
    }

    public Materiel(String nomObjet, int prixObjet, int quantiteObjet, int poidsObjet, boolean recompenseObjet, boolean queteObjet, int xPosition, int yPosition, EffetAttaque e){
        super(nomObjet, prixObjet, quantiteObjet, poidsObjet, recompenseObjet, queteObjet, xPosition, yPosition);
        this.attaque = new ArrayList<>();
        this.addAttaque(e);
    }

    public Materiel(String nomObjet, int prixObjet, int quantiteObjet, int poidsObjet, boolean recompenseObjet, boolean queteObjet, int xPosition, int yPosition, EffetProtection e){
        super(nomObjet, prixObjet, quantiteObjet, poidsObjet, recompenseObjet, queteObjet, xPosition, yPosition);
        this.attaque = new ArrayList<>();
        this.addProtection(e);
    }

    public Materiel addAttaque(EffetAttaque e){
        this.attaque.add(e);
        return this;
    }

    public Materiel addProtection(EffetProtection ef){
        this.protection.add(ef);
        return this;
    }

    public Object accept(Visitor v){
        return v.visit(this);
    }


}
