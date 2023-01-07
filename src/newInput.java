public class newInput implements EventListener{

    private String input;

    public newInput(/*String input*/) {
        //this.input = input;
    }

    @Override
    public void update(String eventType, String input) {
      //  Run.input=Affichage.input;
        System.out.println(input);
   /*     try {Main.jeu.run();}
        catch (IllegalMonitorStateException e){

        }*/
    }
}
