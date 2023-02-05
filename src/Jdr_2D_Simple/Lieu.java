package Jdr_2D_Simple;

import java.util.ArrayList;

public class Lieu extends Point implements Visitable {

    private String nomLieu;
    private String descriptionLieu;
    private  int xTaille;
    private  int yTaille;

    //private Dessiner dessiner;

    private ArrayList<Personnage> personnages;

    @Override
    public int getxPosition() {
        return xPosition;
    }

    @Override
    public Lieu setxPosition(int xPosition) {
        this.xPosition = xPosition;
        return this;
    }

    @Override
    public int getyPosition() {
        return yPosition;
    }

    @Override
    public Lieu setyPosition(int yPosition) {
        this.yPosition = yPosition;
        return this;
    }

    public String getNomLieu() {
        return nomLieu;
    }

    public Lieu setNomLieu(String nomLieu) {
        this.nomLieu = nomLieu;
        return this;
    }

    public int getxTaille() {
        return xTaille;
    }

    public Lieu setxTaille(int xTaille) {
        this.xTaille = xTaille;
        return this;
    }

    public int getyTaille() {
        return yTaille;
    }

    public Lieu setyTaille(int yTaille) {
        this.yTaille = yTaille;
        return this;
    }

    public Lieu(String nomLieu, int xTaille, int yTaille, int xPosition, int yPosition) {
        super(xPosition, yPosition);
        this.xTaille = xTaille;
        this.yTaille = yTaille;
        this.nomLieu = nomLieu;
    }

    public Lieu(String nomLieu, int xPosition, int yPosition, int Taille, int yTaille, Personnage personnages) {
    super(xPosition, yPosition);
    }

    public Object accept(Visitor v){
        return v.visit(this);
    }

}
