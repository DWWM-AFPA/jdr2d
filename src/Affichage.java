import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Affichage {

    public static String deplacement;
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
        JButton reculer = new JButton("reculer");
        reculer.setBounds(200, 300, 100, 40);
        fenetre.add(reculer);
        JButton gauche = new JButton("gauche");
        gauche.setBounds(100, 200, 100, 40);
        fenetre.add(gauche);
        JButton droite = new JButton("droite");
        droite.setBounds(300, 200, 100, 40);
        fenetre.add(droite);
        JButton quitter = new JButton("quitter");
        quitter.setBounds(150, 400, 200, 40);
        fenetre.add(quitter);
        final JTextArea textArea = new JTextArea();
        textArea.setBounds(150, 50, 200, 20);
        textArea.setText(String.format("Le %s à %s de PV et %s de DPS", perso.getNom(), perso.getPv(), perso.getDps()));
        fenetre.add(textArea);
        fenetre.setSize(500, 500);
        fenetre.setLayout(null);
        fenetre.setResizable(true);

        avancer.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                perso.setDeplacement("z");
                deplacement="z"
                System.out.println("avance");
            }
        });
        reculer.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                perso.setDeplacement("s");
                System.out.println("reculer");
            }
        });
        gauche.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                perso.setDeplacement("q");
                System.out.println("gauche");
            }
        });
        droite.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                perso.setDeplacement("d");
                System.out.println("droite");
            }
        });
        quitter.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                perso.setDeplacement("l");
                System.out.println("quitter");
            }
        });




        Dimension size = Toolkit.getDefaultToolkit().getScreenSize();
        fenetre.setLocation((int) size.getWidth() / 2 - 300, (int) size.getHeight() / 2 - 300);


    }
}

