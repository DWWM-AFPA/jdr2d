public class Run extends Thread implements EventListener{
    EventManager test = Affichage.events;
    public static Editor editeur;
    @Override
    public void run() {
        Editor editeur = new Editor();
        this.editeur=editeur;
        editeur.events.subscribe("deplacement",new MoveListener("deplacement"));
 //   test.subscribe("deplacement",new MoveListener("test"/*Affichage.deplacement*/));
        Carte carte = Main.carte;
        Personnage player = carte.getListePersonnage().get(0);

        String input = "l"; //en cours de modification avec observer
        System.err.println(Main.carte.getListePersonnage().get(0).getDeplacement());





        while (!input.equals("l")) {
            player.deplacer(input);         //le joueur se déplace d'une case
            carte.dessinerCarte();       //calcul de la carte
            carte.afficherCarte(player); //affiche la carte dans le terminal
            Interaction combat = new Interaction(player, carte.getListePersonnage().get(1), "combat");
            //affichage pour le déplacement
            if (input.toLowerCase().equals("a"))
                System.out.println(player.getNom() + "se reste en " + player.getX() + " " + player.getY());
            else
                System.out.println(player.getNom() + "se déplace en " + player.getX() + " " + player.getY());

            input = player.getDeplacement(); //sc.next();

        }


    }

    @Override
    public void update(String eventType, String deplacement) {
        System.out.print("listner dans run");
    }
}
