import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Affichage extends Thread implements EventListener {

    public static String deplacement;
    public static String input;
    public static JButton avancer;
    public static JButton reculer;
    public static JButton gauche;
    public static JButton droite;
    public static JButton quitter;
    public static JButton ramasser;
    public static JButton taper;
    public static Editor editeur;



    public static String setDeplacement(String deplacement,Personnage perso) {
        Affichage.deplacement = deplacement;
      //  perso.setDeplacement("z");
        Run.editeur.MoveListener(deplacement);

        return deplacement;
    }

    public static void setInput(String input) {
        Affichage.input = input;
        Run.input=input;
        editeur.newInput(input);
     //   editeur.events.subscribe("deplacement",new MoveListener("deplacement"));
    }

    @Override
    public void run() {
Personnage perso = Main.player;
afficher(perso);
        getInput();
    }

    public static void afficher(Personnage perso) {
        JFrame fenetre = new JFrame("Jeux de role 2D");
        //     ImageIcon soldat = new ImageIcon("img\\soldat.png");
        //     fenetre.add(new JLabel(soldat).setM);
        //   soldat
        //   fenetre.pack();
        fenetre.setVisible(true);

        JButton avancer = new JButton("avancer");
        avancer.setBounds(200, 100, 100, 40);
        fenetre.add(avancer);
        Affichage.avancer = avancer;

        JButton reculer = new JButton("reculer");
        reculer.setBounds(200, 300, 100, 40);
        fenetre.add(reculer);
        Affichage.reculer = reculer;

        JButton gauche = new JButton("gauche");
        gauche.setBounds(100, 200, 100, 40);
        fenetre.add(gauche);
        Affichage.gauche = gauche;

        JButton droite = new JButton("droite");
        droite.setBounds(300, 200, 100, 40);
        fenetre.add(droite);
        Affichage.droite = droite;

        JButton quitter = new JButton("quitter");
        quitter.setBounds(150, 400, 200, 40);
        fenetre.add(quitter);
        Affichage.quitter = quitter;

        JButton ramasser = new JButton("ramasser");
        ramasser.setBounds(50, 100, 100, 60);
        fenetre.add(ramasser);
        Affichage.ramasser = ramasser;

        JButton taper = new JButton("taper");
        taper.setBounds(350, 100, 100, 60);
        fenetre.add(taper);
        Affichage.taper = taper;

        final JTextArea textArea = new JTextArea();
        textArea.setBounds(150, 50, 200, 20);
        textArea.setText(String.format("Le %s à %s de PV et %s de DPS", perso.getNom(), perso.getPv(), perso.getDps()));
        fenetre.add(textArea);
        fenetre.setSize(500, 500);
        fenetre.setLayout(null);
        fenetre.setResizable(true);
        Dimension size = Toolkit.getDefaultToolkit().getScreenSize();
        fenetre.setLocation((int) size.getWidth() / 2 - 300, (int) size.getHeight() / 2 - 300);
    }

    public static String getSubstring(String string,String stringToFind,char nextChar){
        return string.substring(string.indexOf(stringToFind)+stringToFind.length(),string.indexOf(nextChar,17));
    }
    public static String getInput(){
        avancer.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                Run.setInput(getSubstring(e.paramString(),"cmd=",','));
                //setDeplacement("z", perso);
            }
        });
        reculer.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setInput(getSubstring(e.paramString(),"cmd=",','));
                //setDeplacement("s", perso);
            }
        });
        gauche.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setInput(getSubstring(e.paramString(),"cmd=",','));
                //setDeplacement("q", perso);
            }
        });
        droite.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setInput(getSubstring(e.paramString(),"cmd=",','));
                //setDeplacement("d", perso);
            }
        });
        quitter.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setInput(getSubstring(e.paramString(),"cmd=",','));
                //setDeplacement("l", perso);
            }
        });
        ramasser.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setInput(getSubstring(e.paramString(),"cmd=",','));
            }
        });
        taper.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setInput(getSubstring(e.paramString(),"cmd=",','));
            }
        });
return null;
    }

    @Override
    public void update(String eventType, String deplacement) {
    }
}

