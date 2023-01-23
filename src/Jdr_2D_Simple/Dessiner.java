package Jdr_2D_Simple;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Random;

public class Dessiner implements Visitor{

    private Monde monde;
    private Lieu lieu;
    private char[][] position;
    private char[][] dessiner;
    private ArrayList<Object> objects;

    public Monde getMonde(){
        return monde;
    }

    public Dessiner setMonde(Monde monde){
        this.monde = monde;
        return this;
    }

    public Lieu getLieu(){
        return lieu;
    }

    public Dessiner setLieu(Lieu lieu){
        this.lieu = lieu;
        return this;
    }

    public char[][] getPosition(){
        return position;
    }

    public Dessiner setPosition(char[][] position){
        this.position = position;
        return this;
    }
    public char[][] getDessiner(){
        return dessiner;
    }

    public Dessiner setDessiner(char[][] dessiner){
        this.dessiner = dessiner;
        return this;
    }

    public ArrayList<Object> getObject(){
        return objects;
    }

    public Dessiner setObjects(ArrayList<Object> objects){
        this.objects = objects;
        return this;
    }
    public Dessiner(Monde monde){
        this.monde = monde;
        this.dessiner = generationMondes(getMonde().getxTaille(), getMonde().getyTaille());
        this.lieu = rechercheLieu();
    }

    public Dessiner(Lieu lieu){
        this.lieu = lieu;
        this.dessiner = generationLieux(getLieu().getxTaille(), getLieu().getyTaille());
    }

    public Dessiner(Monde monde, Object o){
        this.monde = monde;
        this.dessiner = generationMondes(getMonde().getxTaille(), getMonde().getyTaille());
        this.lieu = rechercheLieu();
        this.objects = new ArrayList<>();
        this.add(o);
    }

    public Dessiner add(Object o){
        this.objects.add(o);
        return this;
    }

    /*public char[][] generationPosition(int xPosition, int yPosition){

        int i, j;
        char[][] retour = new char[xPosition][yPosition];

        for(i = 0; i < getMonde().getyPosition(); i++){
            for(j = 0; j < getMonde().getxPosition(); j++){
                retour[j][i] += ' ';
            }
        }
        return retour;
    }*/

    public char[][] generationMondes(int xTaille, int yTaille){

        int i, j;
        char[][] retour = new char[xTaille][yTaille];
        int compteurX = getMonde().getxTaille() - 1;
        int compteurY = getMonde().getyTaille() - 1;

        for(i = 0; i < getMonde().getyTaille(); i++){
            for(j = 0; j < getMonde().getxTaille(); j++){
                if(i == 0 || j == 0 || i == compteurY || j == compteurX){
                    retour[j][i] += '#';
                }else{
                    retour[j][i] += ' ';
                }
            }
        }
        return retour;
    }

    public char[][] generationLieux(int xTaille, int yTaille){

        int i, j;
        Random choix = new Random();
        char[][] retour = new char[xTaille][yTaille];

        for (i = 0; i < getLieu().getyTaille(); i++){
            for (j = 0; j < getLieu().getxTaille(); j++){
                if (choix.nextInt(100) + 1 < 95){
                    retour[j][i] += '.';
                }else{
                    retour[j][i] = '#';
                }
            }
        }
        return retour;
    }
    public Lieu rechercheLieu(){

        if(getMonde().getLieux() != null){
            for(Lieu myLieu : getMonde().getLieux()){
                lieu = myLieu;
            }
        }
        return lieu;
    }

    public Object visit(Monde m){

        int i, j, k, l;
        String retour = new String();

        for(l = 0; l < m.getyPosition(); l++) {
            retour += "\n";
        }
        for (i = 0; i < m.getyTaille(); i++){
            for(k = 0; k < m.getxPosition(); k++){
                retour += " ";
            }
            for (j = 0; j < m.getxTaille(); j++){
                retour += dessiner[j][i];
            }
            retour += "\n";
        }
        retour += "\n";
        dessiner = generationLieux(lieu.getxTaille(), lieu.getyTaille());
        return retour;
    }

    public Object visit(Lieu l){

        int i, j;
        String retour = new String();

        for(i = 0; i < l.getyTaille(); i++){
            for(j = 0; j < l.getxTaille(); j++){
                retour += dessiner[j][i];
            }
            retour += "\n";
        }
        return retour;
    }

    public Object visit(Objet m){
        return m;
    }

    public Object visit(Arme m){
        return m;
    }

    public Object visit(Armure m){
        return m;
    }

    public Object visit(Bouclier m){
        return m;
    }

    public Object visit(Materiel m){
        return m;
    }

    public Object visit(Personnage m){
        return m;
    }
}
