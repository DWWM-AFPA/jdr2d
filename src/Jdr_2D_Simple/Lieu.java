package Jdr_2D_Simple;

public class Lieu {

    private String nomLieu;
    private String descriptionLieu;

    private int xPosition;
    private int yPosition;


    private int[][] taille = {};

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
    public int[][] getTaille(){
        return taille;
    }

    public void setTaille(int[][] taille){
        this.taille = taille;
    }
    public Lieu(String nomLieu, int xPosition, int yPosition, int[][] taille){
        this.xPosition = xPosition;
        this.yPosition = yPosition;
        this.nomLieu = nomLieu;
        this.taille = taille;
    }
}
