package View;

import Controller.*;
import Entity.*;

import javax.swing.*;
import java.awt.*;
import java.util.Objects;

public class Run extends Thread implements EventListener {
    public static Editor editeur;
    public static String input;

    public static void setInput(String input) {
        Run.input=input;
        editeur.newInput(input);
    }

    @Override
    public void run() {
        System.out.println();
       //TODO  Carte carte = Main.carte;
        Carte carte = new Carte();
        Personnage player = carte.getListePersonnage().get(0);

        //View.Run.input=View.Run.input==null? "l":View.Run.input;
        if (Objects.equals(input, "quitter") ||input.equals("l")) {
            System.exit(0);
        } else if (input=="taper"||input.equals("e")) {
                Interaction combat = new Interaction(player, Interaction.getEnnemi(carte), "combat");
                System.out.println(player.getNom() + "se reste en " + player.getX() + " " + player.getY());

        } else if (input=="ramasser"||input.equals("a")) {
            // Entity.Objet objet=carte.getListeObjet().get(0);
            for (Objet objet : carte.getListeObjet()) {
                if (!objet.isEquipe() && objet.calculPortee(0, player)) {
                    player.equiperPersonnage(objet);
                    //TODO TypeObjet a vérifier ancien objet.getTypeObjet().toString().toLowerCase()
                    System.out.println(String.format("le joueur ramasse le %s \"%s\", non implémenté complétement dans run", "gants", objet.getNom()));
                }
            }
            // player.equiperPersonnage(objet);
        }
            else {
            input=  input.equals("avancer")? "z" :
                    input.equals("reculer")? "s" :
                    input.equals("gauche")?"q" :
                    input.equals("droite")?"d":
                    input.equals("quitter")?"l":input;
            //le joueur se déplace d'une case dans la direction de input
            player.deplacer(input);
        }
        carte.dessinerCarte();       //calcul de la carte


        JFrame jeu=Affichage.afficheur;
        JPanel panel = new JPanel();
        JTextArea textArea = new JTextArea(carte.afficherCarte(player));
        jeu.getContentPane().add(panel, BorderLayout.CENTER);
        panel.setLayout(new FlowLayout());
        jeu.add(panel.add(textArea));
        //   jeu.add(panel);
        jeu.setSize(carte.getX()*2,carte.getY()*34);
        jeu.setVisible(true); // Now this will open NewJFrame for you again and will also get refreshed
        jeu.setFocusableWindowState(false);
        Affichage.afficheur=jeu;
    //    System.err.println(carte.afficherCarte(player));
    //    View.Affichage.afficheur.setVisible(true);
     //   carte.afficherCarte(player); //affiche la carte dans le terminal

        System.out.println(player.getNom() + "se déplace en " + player.getX() + " " + player.getY());
    }

    @Override
    public void update(String eventType, String deplacement) {
    }
}
