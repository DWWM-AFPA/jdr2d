package Jdr_2D_Simple;

public interface Visitor {

    Object visit(Monde m);
    Object visit(Lieu l);
    Object visit(Personnage m);
    Object visit(Objet m);
    Object visit(Arme m);
    Object visit(Armure m);
    Object visit(Bouclier m);
    Object visit(Materiel m);
}
