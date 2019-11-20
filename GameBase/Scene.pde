class Scene {
  ArrayList<GameObject> sceneObjects;


  Scene(ArrayList<GameObject> scene) {
    sceneObjects = scene;
  }

  void display() {
    background(255);
    /*push();
    fill(#DE9F00);
    rect(width/2-width/5, height/2, width/5, 30); 
    pop();*/


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
