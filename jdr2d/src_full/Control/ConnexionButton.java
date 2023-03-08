package Control;

import Graphic.FullLogInterface;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.io.IOException;

public class ConnexionButton extends AbstractAction {
    FullLogInterface fenetre;
    public ConnexionButton(FullLogInterface fenetre,String text){
        super(text);
        this.fenetre=fenetre;
    }
    @Override
    public void actionPerformed(ActionEvent e) {
        this.fenetre.setToplabel(new JLabel("Entrer un pseudo"));
        try {
            ClientPart.getServeroutput().writeObject(ConnexionOutput.CONNEXION);
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }
        this.fenetre.setToptextfield(new JTextField(10));
        this.fenetre.setTop(new JButton(new LogButton(this.fenetre,"Validate")));
        this.fenetre.setBottom(new JButton(new CreateAccountButton(this.fenetre,"Creer un compte")));
        this.fenetre.setBottomlabel(new JLabel("Entrer un mot de passe"));
        this.fenetre.setBottomtextfield(new JPasswordField());
        this.fenetre.getBottomtextfield().setVisible(true);
        this.fenetre.getBottomtextfield().setColumns(10);
        this.fenetre.refresh();
    }
}
