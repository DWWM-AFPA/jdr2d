import java.util.Scanner;
import java.util.concurrent.TimeUnit;

public class Run extends Thread {

    @Override
    public void run() {

        Carte carte = Main.carte;
        Personnage player = carte.getListePersonnage().get(0);

        String input = Affichage.deplacement; //
        System.err.println(Main.carte.getListePersonnage().get(0).getDeplacement());





        while (!input.equals("l")) {
            player.deplacer(input);         //le joueur se déplace d'une case
            carteUne.dessinerCarte();       //calcul de la carte
            carteUne.afficherCarte(player); //affiche la carte dans le terminal
            Interaction combat = new Interaction(player, mechant, "combat");
            //affichage pour le déplacement
            if (input.toLowerCase().equals("a"))
                System.out.println(player.getNom() + "se reste en " + player.getX() + " " + player.getY());
            else
                System.out.println(player.getNom() + "se déplace en " + player.getX() + " " + player.getY());

            input = player.getDeplacement(); //sc.next();

        }


    }
}
