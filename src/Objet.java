public class Objet {
    private String nom;
    private int x;
    private int y;
    public enum TypeObjet {CASQUE,TORSE,GANTS,PANTALON,BOTTES,ARME,SAC}
    private TypeObjet typeObjet;
    private int poids;
    private int effet;
    public enum TypeEffet {ATTAQUE,PROTECTION,SOIN}
    private TypeEffet typeEffet;
    private String portee;
    private boolean estEquipe;
    private boolean estAPortee;
    private Personnage personnage;

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

    public TypeObjet getTypeObjet() {
        return typeObjet;
    }

    public int getPoids() {
        return poids;
    }

    public int getEffet() {
        return effet;
    }

    public TypeEffet getTypeEffet() {
        return typeEffet;
    }

    public String getPortee() {
        return portee;
    }

    public boolean isEquipe() {
        return estEquipe;
    }

    public Personnage getPersonnage() {
        return personnage;
    }
    //setters//


    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setX(int x) {
        this.x = x;
    }

    public void setY(int y) {
        this.y = y;
    }

    public void setTypeObjet(TypeObjet typeObjet) {
        this.typeObjet = typeObjet;
    }

    public void setPoids(int poids) {
        this.poids = poids;
    }

    public void setEffet(int effet) {
        this.effet = effet;
    }

    public void setTypeEffet(TypeEffet typeEffet) {
        this.typeEffet = typeEffet;
    }
    public void setPortee(String portee) {
        this.portee = portee;
    }

    public void estEquipe(boolean equipe) {
        estEquipe = equipe;
    }

    public void setPersonnage(Personnage personnage) {
        this.personnage = personnage;
    }
    //----------------------------------------------------------------------------------------------//




    //----------------------------------------------------------------------------------------------//

    public Objet(Carte carte, String nom, int x, int y, TypeObjet type, int poids, int effet, TypeEffet typeEffet){

        this.setX(carte.getX());
        this.setY(carte.getY());
        carte.addObjet(this);
        this.setNom(nom);
        this.setX(x);
        this.setY(y);
        this.setTypeObjet(type);
        this.setPoids(poids);
        this.setEffet(effet);
        this.setTypeEffet(typeEffet);
        this.estEquipe(false);
    };
    public Objet(String nom,TypeObjet type,int poids, int effet, TypeEffet typeEffet,Personnage personnage){

        this.setNom(nom);
        this.setTypeObjet(type);
        this.setPoids(poids);
        this.setEffet(effet);
        this.setTypeEffet(typeEffet);
        this.estEquipe(true);
        this.setPersonnage(personnage);
    };
    public Objet(String nom,TypeObjet type,Personnage personnage){
        this.setNom(nom);
        this.setTypeObjet(type);
        this.setPoids(0);
        this.setEffet(0);
        // this.setTypeEffet(typeEffet);
        this.estEquipe(true);
        this.setPersonnage(personnage);
    };

    protected boolean calculPortee(int portee,Personnage donneur){
        estAPortee=false;
        int dx=donneur.getX();
        int dy=donneur.getY();
        int rx=this.getX();
        int ry=this.getY();
        if (((dx+portee)==rx||dx==rx||dx-portee==rx)
                &&((dy+portee)==ry||dy==ry||dy-portee==ry))
            estAPortee=true;
        System.err.println("méthode de portée objet a modifier");
        return estAPortee;
    }

/*    public enum typeObjet {
        C("Casque"),
        T("Torse"),
        G("Gants"),
        P("Pantalon"),
        B("Bottes");
    }

        public final String typeEquipement;
        typeObjet(String typeEquipement) {
            this.typeEquipement=typeEquipement;
        }
        public String getTypeEquipement(){
            return this.typeEquipement;
        }*/

}
