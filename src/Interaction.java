public class Interaction  {
    protected Personnage joueur;
    protected Personnage donneur;
    protected Personnage receveur;
    protected String type;
    protected int force;
    protected int portee;
    protected boolean estAPortee;

    public Personnage getJoueur() {
        return joueur;
    }
    public Personnage getDonneur() {
        return donneur;
    }

    public void setDonneur(Personnage donneur) {
        this.donneur = donneur;
    }

    public Personnage getReceveur() {
        return receveur;
    }

    public void setReceveur(Personnage receveur) {
        this.receveur = receveur;
    }

    public String getType() {
        return type;
    }

    public void setJoueur(Personnage joueur) {
        this.joueur = joueur;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getForce() {
        return force;
    }

    public void setForce(int force) {
        this.force = force;
    }

    public int getMaxPortee() {
        return portee;
    }

    public void setMaxPortee(int portee) {
        if (portee==0){this.portee=1;}
        else
        this.portee = portee;
    }
    protected boolean calculPortee(int portee,Personnage donneur, Personnage receveur){
        estAPortee=false;
        int dx=donneur.getX();
        int dy=donneur.getY();
        int rx=receveur.getX();
        int ry=receveur.getY();
        if (((dx+portee)==rx||dx==rx||dx-portee==rx)
                &&((dy+portee)==ry||dy==ry||dy-portee==ry))
            estAPortee=true;
        System.err.println("méthode de portée a modifier");
        return estAPortee;
    }
    public static Personnage getEnnemi(Carte carte){
        //Personnage ennemi = null;
        //Personnage ennemi = carte.getListePersonnage().get(1);
        for (Personnage perso:carte.getListePersonnage()
             ) {
            if (perso.getPv()>0&&perso.getPortee()<= carte.getListePersonnage().get(0).getPortee()&&perso!=carte.getListePersonnage().get(0))
                return perso;
        }
        return null;
    }

    public Interaction(Personnage donneur, Personnage receveur,String type){
        this.setDonneur(donneur);
        this.setReceveur(receveur);
        this.setType(type);
        this.setForce(Math.max(donneur.getDps(), receveur.getDps()));
        this.setMaxPortee(Math.max(donneur.getPortee(), receveur.getPortee()));
        calculPortee(portee,donneur,receveur);
        //   if (calculPortee(portee,donneur,receveur)){
        if(donneur.getPv()>0 && receveur.getPv()>0 && estAPortee){
            receveur.setPv(receveur.getPv()- donneur.getDps());
            System.out.println(String.format("%s à pris un coup dans la gueule, il a pris %d dégats et il lui reste %d points de vie", receveur.getNom(),donneur.getDps(),receveur.getPv() ));
            donneur.setPv(donneur.getPv()- receveur.getDps());
            String message= String.format("%s à pris un coup dans la gueule, il a pris %d dégats et il lui reste %d points de vie",donneur.getNom(),receveur.getDps(),donneur.getPv() );
            System.out.println(message);
           // if (donneur.getPv()<=0 || receveur.getPv()<=0)


        }
        else if (donneur.getPv()>0 && receveur.getPv()>0 && !estAPortee)
            System.out.println(String.format("%s est trop loin, il a %d points de vie et ta portée est de %d IDIOT !", receveur.getNom(),receveur.getPv(),donneur.getPortee()));

    }


}
