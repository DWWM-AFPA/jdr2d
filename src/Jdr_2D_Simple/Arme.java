package Jdr_2D_Simple;

import java.util.ArrayList;

public class Arme extends Objet {

    protected ArrayList<EffetAttaque> effet;

    public ArrayList<EffetAttaque> getEffet(){
        return effet;
    }

    public Arme setEffet(ArrayList<EffetAttaque> effet){
        this.effet = effet;
        return this;
    }

    public Arme(String nomObjet, int prixObjet, int quantiteObjet, int poidsObjet, boolean recompenseObjet, boolean queteObjet, int xPosition, int yPosition) {
        super(nomObjet, prixObjet, quantiteObjet, poidsObjet, recompenseObjet, queteObjet, xPosition, yPosition);
    }

    public Arme(Objet o, EffetAttaque e) {
        super(o.nomObjet, o.prixObjet, o.quantiteObjet, o.poidsObjet, o.recompenseObjet, o.queteObjet, o.xPosition, o.yPosition);
        this.effet = new ArrayList<>();
        this.add(e);
    }

    public Arme add(EffetAttaque e) {
        this.effet.add(e);
        return this;
    }

    public Object accept(Visitor v){
        return v.visit(this);
    }


}
