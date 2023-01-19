import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class CarteRegistre {
    private static final CarteRegistre instance = new CarteRegistre();

    public static CarteRegistre getInstance(){
        return instance;
    }

    private final Map<String,Carte> listeCarte;

    private CarteRegistre(){
        listeCarte = new ConcurrentHashMap<>();
    }

    public Carte addCarte(Carte carte) {
        return listeCarte.put(carte.getNom(),carte);
    }

    public Carte getCarte(String nom){
        return listeCarte.get(nom);
    }
    public boolean containsCarte(String nom){
        return listeCarte.get(nom) != null;
    }

}
