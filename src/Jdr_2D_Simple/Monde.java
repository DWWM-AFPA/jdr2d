package Jdr_2D_Simple;

import java.util.ArrayList;

public class Monde extends Point implements Visitable {
    //Menmbres
    protected int xTaille;
    protected int yTaille;
    protected ArrayList<Lieu> arrayLieux;

    //Getter et Setter
    @Override
    public int getxPosition() {
        return xPosition;
    }

    @Override
    public Monde setxPosition(int xPosition) {
        this.xPosition = xPosition;
        return this;
    }

    @Override
    public int getyPosition() {
        return yPosition;
    }

    @Override
    public Monde setyPosition(int yPosition) {
        this.yPosition = yPosition;
        return this;
    }

    public int getxTaille() {
        return xTaille;
    }

    public Monde setxTaille(int xTaille) {
        this.xTaille = xTaille;
        return this;
    }

    public int getyTaille() {
        return yTaille;
    }

    public Monde setyTaille(int yTaille) {
        this.yTaille = yTaille;
        return this;
    }

    public ArrayList<Lieu> getArrayLieux() {
        return arrayLieux;
    }

    public Monde setArrayLieux(ArrayList<Lieu> arrayLieux) {
        this.arrayLieux = arrayLieux;
        return this;
    }

    public Monde(int xTaille, int yTaille, int xPosition, int yPosition) {
        super(xPosition, yPosition);
        this.setxTaille(xTaille + 2);
        this.setyTaille(yTaille + 2);
    }

    public Monde(int xTaille, int yTaille, int xPosition, int yPosition, Lieu l) {
        super(xPosition, yPosition);
        this.setxTaille(xTaille + 2);
        this.setyTaille(yTaille + 2);
        this.arrayLieux = new ArrayList<>();
        this.add(l);
    }

    public Monde add(Lieu l) {
        this.arrayLieux.add(l);
        return this;
    }

    public Object accept(Visitor v) {
        return v.visit(this);
    }
}
