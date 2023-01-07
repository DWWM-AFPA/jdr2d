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
            case ("taper"):
                Interaction combat = new Interaction(player, Interaction.getEnnemi(carte), "combat");
                System.out.println(player.getNom() + "se reste en " + player.getX() + " " + player.getY());
                break;
            case ("ramasser"):
                System.out.println("le joueur ramasse un objet, non implémenté");
                break;
            default:
                //le joueur se déplace d'une case dans la direction de input
                player.deplacer(input);
                break;
        }
        carte.dessinerCarte();       //calcul de la carte
        carte.afficherCarte(player); //affiche la carte dans le terminal
        System.out.println(player.getNom() + "se déplace en " + player.getX() + " " + player.getY());
    }

    @Override
    public void update(String eventType, String deplacement) {
    }
}
