import java.util.Scanner;
import java.util.concurrent.TimeUnit;

public class Main{
    static Carte carte;
    static Thread jeu;
    static Thread affichage;
    static Personnage player;

    public static void main(String[] args) throws InterruptedException {

        Editor editeur = new Editor();
        Run.editeur =editeur;
        Affichage.editeur =editeur;

        Carte carteUne = new Carte("Carte une", "Description à la con", 250, 250);
        carte = carteUne;
        Personnage player = new Personnage(carteUne, 3, 3, "joueur", 100, 10);
        Main.player=player;
        Personnage mechant = new Personnage(carteUne, 3, 4, "connard", 20, 1);
        Personnage mechant2 = new Personnage(carteUne, 4, 4, "tonnard", 50, 1);
        Objet couteau = new Objet("couteau player", Objet.TypeObjet.ARME, 1, 2, Objet.TypeEffet.ATTAQUE, player);
        Objet casque = new Objet(carteUne, "casque par terre", 2, 3, Objet.TypeObjet.CASQUE, 4, 4, Objet.TypeEffet.PROTECTION);
        Objet pant = new Objet(carteUne, "futal par terre", 4, 3, Objet.TypeObjet.PANTALON, 4, 4, Objet.TypeEffet.PROTECTION);
        Objet ga = new Objet(carteUne, "gants par terre", 4,5, Objet.TypeObjet.GANTS, 4, 4, Objet.TypeEffet.PROTECTION);
        Objet bo = new Objet(carteUne, "truc par terre", 3, 3, Objet.TypeObjet.ARME, 4, 4, Objet.TypeEffet.PROTECTION);
        player.equiperPersonnage(couteau);

       // System.out.println(player.getNom() + " se déplace en " + player.getX() + " " + player.getY());

      //  carteUne.listerPersonnage();
        player.desequiperPersonnage(couteau);
      //  player.afficherEquipement();
       // carteUne.listerPersonnage();

        //String input = player.getDeplacement(); //
       // Main.jeu= new Run();
        //   run.start();

        Affichage affichage = new Affichage();
        affichage.start();
        Main.affichage=affichage;
        editeur.events.subscribe("input", new newInput());

        System.out.println("\n Commandes de déplacement : Z Q S D \n Commande ramassage : A \n Commande combat :E \n Commande pour quitter : L ");
        //   Affichage.afficher(carteUne.getListePersonnage().get(0));
    }
}
