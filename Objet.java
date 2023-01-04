public class Objet extends Carte{
    private String nom;
    private int x;
    private int y;
    private String typeObjet;
    private int poids;
    private int effet;
    private String typeEffet;
    private boolean estEquipe;

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

    public String getTypeObjet() {
        return typeObjet;
    }

    public int getPoids() {
        return poids;
    }

    public int getEffet() {
        return effet;
    }

    public String getTypeEffet() {
        return typeEffet;
    }

    public boolean isEquipe() {
        return estEquipe;
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

    public void setTypeObjet(String typeObjet) {
        this.typeObjet = typeObjet;
    }

    public void setPoids(int poids) {
        this.poids = poids;
    }

    public void setEffet(int effet) {
        this.effet = effet;
    }

    public void setTypeEffet(String typeEffet) {
        this.typeEffet = typeEffet;
    }

    public void setEquipe(boolean equipe) {
        estEquipe = equipe;
    }

    public Objet(String nom,int x,int y,String type,int poids, int effet, String typeEffet){
        this.setNom(nom);
        this.setX(x);
        this.setY(y);
        this.setTypeObjet(type);
        this.setPoids(poids);
        this.setEffet(effet);
        this.setTypeEffet(typeEffet);
        this.setEquipe(false);
    };
    public Objet(String nom,String type,int poids, int effet, String typeEffet,Personnage personnage){
        this.setNom(nom);
        this.setTypeObjet(type);
        this.setPoids(poids);
        this.setEffet(effet);
        this.setTypeEffet(typeEffet);
        this.setEquipe(true);
    };
}
