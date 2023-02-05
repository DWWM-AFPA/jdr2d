package Jdr_2D_Simple;

import java.util.ArrayList;
import java.util.Random;

public class Dessiner implements Visitor {

    private Monde monde;
    private Lieu lieu;
    private char[][] dessiner;
    private int xPosition;
    private int yPosition;
    private String stockageMonde;

    //private ArrayList<Lieu> lieux;

    //private ArrayList<Object> objects;
    public Monde getMonde() {
        return monde;
    }

    public Dessiner setMonde(Monde monde) {
        this.monde = monde;
        return this;
    }

    public Lieu getLieu() {
        return lieu;
    }

    public Dessiner setLieu(Lieu lieu) {
        this.lieu = lieu;
        return this;
    }

    public int getxPosition() {
        return xPosition;
    }

    public Dessiner setxPosition(int xPosition) {
        this.xPosition = xPosition;
        return this;
    }

    public int getyPosition() {
        return xPosition;
    }

    public Dessiner setyPosition(int yPosition) {
        this.yPosition = yPosition;
        return this;
    }
   /* public ArrayList<Object> getObject(){
        return objects;
    }

    public Dessiner setObjects(ArrayList<Object> objects){
        this.objects = objects;
        return this;
    }*/

    /*public String getStockageMonde() {
        return stockageMonde;
    }

    public Dessiner setStockageMonde(String stockageMonde) {
        this.stockageMonde = stockageMonde;
        return this;
    }*/

    /*public ArrayList<Lieu> getLieux(){
        return lieux;
    }

    public Dessiner setLieux(ArrayList<Lieu> lieux){
        this.lieux = lieux;
        return this;
    }*/

    public Dessiner(Monde monde, Lieu lieu) {
        this.monde = monde;
        this.lieu = lieu;
        this.dessiner = generationMondes(getMonde().getxTaille(), getMonde().getyTaille());
    }

    /*public Dessiner(Lieu lieu){
        this.lieu = lieu;
        this.dessiner = generationLieux(getLieu().getxTaille(), getLieu().getyTaille());
    }*/

    /*public Dessiner(Monde monde, Lieu lieu){
        this.monde = monde;
        this.lieu = lieu;
        this.dessiner = generationMondes(getMonde().getxTaille(), getMonde().getyTaille());
        this.lieux = new ArrayList<>();
        this.add(lieu);
    }

    public Dessiner add(Lieu l){
        this.lieux.add(l);
        return this;
    }*/

    public char[][] generationMondes(int xTaille, int yTaille){

        int i, j;
        char[][] retour = new char[xTaille][yTaille];
        int compteurX = getMonde().getxTaille() - 1;
        int compteurY = getMonde().getyTaille() - 1;

        for(i = 0; i < getMonde().getyTaille(); i++) {
            for(j = 0; j < getMonde().getxTaille(); j++) {
                if(i == 0 || j == 0 || i == compteurY || j == compteurX) {
                    retour[j][i] += '#';
                }else{
                    retour[j][i] += ' ';
                }
            }
        }
        return retour;
    }

    public char[][] generationLieux(int xTaille, int yTaille) {

        int i, j;
        Random choix = new Random();
        char[][] retour = new char[xTaille][yTaille];

        for (i = 0; i < getLieu().getyTaille(); i++) {
            for (j = 0; j < getLieu().getxTaille(); j++) {
                if (choix.nextInt(100) + 1 < 80) {

                    retour[j][i] += '.';
                }else{
                    retour[j][i] = 'Y';
                }
            }
        }
        return retour;
    }
    /*public void rechercheLieu(){

        if(monde.getLieux() != null){
            for(Lieu myLieu : monde.getLieux()){
                dessiner =  generationLieux(myLieu.getxTaille(), myLieu.getyTaille());
            }
        }
    }*/

    public String dessinerMonde() {

        int i, j, px, py, compteurX, compteurY;
        String retour = new String();

        for (py = 0; py < getMonde().getyPosition(); py++) {
            retour += "\n";
        }
        for (i = 0; i < getMonde().getyTaille(); i++){
            for (px = 0; px < getMonde().getxPosition(); px++) {
                retour += " ";
            }
            for (j = 0; j < getMonde().getxTaille(); j++) {
                retour += dessiner[j][i];
            }
            retour += "\n";
        }

        //Stockage du monde dessiner
        stockageMonde = retour;

        //Parcourt des lieux stockés dans le monde
        ArrayList<Lieu> arrayLieux = getMonde().getArrayLieux();
        if (arrayLieux != null) {
            for (Lieu myLieu : arrayLieux) {
                dessiner = generationLieux(myLieu.getxTaille(), myLieu.getyTaille());
            }
            retour += visit(getLieu());
        }

        retour += "\n";
        return retour;
    }

    public Object visit(Monde m) {
        return dessinerMonde();
    }

    public Object visit(Lieu l) {

        int a, b, i, j, positionLieu;
        int d = 0;
        StringBuilder retour = new StringBuilder();
        String marqueurEcriture = "";
        char lieu = ' ';
        positionLieu = getLieu().getxPosition() + (getMonde().getxTaille() + 1) * getLieu().getyPosition();
        marqueurEcriture += stockageMonde.charAt(positionLieu);

        for (i = 0; i < getLieu().getyTaille(); i++) {
            for (j = 0; j < getLieu().getxTaille(); j++) {
                lieu =  dessiner[j][i];
            }
        }

        for (a = 0; a < stockageMonde.length(); a++) {

            if(a == positionLieu) {
                //Taille du lieu en Y
                for (b = 0; b < getLieu().getyTaille(); b++) {
                    //Taille du lieu en X avec remplacement des morceaux du monde par des morceaux du lieu
                    for (a = positionLieu + d; a < getLieu().getxTaille() + positionLieu + d; a++) {
                        retour.append(marqueurEcriture.replace(stockageMonde.charAt(a), lieu));
                    }
                    //Gestion de l'espace à chaque nouvelles lignes de lieu
                    for (a = positionLieu + getLieu().getxTaille() + d; a < positionLieu + getMonde().getxTaille() + d; a++) {
                        retour.append(stockageMonde.charAt(a));
                    }
                    retour.append(stockageMonde.charAt(a));
                    d += getMonde().getxTaille() + 1;
                }

            } else {
                retour.append(stockageMonde.charAt(a));
            }
        }

        return retour.toString();
    }

    public Object visit(Objet m) {
        return m;
    }

    public Object visit(Arme m) {
        return m;
    }

    public Object visit(Armure m) {
        return m;
    }

    public Object visit(Bouclier m) {
        return m;
    }

    public Object visit(Materiel m) {
        return m;
    }

    public Object visit(Personnage m) {
        return m;
    }
}
