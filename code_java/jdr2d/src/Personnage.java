import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Personnage extends Point implements EventListenerQuete{
    protected String nomPersonnage;
    protected int pV;
    protected int pvmax;
    protected Race race;
    protected Coffre inventaire;
    protected ArrayList<Arme> armes;
    protected ArrayList<Armure> armure;
    protected ArrayList<Quete> queteSuivie;
    protected ArrayList<Potion> effetpotion;
    protected ArrayList<LocalDateTime> datefin;

    protected ArrayList<EventListenerF> observerF ;


    //getters


    public ArrayList<Quete> getQueteSuivie() {
        return queteSuivie;
    }


    public String getNomPersonnage(){
        return nomPersonnage;
    }

    public int getpV(){
        return pV;
    }

    public int getpVmax(){
        return pvmax;
    }

    public Race getRace(){
        return race;
    }

    public Coffre getInventaire(){
        return inventaire;
    }

    public  ArrayList<Arme> getArme(){
        return armes;
    }

    public ArrayList<Armure> getArmure() {
        return armure;
    }

    public ArrayList<Potion> getEffetpotion() {
        return effetpotion;
    }

    public ArrayList<EventListenerF> getObserverF() {
        return observerF;
    }

    //setters



    public Personnage setQueteSuivie(ArrayList<Quete> queteSuivie) {
        this.queteSuivie = queteSuivie;
        return this;
    }

    public Personnage setRace(Race race) {
        this.race = race;
        return this;
    }

    public Personnage setpV(int pV) {
        if(pV>=this.getpVmax()){
            this.pV=pvmax;
        }
        else {
            this.pV = pV;
        }
        return this;
    }

    public Personnage setPvmax(int pvmax) {
        this.pvmax = pvmax;
        return this;
    }

    public Personnage setNomPersonnage(String nomPersonnage) {
        this.nomPersonnage = nomPersonnage;
        return this;
    }

    public Personnage setInventaire(Coffre inventaire) {
        this.inventaire = inventaire;
        return this;
    }

    public Personnage setdateFin(ArrayList<LocalDateTime> datefin){
        this.datefin=datefin;
        return this;
    }
    // gestion des arrays


    public Personnage addPotion(Potion p){
        this.effetpotion.add(p);
        this.setpV(this.getpV()+p.getEffets()[2]);
        this.setPvmax(this.getpVmax()+p.getEffets()[3]);
        this.datefin.add(LocalDateTime.now().plus(p.getDuree()));
        return this;
    }

    public Personnage removePotion(Potion p){
        int i=this.effetpotion.indexOf(p);
        this.effetpotion.remove(p);
        this.setPvmax(this.getpVmax()-p.getEffets()[3]);
        this.datefin.remove(i-1);
        return this;
    }

    public Personnage addObserver(EventListenerF of){
        this.observerF.add(of);
        return this;
    }

    public Personnage removeObserver(EventListenerF of){
        this.observerF.remove(of);
        return this;
    }

    public Personnage addsQuete(Quete queteaf){
        this.queteSuivie.add(queteaf);
        queteaf.addPersonnage(this);
        for (Objectifs o: queteaf.getObjectifs()) {
            if(o instanceof ObjectifF ){
                this.addObserver((ObjectifF) o);
            }
        }
        return this;
    }

    public Personnage removesQuete(Quete queteaf){
        this.queteSuivie.remove(queteaf);
        return this;
    }

    public Personnage setObserverF(ArrayList<EventListenerF> observerF) {
        this.observerF = observerF;
        return this;
    }

    //addition d'une arme en gérant le nombre de mains équipée

    public Personnage addArme(Arme arme){
        int compteurmain=0;
        for(Arme a:this.getArme()){
            compteurmain=compteurmain+a.getNbrmain();
        }
        if(compteurmain==2){
            if(arme.getNbrmain()==2){
                for (Arme a:this.getArme()) {
                    if(a.nbrmain!=0){
                        this.removeArme(a);
                        this.addObjet(a);
                    }
                }
                this.setArmes(new ArrayList<>(List.of(new Arme("Poing",0,0,0,0))));
                this.armes.add(arme);
            }
            else{
                Arme a=this.armes.get(2);
                this.armes.remove(2);
                this.armes.add(arme);
                this.setInventaire(this.getInventaire().add(a));
            }
        } else if (compteurmain==1 || compteurmain==0) {
            if(arme.getNbrmain()==2){
                for (Arme a:this.getArme()) {
                    if(a.nbrmain!=0){
                        this.removeArme(a);
                        this.addObjet(a);
                    }
                }
                this.setArmes(new ArrayList<>(List.of(new Arme("Poing",0,0,0,0))));
                this.armes.add(arme);
            }
            else{
                this.armes.add(arme);
            }
        }
        this.armes.add(arme);
        return this;
    }

    public Personnage removeArme(Arme arme){
        this.armes.remove(arme);
        this.addObjet(arme);
        return this;
    }

    public Personnage addArmure(Armure armure) {
        boolean emplacementlibre=true;
        Armure armurer=new Armure();
        for(Armure a:this.getArmure()){
            if(a.getTypearmure().equals(armure.getTypearmure())){
                emplacementlibre=false;
                armurer=a;
            }
        }
        if(emplacementlibre) {
            this.removObjet(armure);
            this.armure.add(armure);
        }
        else{
            this.armure.remove(armurer);
            this.armure.add(armure);
        }
        return this;
    }



    public Personnage addObjet(Objet objet){
        this.inventaire.add(objet);
        for (int j=0;j<this.observerF.size();j++) {
            if(observerF.get(j) instanceof ObjectifF){
                if(objet==((ObjectifF) observerF.get(j)).getObjetquete()) {
                    notifyoneEventF(observerF.get(j));
                    this.removeObserver(observerF.get(j));
                }
            }
        }
        return this;
    }

    public Personnage removObjet(Objet objet){
        this.inventaire.remove(objet);
        return this;
    }


    public Personnage removArmure(Armure armure){
        this.armure.remove(armure);
        this.inventaire.add(armure);
        return this;
    }

    public Personnage setArmure(ArrayList<Armure> armure) {
        this.armure = armure;
        return this;
    }

    public Personnage setArmes(ArrayList<Arme> armes) {
        this.armes = armes;
        return this;
    }

    public Personnage setEffetpotion(ArrayList<Potion> effetpotion) {
        this.effetpotion = effetpotion;
        return this;
    }

    //Builders

    public Personnage(){
        super();
        ArrayList<Arme> armedefault=new ArrayList<>(List.of(new Arme("Poing",0,0,0,0)));
        ArrayList<Armure> armuredefault=new ArrayList<Armure>(List.of(new Armure("Peau",0,0,0)));
        this.setArmes(armedefault)
                .setArmure(armuredefault)
                .setNomPersonnage("tki")
                .setPvmax(1)
                .setpV(1)
                .setInventaire(null)
                .setQueteSuivie(null)
                .setRace(null)
                .setdateFin(new ArrayList<LocalDateTime>())
                .setEffetpotion(new ArrayList<Potion>(List.of(new Potion("Systeme digestif",0, new int[]{0, 0, 0, 0} , Duration.of(1000, ChronoUnit.YEARS)))))
                .setObserverF(new ArrayList<>());
    }

    public Personnage(int x, int y, Map lieux, ArrayList<Arme> arme,ArrayList<Armure> armure,String nomPersonnage,int pV,Coffre inventaire,int pVmax,ArrayList<Quete> quetesuivie,Race race){
        super(x,y,lieux);
        this.setArmes(arme)
                .setArmure(armure)
                .setNomPersonnage(nomPersonnage)
                .setPvmax(pVmax)
                .setpV(pV)
                .setInventaire(inventaire)
                .setQueteSuivie(quetesuivie)
                .setRace(race)
                .setdateFin(new ArrayList<LocalDateTime>())
                .setEffetpotion(new ArrayList<Potion>(List.of(new Potion("Systeme digestif",0, new int[]{0, 0, 0, 0} , Duration.of(10000000, ChronoUnit.HOURS)))))
                .setObserverF(new ArrayList<>());
    }

    public Personnage( ArrayList<Arme> arme,ArrayList<Armure> armure,String nomPersonnage,int pV,Coffre inventaire,int pVmax,ArrayList<Quete>  quetesuivie,Race race)
    {
        this.setArmes(arme)
                .setArmure(armure)
                .setNomPersonnage(nomPersonnage)
                .setPvmax(pVmax)
                .setpV(pV)
                .setInventaire(inventaire)
                .setQueteSuivie(quetesuivie)
                .setRace(race)
                .setdateFin(new ArrayList<LocalDateTime>())
                .setEffetpotion(new ArrayList<Potion>(List.of(new Potion("Systeme digestif",0, new int[]{0, 0, 0, 0} , Duration.of(100000, ChronoUnit.DAYS)))))
                .setObserverF(new ArrayList<>());
    }



    //methodes

    public int bagarre(Personnage opposant){
        int reduopp=0;
        ArrayList<Armure> equipopp;
        int deg=0;
        //il faudra revenir sur les potions
        for (Armure a:opposant.getArmure()) {
            reduopp = a.getRedudeg()+ reduopp;
        }
        for (Armure ap : this.getArmure()) {
            deg =  ap.getDeg() + deg;
        }
        for (Arme ar : opposant.getArme()) {
            reduopp = ar.getRedudeg() + reduopp;
        }
        for(Arme arp:this.getArme()) {
            deg = arp.getDeg() + deg;
        }
        if(deg-reduopp<=0){
            return 1;
        }
        else{
            return deg-reduopp;
        }
    }

    public void notifyoneEventF(EventListenerF ef){
        ef.update();
    }

    @Override
    public void update(Quete q) {
        this.removesQuete(q);
        System.out.println("Felicitation vous avez accompli la quete : "+q.getNomQuete()+"et obtenu les récompenses");
        for (Objet o: q.getRecompenses()) {
            this.addObjet(o);
           System.out.println(o.getNomObjet());
        }
    }
}
