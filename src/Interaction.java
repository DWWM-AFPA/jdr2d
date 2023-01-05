public class Interaction  {
    protected Personnage donneur;
    protected Personnage receveur;
    protected String type;
    protected int force;
    protected int portee;
    protected boolean estAPortee;

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

    public void setType(String type) {
        this.type = type;
    }

    public int getForce() {
        return force;
    }

    public void setForce(int force) {
        this.force = force;
    }

    public int getPortee() {
        return portee;
    }

    public void setPortee(int portee) {
        this.portee = portee;
    }
    protected boolean calculPortee(int portee,Personnage donneur, Personnage receveur){
        estAPortee=false;
        int dx=donneur.getX();
        int dy=donneur.getY();
        int rx=receveur.getX();
        int ry=receveur.getY();
        if (((dx+1)==rx||dx==rx||dx-1==rx)
                &&((dy+1)==ry||dy==ry||dy-1==ry))
            estAPortee=true;
        return estAPortee;
    }
    public Interaction(Personnage donneur, Personnage receveur,String type){
        this.setDonneur(donneur);
        this.setReceveur(receveur);
        this.setType(type);
        this.setForce(Math.max(donneur.getDps(), receveur.getDps()));
        this.setPortee(Math.max(donneur.getPortee(), receveur.getPortee()));
        calculPortee(portee,donneur,receveur);
        //   if (calculPortee(portee,donneur,receveur)){
        while(donneur.getPv()>0 && receveur.getPv()>0 && estAPortee){
            receveur.setPv(receveur.getPv()- donneur.getDps());
            System.out.println(String.format("%s à pris un coup dans la gueule, il a pris %d dégats et il lui reste %d points de vie", receveur.getNom(),donneur.getDps(),receveur.getPv() ));
            donneur.setPv(donneur.getPv()- receveur.getDps());
            String message= String.format("%s à pris un coup dans la gueule, il a pris %d dégats et il lui reste %d points de vie",donneur.getNom(),receveur.getDps(),donneur.getPv() );
            System.out.println(message);
            if (donneur.getPv()<=0 || receveur.getPv()<=0)
                break;

        }

    }


}
