import DAO.CarteRepository;
import DAO.PersonnageRepository;
import DAO.PlayerRepository;
import Entity.Carte;
import Entity.Personnage;
import Entity.Player;

public class Main{
    static Carte carte;
    static Thread jeu;
    static Thread affichage;
    static Personnage player;

    public static void main(String[] args) throws Exception {

       /* Controller.Editor editeur = new Controller.Editor();
        View.Run.editeur =editeur;
        View.Affichage.editeur =editeur;

        Entity.Carte carteUne = new Entity.Carte("Entity.Carte une", "Description à la con", 250, 250);
        carte = carteUne;
        Entity.Personnage player = new Entity.Personnage(carteUne, 3, 3, "joueur", 100, 10);
        Main.player=player;
        Entity.Personnage mechant = new Entity.Personnage(carteUne, 3, 4, "connard", 20, 1);
        Entity.Personnage mechant2 = new Entity.Personnage(carteUne, 4, 4, "tonnard", 50, 1);
        Entity.Objet couteau = new Entity.Objet("couteau player", Entity.Objet.TypeObjet.ARME, 1, 2, Entity.Objet.TypeEffet.ATTAQUE, player);
        Entity.Objet casque = new Entity.Objet(carteUne, "casque par terre", 2, 3, Entity.Objet.TypeObjet.CASQUE, 4, 4, Entity.Objet.TypeEffet.PROTECTION);
        Entity.Objet pant = new Entity.Objet(carteUne, "futal par terre", 4, 3, Entity.Objet.TypeObjet.PANTALON, 4, 4, Entity.Objet.TypeEffet.PROTECTION);
        Entity.Objet ga = new Entity.Objet(carteUne, "gants par terre", 4,5, Entity.Objet.TypeObjet.GANTS, 4, 4, Entity.Objet.TypeEffet.PROTECTION);
        Entity.Objet bo = new Entity.Objet(carteUne, "truc par terre", 3, 3, Entity.Objet.TypeObjet.ARME, 4, 4, Entity.Objet.TypeEffet.PROTECTION);
        player.equiperPersonnage(couteau);

       // System.out.println(player.getNom() + " se déplace en " + player.getX() + " " + player.getY());

      //  carteUne.listerPersonnage();
        player.desequiperPersonnage(couteau);
      //  player.afficherEquipement();
       // carteUne.listerPersonnage();

        //String input = player.getDeplacement(); //
       // Main.jeu= new View.Run();
        //   run.start();

        View.Affichage affichage = new View.Affichage();
        affichage.start();
        Main.affichage=affichage;
        editeur.events.subscribe("input", new newInput());

        System.out.println("\n Commandes de déplacement : Z Q S D \n Commande ramassage : A \n Commande combat :E \n Commande pour quitter : L ");
        //   View.Affichage.afficher(carteUne.getListePersonnage().get(0));*/

        Player player1 = new PlayerRepository().find(2);
        Personnage p1= new PersonnageRepository().find(2);
        Carte carte1 = new CarteRepository().find(1);
        Carte carte2 = new CarteRepository().find(2);


        //System.out.println(player1.toString());


        System.out.println(p1.getNom());



    }
}
