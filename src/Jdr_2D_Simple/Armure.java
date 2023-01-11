package Jdr_2D_Simple;

import java.util.ArrayList;

public class Armure extends EffetProtection{

   protected ArrayList<EffetProtection> effet;

   public ArrayList<EffetProtection> getEffet(){
       return effet;
   }

   public void setEffet(ArrayList<EffetProtection> effet){
       this.effet = effet;
   }

   public Armure(Objet o, EffetProtection e){
       super(o.nomObjet, o.prixObjet, o.quantiteObjet, o.poidsObjet, o.recompenseObjet, o.queteObjet, e.defense, e.duree, o.xPosition, o.yPosition);
       this.effet = new ArrayList<>();
       this.add(e);
   }

   public Armure add(EffetProtection e){
       this.effet.add(e);
       return this;
   }
}
