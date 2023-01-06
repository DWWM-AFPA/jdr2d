import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

public class Affichage implements EventListener{

    public static String deplacement;
    public static JButton avancer;
    public static JButton reculer;
    public static JButton gauche;
    public static JButton droite;
    public static JButton quitter;

    public static String setDeplacement(String deplacement,Personnage perso) {
        Affichage.deplacement = deplacement;
        perso.setDeplacement("z");
        Run.editeur.MoveListener(deplacement);
        return deplacement;
    }

    public static void afficher(Personnage perso) {
        JFrame fenetre = new JFrame("Jeux de role 2D");
        ImageIcon soldat = new ImageIcon("img\\soldat.png");
        //     fenetre.add(new JLabel(soldat).setM);
        //   soldat
        fenetre.pack();
        fenetre.setVisible(true);

        JButton avancer = new JButton("avancer");
        avancer.setBounds(200, 100, 100, 40);
        fenetre.add(avancer);
        Affichage.avancer=avancer;

        JButton reculer = new JButton("reculer");
        reculer.setBounds(200, 300, 100, 40);
        fenetre.add(reculer);
        Affichage.reculer=reculer;

        JButton gauche = new JButton("gauche");
        gauche.setBounds(100, 200, 100, 40);
        fenetre.add(gauche);
        Affichage.gauche=gauche;

        JButton droite = new JButton("droite");
        droite.setBounds(300, 200, 100, 40);
        fenetre.add(droite);
        Affichage.droite=droite;

        JButton quitter = new JButton("quitter");
        quitter.setBounds(150, 400, 200, 40);
        fenetre.add(quitter);
        Affichage.quitter=quitter;

        final JTextArea textArea = new JTextArea();
        textArea.setBounds(150, 50, 200, 20);
        textArea.setText(String.format("Le %s à %s de PV et %s de DPS", perso.getNom(), perso.getPv(), perso.getDps()));
        fenetre.add(textArea);
        fenetre.setSize(500, 500);
        fenetre.setLayout(null);
        fenetre.setResizable(true);

        avancer.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
              //  perso.setDeplacement("z");
                setDeplacement("z",perso);
                System.out.println("avance");
            }
        });
        reculer.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setDeplacement("s",perso);
//              perso.setDeplacement("s");
                System.out.println("reculer");
            }
        });
        gauche.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setDeplacement("q",perso);
//              .setDeplacement("q");
                System.out.println("gauche");
            }
        });
        droite.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setDeplacement("d",perso);
//              perso.setDeplacement("d");
                System.out.println("droite");
            }
        });
        quitter.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setDeplacement("l",perso);
//              perso.setDeplacement("l");
                System.out.println("quitter");
            }
        });

        Dimension size = Toolkit.getDefaultToolkit().getScreenSize();
        fenetre.setLocation((int) size.getWidth() / 2 - 300, (int) size.getHeight() / 2 - 300);
    }

    @Override
    public void update(String eventType, String deplacement) {
        System.err.println("listener déplacement fonctionne");
    }
}

