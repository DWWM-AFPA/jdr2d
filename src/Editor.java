public class Editor {
    public EventManager events;

    public Editor() {
        this.events = new EventManager("deplacement","input");
    }

    public void MoveListener(String deplacement) {

        events.notify("deplacement",deplacement);
    }
    public void newInput(String input) {

        events.notify("input",input);
        Run run = new Run();
        run.run();
        run=null;
    }

}
