package Jdr_2D_Simple;

public class Dessiner implements Visitor{

    public Object visit(Monde m){
        int i;
        int j;
        String retour = new String();

        for (i = 0; i < m.getyTaille(); i++){
            for (j = 0; j < m.getxTaille(); j++){
                retour += m.monde[j][i];
            }
            retour += "\n";
        }
        return retour;
    }

    public Object visit(Lieu m){
        return m;
    }

    public Object visit(Objet m){
        return m;
    }

    public Object visit(Arme m){
        return m;
    }

    public Object visit(Armure m){
        return m;
    }

    public Object visit(Bouclier m){
        return m;
    }

    public Object visit(Materiel m){
        return m;
    }

    public Object visit(Personnage m){
        return m;
    }
}
