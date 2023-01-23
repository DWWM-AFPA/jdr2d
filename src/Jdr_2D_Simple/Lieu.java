package Jdr_2D_Simple;

import javax.swing.text.Position;
import java.awt.*;
import java.util.ArrayList;

public class Lieu {

    private String nomLieu;
    private String descriptionLieu;
    private  int xTaille;
    private  int yTaille;

    protected int xPosition;
    protected int yPosition;
    private Monde monde;

    //private Dessiner dessiner;

    private ArrayList<Personnage> personnages;

    public String getNomLieu(){
        return nomLieu;
    }

    public Lieu setNomLieu(String nomLieu){
        this.nomLieu = nomLieu;
        return this;
    }

    public int getxTaille(){
        return xTaille;
    }

    public Lieu setxTaille(int xTaille){
        this.xTaille = xTaille;
        return this;
    }

    public int getyTaille(){
        return yTaille;
    }

    public Lieu setyTaille(int yTaille){
        this.yTaille = yTaille;
        return this;
    }

    public int getxPosition(){
        return xPosition;
    }

    public Lieu setxPosition(int xPosition){
        this.xPosition = xPosition;
        return this;
    }

    public int getyPosition(){
        return yPosition;
    }

    public Lieu setyPosition(int yPosition){
        this.yPosition = yPosition;
        return this;
    }

    public Monde getMonde(){
        return monde;
    }

    public Lieu setMonde(Monde monde){
        this.monde = monde;
        return this;
    }

    public Lieu(){
        this.setxPosition(1);
        this.setyPosition(1);
    }

    public Lieu(String nomLieu, int xTaille, int yTaille, int xPosition, int yPosition){
        this.setxPosition(getxPosition());
        this.setyPosition(getyPosition());
        this.xTaille = xTaille;
        this.yTaille = yTaille;
        this.nomLieu = nomLieu;
    }

    public Lieu(String nomLieu, int xTaille, int yTaille, int xPosition, int yPosition, Monde monde){
        this.setxPosition(getxPosition());
        this.setyPosition(getyPosition());
        this.xTaille = xTaille;
        this.yTaille = yTaille;
        this.nomLieu = nomLieu;
        this.monde = monde;
    }

    public Lieu(String nomLieu, int xPosition, int yPosition, int Taille, int yTaille, Personnage personnages){

    }

    /*public char[][] generationLieu(int wTaille, int hTaille){

        Random choix = new Random();

        int w = dessiner.getLieuDessiner().wTaille;
        int h = dessiner.getLieuDessiner().hTaille;

        int i, j;
        char[][] retour = new char[wTaille][hTaille];

        for (i = 0; i < h; i++){
            for (j = 0; j < w; j++){
                if (choix.nextInt(100) + 1 < 95){
                    retour[j][i] += '.';

                }else{
                    retour[j][i] = '#';
                }
            }
        }
        return retour;
    }*/

   /*@Override
    public String toString(){

        int i;
        int j;
        String retour = new String();

        for(i = 0; i < hTaille; i++){
            for(j = 0; j < wTaille; j++){
                retour += lieu[i][j];
            }
            retour += "\n";
        }

        return retour;
    }*/

    public Object accept(Visitor v){
        return v.visit(this);
    }

}
