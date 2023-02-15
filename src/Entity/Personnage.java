package Entity;

public class Personnage implements Position{
    protected String nom;
    protected int[] pos;
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
  //  protected String deplacement;


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
    public Objet getSac() {
        return sac;
    }


    public Carte getCarte() {
        return carte;
    }

/*    public String getDeplacement() {
        if(this.deplacement==null){
            this.deplacement="";
        }
        return deplacement;
    }*/
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
    public void setSac(Objet sac) {
        this.sac = sac;
    }

    public void setCasque() {
        this.casque = new Objet("casquette", Objet.TypeObjet.CASQUE,this);
    }
    public void setTorse() {
        this.torse = new Objet("tee-shirt", Objet.TypeObjet.TORSE,this);
    }
    public void setGants() {
        this.gants = new Objet("jean", Objet.TypeObjet.PANTALON,this);
    }
    public void setPantalon() {
        this.pantalon = new Objet("sandalles", Objet.TypeObjet.BOTTES,this);
    }
    public void setBottes() {
        this.bottes = new Objet("mains-nues", Objet.TypeObjet.GANTS,this);
    }
    public void setArme() {
        this.arme = new Objet("mains-nues", Objet.TypeObjet.ARME,this);
    }
    public void setSac() {
        this.sac = sac;
    }
    public void setCarte(Carte carte) {
        this.carte = carte;
        this.carte.addPersonnage(this);
    }
    public void setPosition(int[] pos) {
        this.setX(pos[0]);
        this.setY(pos[1]);
    }

    public Personnage(Carte carte, String pos, int pv, int dps){
        this.setCarte(carte);
        this.carte.addPersonnage(this);
        setPosition(decodePosition(pos));
        this.setNom("animal");
        this.setPv(pv);
        this.setDps(dps);
    }
    public Personnage(Carte carte, String pos, String nom, int pv, int dps){
        this.setCarte(carte);
        setPosition(decodePosition(pos));
        this.setNom(nom);
        this.setPv(pv);
        this.setDps(dps);
        this.setCasque();
        this.setTorse();
        this.setPantalon();
        this.setBottes();
        this.setGants();
        this.setArme();
        this.setPortee(1);
    }
    public Personnage(Carte carte, String pos, String nom, int pv, int dps,Objet casque,Objet torse, Objet gants, Objet pantalon, Objet bottes){
        this.setCarte(carte);
        setPosition(decodePosition(pos));
        this.setNom(nom);
        this.setPv(pv);
        this.setDps(dps);
        this.equiperPersonnage(casque);
        this.equiperPersonnage(torse);
        this.equiperPersonnage(gants);
        this.equiperPersonnage(pantalon);
        this.equiperPersonnage(bottes);
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
        Objet.TypeObjet typeObjet=objet.getTypeObjet();
        switch (typeObjet){
            case CASQUE :
                modfierObjetEquipe(objet);
                this.setCasque(objet);
                this.setPv(this.getPv()+objet.getEffet());
                break;
            case GANTS :
                modfierObjetEquipe(objet);
                this.setGants(objet);
                this.setPv(this.getPv()+objet.getEffet());
                break;
            case TORSE:
                modfierObjetdesequipe(objet);
                this.setTorse(objet);
                this.setPv(this.getPv()+objet.getEffet());
                break;
            case PANTALON :
                modfierObjetEquipe(objet);
                this.setPantalon(objet);
                this.setPv(this.getPv()+objet.getEffet());
                break;
            case BOTTES:
                modfierObjetEquipe(objet);
                this.setBottes(objet);
                this.setPv(this.getPv()+objet.getEffet());
                break;
            case ARME :
                modfierObjetEquipe(objet);
                this.setArme(objet);
                this.setDps(this.getDps()+objet.getEffet());
                break;
            case SAC :
                modfierObjetEquipe(objet);
                this.setSac(objet);
                System.err.println("l'équipement du sac n'a pas d'effet implémenté");
                break; /**/
            default:
                System.err.print("erreur à l'équipement : "+objet);
        }
        return this;
    }

    public Personnage desequiperPersonnage(Objet objet){
        Objet.TypeObjet typeObjet=objet.getTypeObjet();
        switch (typeObjet){
            case CASQUE:
                modfierObjetdesequipe(objet);
                this.setCasque();
                this.setPv(this.getPv()-objet.getEffet());
                break;
            case GANTS :
                modfierObjetdesequipe(objet);
                this.setGants();
                this.setPv(this.getPv()-objet.getEffet());
                break;
            case TORSE:
                modfierObjetdesequipe(objet);
                this.setTorse();
                this.setPv(this.getPv()-objet.getEffet());
                break;
            case PANTALON:
                modfierObjetdesequipe(objet);
                this.setPantalon();
                this.setPv(this.getPv()-objet.getEffet());
                break;
            case BOTTES:
                modfierObjetdesequipe(objet);
                this.setBottes();
                this.setPv(this.getPv()-objet.getEffet());
                break;
            case ARME :
                modfierObjetdesequipe(objet);
                this.setArme();
                this.setDps(this.getDps()-objet.getEffet());
                break;
            case SAC :
                modfierObjetEquipe(objet);
                this.setSac();
                System.err.println("le déséquipement du sac n'a pas d'effet implémenté");
                break; /**/
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
      //  System.out.println("Ecrire Z Q S D pour se déplacer "+System.lineSeparator()+ "A pour attendre"+System.lineSeparator()+ "L pour quitter");
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
            case "l":
                break;
            default :
                System.err.println("Entrée incorrecte");
                break;
        }


        return this;
    }

    public void afficherEquipement(){
        System.out.println(String.format("le personnage '%s' est équipé d'un casque '%s' de gants '%s', de torse '%s',de pantalon '%s', de bottes '%s' et d'une arme '%s'",
                this.getNom(),this.getCasque().getNom(),this.getGants().getNom(),this.getTorse().getNom(),this.getPantalon().getNom(),this.getBottes().getNom(),this.getArme().getNom()));
    }

}
