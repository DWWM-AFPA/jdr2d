package Jdr_2D_Simple;

public abstract class Objet extends Monde implements Visitable{
    //Menmbres
    protected String nomObjet;
    protected String descriptionObjet;
    protected int prixObjet;
    protected boolean ouvertObjet;
    protected int quantiteObjet;
    protected int poidsObjet;
    protected boolean recompenseObjet;
    protected boolean queteObjet;

    protected Materiel materielObjet;

    //Getter et Setter
    public String getNomObjet(){
        return nomObjet;
    }

    public Objet setNomObjet(String nomObjet){
        this.nomObjet = nomObjet;
        return this;
    }

    public String getDescriptionObjet(){
        return descriptionObjet;
    }

    public Objet setDescriptionObjet(String descriptionObjet){
        this.descriptionObjet = descriptionObjet;
        return this;
    }

    public int getPrixObjet(){
        return prixObjet;
    }

    public Objet setPrixObjet(int prixObjet){
        this.prixObjet = prixObjet;
        return this;
    }

    public boolean getOuvertObjet(){
        return ouvertObjet;
    }

    public Objet setOuvertObjet(boolean ouvertObjet){
        this.ouvertObjet = ouvertObjet;
        return this;
    }

    public int getQuantiteObjet(){
        return quantiteObjet;
    }

    public Objet setQuantiteObjet(int quantiteObjet){
        this.quantiteObjet = quantiteObjet;
        return this;
    }

    public int getPoidsObjet(){
        return poidsObjet;
    }

    public Objet setPoidsObjet(int poidsObjet){
        this.poidsObjet = poidsObjet;
        return this;
    }

    public boolean getRecompenseObjet(){
        return recompenseObjet;
    }

    public Objet setRecompenseObjet(boolean recompenseObjet){
        this.recompenseObjet = recompenseObjet;
        return this;
    }

    public boolean getQueteObjet(){
        return queteObjet;
    }

    public Objet setQueteObjet(boolean queteObjet){
        this.queteObjet = queteObjet;
        return this;
    }

    public Materiel getMaterielObjet(){
        return materielObjet;
    }

    public Objet setMaterielObjet(Materiel materielObjet) {
        this.materielObjet = materielObjet;
        return this;
    }

    public Objet(String nomObjet, int prixObjet, int quantiteObjet, int poidsObjet, boolean recompenseObjet, boolean queteObjet, int xPosition, int yPosition) {
        super(xPosition, yPosition);
        this.nomObjet = nomObjet;
        this.prixObjet = prixObjet;
        this.poidsObjet = poidsObjet;
        this.recompenseObjet = recompenseObjet;
        this.queteObjet = queteObjet;
        this.quantiteObjet = quantiteObjet;
    }

    public Object accept(Visitor v){
        return v.visit(this);
    }
}
