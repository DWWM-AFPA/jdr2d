package Jdr_2D_Simple;

import java.util.ArrayList;

public class Position {
    //Menmbres
    protected int xPosition;
    protected int yPosition;
    protected char[][] position;

    protected ArrayList<Lieu> lieu;


    //Getter et Setter
    public int getxPosition(){
        return xPosition;
    }

    public Position setxPosition(int xPosition){
        this.xPosition = xPosition;
        return this;
    }

    public int getyPosition(){
        return yPosition;
    }

    public Position setyPosition(int yPosition){
        this.yPosition = yPosition;
        return this;
    }

    public Position(){
        this.setxPosition(1);
        this.setyPosition(1);
    }
    public Position(int xPosition, int yPosition){
        this.setxPosition(xPosition);
        this.setyPosition(yPosition);
        this.position = generationCarte(xPosition, yPosition);
    }

    public char[][] generationCarte(int xPosition, int yPosition){
        int i, j;
        char[][] retour = new char[xPosition][yPosition];

        for(i = 0; i < getxPosition(); i++){
            for(j = 0; j < getyPosition(); j++){
                retour[i][j] += ' ';
            }
        }
        return retour;
    }

    @Override
    public String toString(){
        int i;
        int j;
        String retour = new String();

        for(i = 0; i < getxPosition(); i++){
            for(j = 0; j < getyPosition(); j++){
                retour += position[i][j];
            }
            retour += "\n";
        }
        return retour;
    }


}
