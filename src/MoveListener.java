    class MoveListener implements EventListener {
            private String deplacement;

            public MoveListener(String deplacement) {
                this.deplacement = deplacement;
            }

            @Override
            public void update(String eventType, String deplacement) {
                Run.input=Affichage.input;
                System.out.println("Thread nb"+Thread.currentThread());
                  try {Main.jeu.run();}
                  catch (IllegalMonitorStateException e){

                  }
        }
    }
