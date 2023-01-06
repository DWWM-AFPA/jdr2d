    class MoveListener implements EventListener {
            private String deplacement;

            public MoveListener(String deplacement) {
                this.deplacement = deplacement;
            }

            @Override
            public void update(String eventType, String deplacement) {
            System.err.println("listnener marche dans movelist ");
            Run.input=deplacement;
            Main.jeu.start();
        }
    }
