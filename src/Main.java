import javax.swing.*;
import java.awt.event.KeyEvent;
import java.beans.Introspector;
import java.util.Scanner;

public class Main {
    public static void main(String[] args){
        Carte carteUne = new Carte("Carte une","Description à la con",6,20);
        Personnage player = new Personnage(carteUne,3,3,"joueur",100,10);
        Personnage mechant = new Personnage(carteUne,3,4,"connard",500,1);
        Personnage mechant2 = new Personnage(carteUne,4,4,"tonnard",1000,1);
        Objet couteau = new Objet("couteau player","casque",1,2,"attaque",player);
        Objet casque = new Objet(carteUne,"casque par terre",2,3,"casque",4,4,"protege");
        player.equiperPersonnage(couteau);
        System.out.println(player.getNom()+" se déplace en " +player.getX()+" "+ player.getY());

        //ZQSD L
        Scanner sc = new Scanner(System.in);
        String input = sc.next();
        while (!input.toLowerCase().equals("l")) {
            player.deplacer(input);         //le joueur se déplace d'une case
            carteUne.dessinerCarte();       //calcul de la carte
            carteUne.afficherCarte(player); //affiche la carte dans le terminal
            Interaction combat = new Interaction(player,mechant,"combat");
            //affichage pour le déplacement
            if (input.toLowerCase().equals("a"))
                System.out.println(player.getNom()+"se reste en " +player.getX()+" "+ player.getY());
            else
                System.out.println(player.getNom()+"se déplace en " +player.getX()+" "+ player.getY());
            input = sc.next();
        }


    }
}
