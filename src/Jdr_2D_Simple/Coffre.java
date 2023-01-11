package Jdr_2D_Simple;

import java.util.ArrayList;

public class Coffre extends Objet{
    //Membres
    protected ArrayList<Objet> objets;

    public ArrayList<Objet> getObjets(){
        return objets;
    }

    public Coffre setObjets(ArrayList<Objet> objets){
        this.objets = objets;
        return this;
    }

    //Constructeur
    public Coffre(String nomObjet, int prixObjet, int quantiteObjet, int poidsObjet, boolean recompenseObjet, boolean queteObjet, int xPosition, int yPosition){
        super(nomObjet, prixObjet, quantiteObjet, poidsObjet, recompenseObjet, queteObjet, xPosition, yPosition);
        this.objets = new ArrayList<Objet>();

    }

    public Coffre(Objet o){
        super(o.nomObjet, o.prixObjet, o.quantiteObjet, o.poidsObjet, o.recompenseObjet, o.queteObjet, o.xPosition, o.yPosition);
        this.objets = new ArrayList<>();
        this.add(o);
    }

    public Coffre add(Objet o ){
        this.objets.add(o);
        return this;
    }

    public Coffre remove(Objet o){
        this.objets.remove(o);
        return this;
    }

    public Coffre remove(int index){
        this.objets.remove(index);
        return this;
    }
}
