package Jdr_2D_Simple;

import java.util.ArrayList;

public class Armure extends Objet{

   protected ArrayList<EffetProtection> effet;

   public ArrayList<EffetProtection> getEffet(){
       return effet;
   }

   public void setEffet(ArrayList<EffetProtection> effet){
       this.effet = effet;
   }

    public Armure(String nomObjet, int prixObjet, int quantiteObjet, int poidsObjet, boolean recompenseObjet, boolean queteObjet, int xPosition, int yPosition){
        super(nomObjet, prixObjet, quantiteObjet, poidsObjet, recompenseObjet, queteObjet, xPosition, yPosition);
    }
   public Armure(Objet o, EffetProtection e){
       super(o.nomObjet, o.prixObjet, o.quantiteObjet, o.poidsObjet, o.recompenseObjet, o.queteObjet, o.xPosition, o.yPosition);
       this.effet = new ArrayList<>();
       this.add(e);
   }

   public Armure add(EffetProtection e){
       this.effet.add(e);
       return this;
   }

   public Object accept(Visitor v){
       return v.visit(this);
   }
}
