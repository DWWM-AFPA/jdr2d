package Jdr_2D_Simple;

import java.util.ArrayList;

public class Monde implements Visitable{
    //Menmbres
    protected int xPosition;
    protected int yPosition;
    protected int xTaille;
    protected int yTaille;
    protected char[][] monde;
    protected Dessiner dessinerMonde;
    protected ArrayList<Lieu> lieux;


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

    public char[][] getMonde(){
        return monde;
    }

    public Monde setMonde(char[][] monde){
        this.monde = monde;
        return this;
    }

    public Dessiner getDessinerMonde(){
        return dessinerMonde;
    }

    public Monde setDessinerMonde(Dessiner dessinerMonde){
        this.dessinerMonde = dessinerMonde;
        return this;
    }

    public ArrayList<Lieu> getLieux(){
        return lieux;
    }

    public Monde setLieux(ArrayList<Lieu> lieux){
        this.lieux = lieux;
        return this;
    }

    public Monde(){
        this.setxPosition(1);
        this.setyPosition(1);
    }

    public Monde(int xTaille, int yTaille, int xPosition, int yPosition){
        this.xPosition = xPosition;
        this.yPosition = yPosition;
        this.xTaille = xTaille;
        this.yTaille = yTaille;
    }

    public Monde(int xTaille, int yTaille, int xPosition, int yPosition, Lieu l){
        this.xPosition = xPosition;
        this.yPosition = yPosition;
        this.xTaille = xTaille;
        this.yTaille = yTaille;
        this.lieux = new ArrayList<>();
        this.add(l);
    }

    public Monde add(Lieu l){
        this.lieux.add(l);
        return this;
    }

    public Object accept(Visitor v){
        return v.visit(this);
    }
}
