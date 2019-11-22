class Scene {
  ArrayList<GameObject> sceneObjects;
  private PImage background;

  Scene(ArrayList<GameObject> scene) {
    sceneObjects = scene;
  }

  void setBackground(String path){
    background = loadImage(path);
  }
  
  void display() {
    if(background !=null){
      image(background,0,0, width,height);
    }else{
      background(255);
    }

    for ( GameObject obj : sceneObjects) {
      IDisplayable objectToDisplay = (IDisplayable)obj;
      if (obj !=null) {
        objectToDisplay.display();
      }
    }
    debugColliders(false);
  }
  
  void debugColliders(boolean debug) {
    if (debug) {
      for ( GameObject obj : sceneObjects) {
        obj.collider.displayCollider();
      }
    }
  }
}
