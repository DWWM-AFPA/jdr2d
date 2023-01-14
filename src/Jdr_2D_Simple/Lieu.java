package Jdr_2D_Simple;

import java.util.Random;

public class Lieu {

    private String nomLieu;
    private String descriptionLieu;
    private  int w;
    private  int h;
    private int xPosition;
    private int yPosition;
    private char[][] lieu;

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

    public void setxPositionn(int xPosition){
        this.xPosition = xPosition;
    }

    public int getyPosition(){
        return yPosition;
    }

    public void setyPosition(int yPosition){
        this.yPosition = yPosition;
    }
    public char[][] getLieu(){
        return lieu;
    }

    public void setLieu(char[][] lieu){
        this.lieu = lieu;
    }
    public Lieu(String nomLieu, int xPosition, int yPosition, int w, int h){
        this.w = w;
        this.h = h;
        this.xPosition = xPosition;
        this.yPosition = yPosition;
        this.nomLieu = nomLieu;
        this.lieu = generationLieu(w, h);
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


}
