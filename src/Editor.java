public class Editor {
    public EventManager events;

    public Editor() {
        this.events = new EventManager("deplacement");
    }

    public void MoveListener(String deplacement) {

        events.notify("deplacement","editor");
    }
}
