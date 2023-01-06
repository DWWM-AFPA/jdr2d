public class Personnage {
    protected String nom;
    protected int x;
    protected int y;
    protected int pv;
    protected int dps;
    protected int portee;
    protected int inventaire;
    protected Objet sac;
    protected Objet casque;
    protected Objet torse;
    protected Objet gants;
    protected Objet pantalon;
    protected Objet bottes;
    protected Objet arme;
    protected Carte carte;
    protected String deplacement;


    //getters//

    public String getNom() {
        return nom;
    }
    public int getX() {
        return x;
    }
    public int getY() {
        return y;
    }
    public int getPv() {
        if (pv<=0){
            System.out.println(String.format("%s est mort",this.getNom()));
            if (this.getNom().toLowerCase().equals("player"))
                System.out.println("Perdu, jeu terminé");
            // this=null ;
            // break;
        }
        return pv;
    }
    public int getDps() {
        return dps;
    }
    public int getPortee() {
        return portee;
    }
    public int getInventaire() {
        return inventaire;
    }
    public Objet getCasque() {
        return casque;
    }
    public Objet getTorse() {
        return torse;
    }
    public Objet getGants() {
        return gants;
    }
    public Objet getPantalon() {
        return pantalon;
    }
    public Objet getBottes() {
        return bottes;
    }
    public Objet getArme() {
        return arme;
    }
    public Carte getCarte() {
        return carte;
    }

    public String getDeplacement() {
        if(this.deplacement==null){
            this.deplacement="";
        }
        return deplacement;
    }
    //setters//

    public void setNom(String nom) {
        this.nom = nom;
    }
    public void setX(int x) {
        boolean b = x > 0 && x <= carte.getTaille()[1] ;
        if (b)
            this.x = x;
    }
    public void setY(int y) {
        boolean b = y > 0 && y <= carte.getTaille()[0] ;
        if (b)
            this.y = y;
    }
    public void setPv(int pv) {
        this.pv = pv;
    }
    public void setDps(int dps) {
        this.dps = dps;
    }
    public void setPortee(int portee) {
        this.portee = portee;
    }
    public void setInventaire(int inventaire) {
        this.inventaire = inventaire;
    }
    public void setCasque(Objet casque) {
        this.casque = casque;
    }
    public void setTorse(Objet torse) {
        this.torse = torse;
    }
    public void setGants(Objet gants) {
        this.gants = gants;
    }
    public void setPantalon(Objet pantalon) {
        this.pantalon = pantalon;
    }
    public void setBottes(Objet bottes) {
        this.bottes = bottes;
    }
    public void setArme(Objet arme) {
        this.arme = arme;
    }
    public void setCarte(Carte carte) {
        this.carte = carte;
    }
    public void setDeplacement(String deplacement) {
        this.deplacement = deplacement;
    }

    public Personnage(Carte carte, int x, int y, String nom, int pv, int dps){
        this.setCarte(carte);
        this.carte.addPersonnage(this);
        this.setX(x);
        this.setY(y);
        this.setNom(nom);
        this.setPv(pv);
        this.setDps(dps);
        this.setCasque(new Objet("casquette","casque",this));
        this.setTorse(new Objet("tee-shirt","casque",this));
        this.setPantalon(new Objet("jean","casque",this));
        this.setBottes(new Objet("sandalles","casque",this));
        this.setGants(new Objet("mains-nues","gants",this));
        this.setArme(new Objet("mains-nues","arme",this));
    }
    public Personnage(Carte carte, int x, int y, String nom, int pv, int dps,Objet casque,Objet torse, Objet gants, Objet pantalon, Objet bottes){
        this.setCarte(carte);
        this.carte.addPersonnage(this);
        this.setX(x);
        this.setY(y);
        this.setNom(nom);
        this.setPv(pv);
        this.setDps(dps);
        this.equiperPersonnage(casque);
        this.equiperPersonnage(torse);
        this.equiperPersonnage(gants);
        this.equiperPersonnage(pantalon);
        this.equiperPersonnage(bottes);
    }
    public Personnage(Carte carte,int x, int y, int pv, int dps){
        this.setCarte(carte);
        this.carte.addPersonnage(this);
        this.setX(x);
        this.setY(y);
        this.setNom("animal");
        this.setPv(pv);
        this.setDps(dps);
    }
    public void modfierObjetEquipe(Objet objet) {
        objet.setX(0);
        objet.setY(0);
        objet.estEquipe(true);
        objet.setPersonnage(this);
    }

    public void modfierObjetdesequipe(Objet objet) {
        objet.setX(this.getX());
        objet.setY(this.getY());
        objet.estEquipe(false);
        objet.setPersonnage(null);
    }
    public Personnage equiperPersonnage(Objet objet){
        String TypeObjet=objet.getTypeObjet().toLowerCase();
        switch (TypeObjet){
            case "casque" :
                modfierObjetEquipe(objet);
                this.setCasque(objet);
                this.setPv(this.getPv()+objet.getEffet());
                break;
            case "gants" :
                modfierObjetEquipe(objet);
                this.setGants(objet);
                this.setPv(this.getPv()+objet.getEffet());
                break;
            case "torse" :
                modfierObjetdesequipe(objet);
                this.setTorse(new Objet("tee-shirt","casque",this));
                break;
            case "pantalon" :
                modfierObjetEquipe(objet);
                this.setPantalon(objet);
                this.setPv(this.getPv()+objet.getEffet());
                break;

            case "bottes" :
                modfierObjetEquipe(objet);
                this.setBottes(objet);
                this.setPv(this.getPv()+objet.getEffet());
                break;
            case "arme" :
                modfierObjetEquipe(objet);
                this.setArme(objet);
                this.setDps(this.getDps()+objet.getEffet());
                break;
            /*case "sac" :
                modfierObjetEquipe(objet);
                this.setSac(objet);
                break; /**/
            default:
                System.out.print("erreur à l'équipement");
        }
        return this;
    }

    public Personnage desequiperPersonnage(Objet objet){
        String TypeObjet=objet.getTypeObjet().toLowerCase();
        switch (TypeObjet){
            case "casque" :
                modfierObjetdesequipe(objet);
                this.setCasque(new Objet("casquette","casque",this));
                this.setPv(this.getPv()-objet.getEffet());
                break;
            case "gants" :
                modfierObjetdesequipe(objet);
                this.setGants(new Objet("mains-nues","gants",this));
                this.setPv(this.getPv()-objet.getEffet());
                break;
            case "torse" :
                modfierObjetdesequipe(objet);
                this.setTorse(new Objet("tee-shirt","casque",this));
                this.setPv(this.getPv()-objet.getEffet());
                break;
            case "pantalon" :
                modfierObjetdesequipe(objet);
                this.setPantalon(new Objet("jean","casque",this));
                this.setPv(this.getPv()-objet.getEffet());
                break;
            case "bottes" :
                modfierObjetdesequipe(objet);
                this.setBottes(new Objet("sandalles","casque",this));
                this.setPv(this.getPv()-objet.getEffet());
                break;
            case "arme" :
                modfierObjetdesequipe(objet);
                this.setArme(new Objet("mains-nues","arme",this));
                this.setDps(this.getDps()-objet.getEffet());
                break;
            /*case "sac" :
                modfierObjetdesequipe(objet);
                this.setSac(objet);
                break; /**/
            default:
                System.out.print("erreur à l'équipement");
        }
        return this;
    }


    public Personnage deplacer(String input){
        System.out.println("Ecrire Z Q S D pour se déplacer "+System.lineSeparator()+ "A pour attendre"+System.lineSeparator()+ "L pour quitter");
        switch (input) {
            case "z" :
                this.setY(this.getY() - 1);
                break;
            case "s" :
                this.setY(this.getY() + 1);
                break;
            case "q" :
                this.setX(this.getX() - 1);
                break;
            case "d":
                this.setX(this.getX() + 1);
                break;
            case "a":
                break;
            default :
                System.out.println("Entrée incorrecte");
                break;
        }


        return this;
    }

    public void afficherEquipement(){
        System.out.println(String.format("le personnage '%s' est équipé d'un casque '%s' de gants '%s', de torse '%s',de pantalon '%s', de bottes '%s' et d'une arme '%s'",
                this.getNom(),this.getCasque().getNom(),this.getGants().getNom(),this.getTorse().getNom(),this.getPantalon().getNom(),this.getBottes().getNom(),this.getArme().getNom()));
    }

}
