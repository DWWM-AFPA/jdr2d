import javax.swing.*;
import java.awt.*;

public class Run extends Thread implements EventListener{
    public static Editor editeur;
    public static String input;

    public static void setInput(String input) {
        Run.input=input;
        editeur.newInput(input);
    }

    @Override
    public void run() {

        //Affichage.editeur.events.subscribe("input",new newInput());
        Carte carte = Main.carte;
        Personnage player = carte.getListePersonnage().get(0);

        //Run.input=Run.input==null? "l":Run.input;
        switch (input) {
            case("quitter"):
                System.exit(0);

            case ("taper"):
                Interaction combat = new Interaction(player, Interaction.getEnnemi(carte), "combat");
                System.out.println(player.getNom() + "se reste en " + player.getX() + " " + player.getY());
                break;
            case ("ramasser"):
                Objet objet=carte.getListeObjet().get(0);
                player.equiperPersonnage(objet);
                System.out.println(String.format("le joueur ramasse le %s \"%s\", non implémenté complétement dans run", objet.getTypeObjet(),objet.getNom()));
                break;
            default:
                //le joueur se déplace d'une case dans la direction de input
                player.deplacer(input);
                break;
        }
        carte.dessinerCarte();       //calcul de la carte

        JFrame jeu=new JFrame("carte");
        JPanel panel = new JPanel();
        JTextArea textArea = new JTextArea(carte.afficherCarte(player));
        jeu.getContentPane().add(panel, BorderLayout.CENTER);
        panel.setLayout(new FlowLayout());
        jeu.add(panel.add(textArea));
        //   jeu.add(panel);
        jeu.setSize(carte.getX()*5,carte.getY()*35);
        jeu.setVisible(true); // Now this will open NewJFrame for you again and will also get refreshed
    //    System.err.println(carte.afficherCarte(player));
    //    Affichage.afficheur.setVisible(true);
     //   carte.afficherCarte(player); //affiche la carte dans le terminal

        System.out.println(player.getNom() + "se déplace en " + player.getX() + " " + player.getY());
    }

    @Override
    public void update(String eventType, String deplacement) {
    }
}
