import javax.swing.*;
import java.awt.event.KeyEvent;
import java.util.Scanner;

public class Main {
    public static <keyEvent> void main(String[] args){
        Carte carteUne = new Carte("Carte une","Description à la con",4,8);
        Personnage player = new Personnage(carteUne,1,1,"joueur",100,10);
        Personnage mechant = new Personnage(carteUne,3,4,"connard",1000,1);
        Personnage mechant2 = new Personnage(carteUne,4,4,"tonnard",1000,1);
        Objet couteau = new Objet("couteau player","casque",1,2,"attaque",player);
        Objet casque = new Objet("casque par terre",2,3,"casque",4,4,"protege");
        player.equiperPersonnage(couteau);
        System.out.println(player.getNom()+" se déplace en " +player.getX()+" "+ player.getY());

        //ZQSD L
        Scanner sc = new Scanner(System.in);
        String input = sc.next();
        while (!input.toLowerCase().equals("l")) {
            player.deplacer(input);
            carteUne.dessinerCarte();
            carteUne.afficherCarte(player);
            System.out.println(player.getNom()+"se déplace en " +player.getX()+" "+ player.getY());
            input = sc.next();
        }


    }
}
