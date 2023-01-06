public class Run extends Thread implements EventListener{
    public static Editor editeur;
    public static String input;
    @Override
    public void run() {



        Editor editeur = new Editor();
        Run.editeur =editeur;
        editeur.events.subscribe("deplacement",new MoveListener("deplacement"));
        Carte carte = Main.carte;
        Personnage player = carte.getListePersonnage().get(0);

        Run.input=Run.input==null? "l":Run.input;
        while (!Run.input.equals("l")) {
            player.deplacer(input);         //le joueur se déplace d'une case
            carte.dessinerCarte();       //calcul de la carte
            carte.afficherCarte(player); //affiche la carte dans le terminal
            Interaction combat = new Interaction(player, carte.getListePersonnage().get(1), "combat");
            //affichage pour le déplacement
            if (Run.input.toLowerCase().equals("a"))
                System.out.println(player.getNom() + "se reste en " + player.getX() + " " + player.getY());
            else
                System.out.println(player.getNom() + "se déplace en " + player.getX() + " " + player.getY());

            Run.input = player.getDeplacement(); //sc.next();
            try {
                Main.affichage.interrupt();
                Thread.currentThread().interrupt();
                Main.jeu.wait();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

        }


    }

    @Override
    public void update(String eventType, String deplacement) {
    }
}
