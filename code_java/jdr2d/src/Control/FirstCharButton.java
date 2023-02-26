package Control;

import DAO.PersonnageDAO;
import Graphic.FullLogInterface;
import jdr2dcore.Personnage;
import jdr2dcore.Utilisateur;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.WindowEvent;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Objects;

public class FirstCharButton extends AbstractAction {

    private Utilisateur util;

    private FullLogInterface fenetre;

    //getters


    public Utilisateur getUtil() {
        return util;
    }

    public FullLogInterface getFenetre() {
        return fenetre;
    }

    //builders

    public FirstCharButton(FullLogInterface fenetre, String texte, Utilisateur util){
        super(texte);
        this.fenetre=fenetre;
        this.util=util;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        JTextField textField= (JTextField) fenetre.getToptextfield();
        String charname=textField.getText();
        if(!charname.isEmpty()) {
            boolean validation;
            Personnage perso;
            try {
                validation = PersonnageDAO.checkcharname(charname);
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            if (validation) {
                try {
                    perso = PersonnageDAO.getchar(PersonnageDAO.createchar(charname, util));
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
                File directorie=new File("Portraits");
                ArrayList<File> availableportraits = new ArrayList<>(Arrays.asList(Objects.requireNonNull(directorie.listFiles())));

                BufferedImage myPicture = null;
                try {
                    myPicture = ImageIO.read(availableportraits.get(0));
                } catch (IOException ex) {
                    throw new RuntimeException(ex);
                }
                fenetre.getToplabel().setIcon(new ImageIcon(myPicture));
                fenetre.getToplabel().setText("");
                fenetre.getToptextfield().setVisible(false);
                fenetre.getBottomtextfield().setVisible(false);
                fenetre.getBottomlabel().setVisible(false);
                ValidePictureChoice valid=new ValidePictureChoice(this.fenetre,util,perso,availableportraits,"Valider");
                fenetre.setBottom(new JButton(valid));
                NextPictureButton next=new NextPictureButton(this.fenetre,perso,this.util,availableportraits,"Option Suivante",valid);
                fenetre.setTop(new JButton(next));
                fenetre.refresh();
                /*try {
                    //this.fenetre.setPerso(perso);
                } catch (InterruptedException ex) {
                    throw new RuntimeException(ex);
                }
                this.fenetre.setVisible(false);/**/
            } else {
                this.fenetre.setToplabel(new JLabel("Personnage non disponible, choisir un autre nom"));
                this.fenetre.refresh();
            }
        }
    }
}
