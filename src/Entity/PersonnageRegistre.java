package Entity;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class PersonnageRegistre {
    private static final PersonnageRegistre instance = new PersonnageRegistre();

    public static PersonnageRegistre getInstance(){
        return instance;
    }

    private final Map<String, Personnage> listePersonnage;

    private PersonnageRegistre(){
        listePersonnage = new ConcurrentHashMap<>();
    }

    public Personnage addPersonnage(Personnage carte) {
        System.out.printf("Entity.Personnage %s ajoutée %s",carte.getNom(),System.lineSeparator());
        return listePersonnage.put(carte.getNom(),carte);
    }

    public Personnage getPersonnage(String nom){
        return listePersonnage.get(nom);
    }
    public boolean containsPersonnage(String nom){
        return listePersonnage.get(nom) != null;
    }

}
