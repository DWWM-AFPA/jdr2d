package Jdr_2D_Simple;

import java.util.ArrayList;
import java.util.Random;

public class Lieu {

    private String nomLieu;
    private String descriptionLieu;
    private  int w;
    private  int h;
    protected int xPosition;
    protected int yPosition;
    private char[][] lieu;

    private Monde monde;

    private ArrayList<Personnage> personnages;

    public String getNomLieu(){
        return nomLieu;
    }

    public Lieu setNomLieu(String nomLieu){
        this.nomLieu = nomLieu;
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

    public char[][] getLieu(){
        return lieu;
    }

    public void setLieu(char[][] lieu){
        this.lieu = lieu;
    }

    public Monde getMonde(){
        return monde;
    }

    public Lieu setMonde(Monde monde){
        this.monde = monde;
        return this;
    }

    public Lieu(String nomLieu, int w, int h, Monde monde){
        this.w = w;
        this.h = h;
        this.nomLieu = nomLieu;
        this.lieu = generationLieu(w, h);
    }

    public Lieu(String nomLieu, int xPosition, int yPosition, int w, int h, Personnage personnages){

    }

    public char[][] generationLieu(int w, int h){

        Random choix = new Random();

        int i, j;
        char[][] retour = new char[h][w];

        for (i = 0; i < h; i++){
            for (j = 0; j < w; j++){
                if (choix.nextInt(100) + 1 < 95){
                    retour[i][j] += '.';

                }else{
                    retour[i][j] = '#';
                }
            }
        }
        return retour;
    }

    @Override
    public String toString(){

        int i;
        int j;
        String retour = new String();

        for(i = 0; i < h; i++){
            for(j = 0; j < w; j++){
                retour += lieu[i][j];
            }
            retour += "\n";
        }

        return retour;
    }

    public Object accept(Visitor v){
        return v.visit(this);
    }

}
