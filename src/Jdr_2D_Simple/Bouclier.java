package Jdr_2D_Simple;

public class Bouclier {


    public Object accept(Visitor v){
        return v.visit(this);
    }
}
