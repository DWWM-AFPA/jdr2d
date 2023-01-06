import java.util.Scanner;
import java.util.concurrent.TimeUnit;

public class Main{
    static Carte carte;
    static Thread jeu;
    public static void main(String[] args) throws InterruptedException {


        Carte carteUne = new Carte("Carte une", "Description à la con", 6, 20);
        carte = carteUne;
        Personnage player = new Personnage(carteUne, 3, 3, "joueur", 100, 10);
        Personnage mechant = new Personnage(carteUne, 3, 4, "connard", 500, 1);
        Personnage mechant2 = new Personnage(carteUne, 4, 4, "tonnard", 1000, 1);
        Objet couteau = new Objet("couteau player", "casque", 1, 2, "attaque", player);
        Objet casque = new Objet(carteUne, "casque par terre", 2, 3, "casque", 4, 4, "protege");
        player.equiperPersonnage(couteau);
        System.out.println(player.getNom() + " se déplace en " + player.getX() + " " + player.getY());

        //---------------------------------------//

        carteUne.listerPersonnage();
        //---------------------------------------//
        player.desequiperPersonnage(couteau);
        player.afficherEquipement();
        carteUne.listerPersonnage();

        String input = player.getDeplacement(); //


        Run jeu = new Run();
        Main.jeu=jeu;
        jeu.start();


/*        Run affichage = new Run();
        affichage.start();*/
        Affichage.afficher(carteUne.getListePersonnage().get(0));

    }
}