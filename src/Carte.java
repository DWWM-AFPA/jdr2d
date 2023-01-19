import java.util.ArrayList;

public class Carte {
    private String nom;
    private String description;
    private final int[] taille;
    private String[][] dessinCarte;

    private ArrayList<Personnage> listePersonnage = new ArrayList<Personnage>();
    private ArrayList<Objet> listeObjet = new ArrayList<Objet>();
    //getters//
    public String getNom() {
        return nom;
    }

    public String getDescription() {
        return description;
    }

    public int[] getTaille() {
        return taille;
    }

    public String[][] getDessinCarte() {
        return dessinCarte;
    }

    public int getX() {
        return taille[0];
    }
    public int getY() {
        return taille[1];
    }

    public ArrayList<Personnage> getListePersonnage() {
        return listePersonnage;
    }

    public ArrayList<Objet> getListeObjet() {
        return listeObjet;
    }
    //setters//

    public void setNom(String nom) {
        this.nom = nom;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public void addPersonnage(Personnage personnage) {
        this.listePersonnage.add(personnage);
    }

    public void addObjet(Objet Objet) {
        this.listeObjet.add(Objet);
    }

    public Carte(){
        this.setNom("defaut");
        this.setDescription("description par défaut");
        this.taille = new int[]{2,2};
        this.dessinCarte=new String[2][2];
        CarteRegistre.getInstance().getCarte("defaut");
        CarteRegistre.getInstance().addCarte(this);
    }

    public Carte(String nom,String description,int tailleX,int tailleY) {
        this.setNom(nom);
        this.setDescription(description);
        this.taille = new int[]{tailleX,tailleY};
        this.dessinCarte=new String[tailleX][tailleY];
       // CarteRegistre.getInstance().getCarte("defaut");
         CarteRegistre.getInstance().addCarte(this);
    }

    public void dessinerCarte(){
        int x = this.getX();
        int y = this.getY();
        String[][] result=new String[x][y];
        for (int i = 0; i < x ; i++) {
            for (int j = 0; j < y ; j++) {
/*                if (player.getX()==i && player.getY()==j)//position player
                {result[j][i] = "P";}*/

                result[i][j] = " ";

            }
        }
        this.dessinCarte=result;
    }

    public String afficherCarte(Personnage player){
        //    listerPersonnage();
        String retour = "";
        for (Personnage perso : this.listePersonnage) {
            if (perso.getPv()>0)
            dessinCarte[perso.getY()-1][perso.getX()-1] = perso.getNom().substring(0,1).toUpperCase();
        }
        for (Objet objet : this.listeObjet) {
            if (!objet.isEquipe())
            dessinCarte[objet.getY()-1][objet.getX()-1] = objet.getNom().substring(0,1);
        }
        //   dessinCarte[player.getY()-1][player.getX()-1] = "P";
        for (String[] t: this.getDessinCarte()) {
            for (String u:t) {
                retour+=u;
              //  System.out.print(u);

            }
            retour+="\n";//System.lineSeparator();
           // System.out.println();
        }
        return retour;
    }
    public void listerPersonnage() {
        for (Personnage perso : this.listePersonnage) {
            String result = String.format("%s à %s de PV et %s de DPS",perso.getNom(),perso.getPv(),perso.getDps());
            System.err.println(result);
            perso.afficherEquipement();
        }
    }
}
