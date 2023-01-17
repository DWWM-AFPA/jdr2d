package Jdr_2D_Simple;

import java.util.ArrayList;

public class Monde implements Visitable{
    //Menmbres
    protected int xPosition;
    protected int yPosition;
    protected  int xTaille;
    protected int yTaille;
    protected char[][] monde;
    protected ArrayList<Lieu> lieu;


    //Getter et Setter
    public int getxPosition(){
        return xPosition;
    }

    public Monde setxPosition(int xPosition){
        this.xPosition = xPosition;
        return this;
    }

    public int getyPosition(){
        return yPosition;
    }

    public Monde setyPosition(int yPosition){
        this.yPosition = yPosition;
        return this;
    }

    public int getxTaille(){
        return xTaille;
    }

    public Monde setxTaille(int xTaille){
        this.xTaille = xTaille;
        return this;
    }

    public int getyTaille(){
        return yTaille;
    }

    public Monde setyTaille(int yTaille){
        this.yTaille = yTaille;
        return this;
    }

    public Monde(){
        this.setxPosition(1);
        this.setyPosition(1);
    }
    public Monde(int xTaille, int yTaille){
        this.setxPosition(xPosition);
        this.setyPosition(yPosition);
        this.xTaille = xTaille;
        this.yTaille = yTaille;
        this.monde = generationCarte(xTaille, yTaille);
    }

    public char[][] generationCarte(int xTaille, int yTaille){
        int i, j;
        char[][] retour = new char[xTaille][yTaille];

        for(i = 0; i < getyTaille(); i++){
            for(j = 0; j < getxTaille(); j++){
                retour[j][i] += ' ';
            }
        }
        return retour;
    }

    public Object accept(Visitor v){
        return v.visit(this);
    }
}
