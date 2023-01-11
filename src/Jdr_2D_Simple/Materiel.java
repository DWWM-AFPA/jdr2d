package Jdr_2D_Simple;

import java.util.ArrayList;

public class Materiel {

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

    public Materiel(String nomMateriel, EffetAttaque e){
        this.nomMateriel = nomMateriel;
        this.attaque = new ArrayList<>();
        this.addAttaque(e);
    }

    public Materiel(String nomMateriel, EffetProtection ef){
        this.nomMateriel = nomMateriel;
        this.protection = new ArrayList<>();
        this.addProtection(ef);
    }

    public Materiel addAttaque(EffetAttaque e){
        this.attaque.add(e);
        return this;
    }

    public Materiel addProtection(EffetProtection ef){
        this.protection.add(ef);
        return this;
    }


}
