import Jdr_2D_Simple.*;

public class Main {
    public static void main(String[] args) {

        Position position = new Position();

        Lieu lieu = new Lieu("Adamantia",  position.getxPosition(), position.getyPosition(), 20, 20);

        System.out.println(lieu.getNomLieu());
        System.out.println(lieu);


        Arme arme = new Arme(new Objet("Epee Excalibure", 5, 1, 2, false, false, 0, 0), new EffetAttaque("Base", 0, 1, 0, false, false, 1, -1, 0, 0));
        EffetAttaque attaqueFeu = new EffetAttaque("Attaque Feu", 0, 1, 0, false, false, 2, -1, 0, 0);
        EffetAttaque attaqueGlace = new EffetAttaque("Attaque Glace", 0, 1, 0, false, false, 4, -1, 0, 0);
        arme.add(attaqueFeu);
        arme.add(attaqueGlace);

        Armure armure = new Armure(new Objet("Armure de mithril", 10, 1, 4, false, false, 0, 0), new EffetProtection("Base", 0, 1, 0, false, false, 5, -1, 0, 0));
        EffetProtection defenseFeu = new EffetProtection("Defense Feu", 0, 1, 0, false, false, 2, -1, 0, 0);
        EffetProtection defenseGlace = new EffetProtection("Defense Glace", 0, 1, 0, false, false, 4, -1, 0, 0);
        armure.add(defenseFeu);
        armure.add(defenseGlace);

        Materiel potion = new Materiel("Potion de poison", new EffetAttaque("Poison", 2, 1, 1, false, false, 1, 60, 0, 0));
        EffetAttaque immobilisation = new EffetAttaque("Immmobilisation", 0, 1, 0, false, false, 0, 30, 0, 0);
        potion.addAttaque(immobilisation);

        String potionEffet = "";
        for (EffetAttaque myEffet : potion.getAttaque()){
            System.out.println(myEffet.getNomObjet());
            potionEffet += myEffet.getNomObjet() + " avec " + myEffet.getDegat() + " de dégât et d'une durée de " + myEffet.getDuree() + " ";
        }

        System.out.println(potion.getNomMateriel()
                + " avec un effet de "
                + potionEffet);

        Objet corde =  new Objet("Corde", 2, 1, 1, false, false, 0, 0);

        System.out.println(arme.getEffet());
        System.out.println(corde.getQuantiteObjet() + " " + corde.getNomObjet() + " avec une poids de " + corde.getPoidsObjet() + " kg et coûte " + corde.getPrixObjet() + " or ");

        String epeeExcalibure = "";
        for (EffetAttaque myEffet : arme.getEffet()) {
            System.out.println(myEffet.getNomObjet());
            epeeExcalibure += " et " +  myEffet.getDegat() + " de dégât de " + myEffet.getNomObjet();
        }
        System.out.println(" 'quantité' "
                + arme.getQuantiteObjet()
                + " " + arme.getNomObjet()
                + " qui coûte "
                + arme.getPrixObjet()
                + " pièces d'or et qui n'est ni une récompense ("
                + arme.getRecompenseObjet()
                + ") ni un objet de quête ("
                + arme.getQueteObjet()
                + ") avec"
                + epeeExcalibure);

        String armureMithril = "";
        for (EffetAttaque myEffet : arme.getEffet()) {
            System.out.println(myEffet.getNomObjet());
            armureMithril += " et " +  myEffet.getDegat() + " de défense de " + myEffet.getNomObjet();
        }
        System.out.println(" 'quantité' "
                + armure.getQuantiteObjet()
                + " " + armure.getNomObjet()
                + " qui coûte "
                + armure.getPrixObjet()
                + " pièces d'or et qui n'est ni une récompense ("
                + armure.getRecompenseObjet()
                + ") ni un objet de quête ("
                + armure.getQueteObjet()
                + ") avec"
                + armureMithril);
    }
}