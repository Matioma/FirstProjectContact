import java.util.Collections;

class World {
  public int sceneIndex =1;

  //public Scene[] scene ;
  ArrayList<Scene> scenes = new ArrayList<Scene>(); 

  PlayerController playerController;
  ArrayList<GameObject> sceneObjects = new ArrayList<GameObject>();

  World() {
    playerController = new PlayerController(this);

    setupScene0();
    setupScene1();
    setupScene2();
  }

  void update() {
    playerController.update();
  }

  void display() {
    try {
      scenes.get(sceneIndex).display();
    }
    catch(Exception e) {
      println("Failed to displat a scene with index");
    }
    
  }


  IInteractable getClickedObject() {
    Scene currentScene;

    try {
      currentScene = scenes.get(sceneIndex);
    }
    catch(Exception e) {
      println("Scene with Index does not exist");
      currentScene = null;
    }

    if (currentScene != null) {

      for (int i=currentScene.sceneObjects.size()-1; i>=0; i--) {
        GameObject obj = currentScene.sceneObjects.get(i);
        if (obj.collider.isMouseOver()) {
          try {
            IInteractable clickedObject = (IInteractable)obj;
            return clickedObject;
          }
          catch(Exception e) {
            println("Failed to cast to clicked object");
          }
        }
      }
    }
    return null;
  }

  void debugColliders(boolean debug) {
    if (debug) {
      for ( GameObject obj : sceneObjects) {
        obj.collider.displayCollider();
      }
    }
  }



  void setupScene0(){
     sceneObjects = new ArrayList<GameObject>();


    Collections.sort(sceneObjects);
    scenes.add(new Scene(sceneObjects));
  }

  void setupScene1() {
    sceneObjects = new ArrayList<GameObject>();

    sceneObjects.add(new Vase(new PVector(width/2-width/7, height/2-30), 50, 50, "Data/vase_vector.png"));
    sceneObjects.get(0).setLayer(1);
    sceneObjects.add(new Note(new PVector(width/2-width/7, height/2-30)));
    sceneObjects.get(1).setLayer(-2);

    Collections.sort(sceneObjects);
    scenes.add(new Scene(sceneObjects));
  }

  void setupScene2() {
    sceneObjects = new ArrayList<GameObject>();

    sceneObjects.add(new UIElement(new PVector(width/4, height/4), width/2, height/2));
    sceneObjects.get(0).setLayer(1);

    Collections.sort(sceneObjects);
    scenes.add(new Scene(sceneObjects));
  }
  

  void drawScene1() {
    background(255);
    push();
    fill(#DE9F00);
    rect(width/2-width/5, height/2, width/5, 30); 
    pop();


    for ( GameObject obj : sceneObjects) {
      IDisplayable objectToDisplay = (IDisplayable)obj;
      if (obj !=null) {
        objectToDisplay.display();
      }
    }
    debugColliders(false);
  }

  void setSceneNumber(int scene) {
    sceneIndex = scene;
  }


  void drawScene2() {
    push();


    //background(255);    
    String message = "Default Text";
    rect(width/4, height/4, width/2, height/2);
    text(message, width/4, height/2);


    pop();
  }
}
