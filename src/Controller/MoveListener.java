package Controller;

import Controller.*;
import View.Affichage;
import View.Run;
import com.sun.tools.javac.Main;

class MoveListener implements EventListener {
            private String deplacement;

            public MoveListener(String deplacement) {
                this.deplacement = deplacement;
            }

            @Override
            public void update(String eventType, String deplacement) {
                Run.input= Affichage.input;
                System.out.println("Thread nb"+Thread.currentThread());
                  try {
                   ///TODO   Main.main(Main.compile());
                  }
                  catch (IllegalMonitorStateException e){

                  }
        }
    }
