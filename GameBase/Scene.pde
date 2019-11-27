class Scene {
  ArrayList<GameObject> sceneObjects;
  private PImage background;
  private boolean justChanged=false;


  private float alpha =255;


  Scene(ArrayList<GameObject> scene) {
    sceneObjects = scene;
  }

  void setBackground(String path) {
    background = loadImage(path);
    alpha=255;
  }

  void display() {
    if (background !=null) {
      //smooth();
      image(background, 0, 0, width, height);
    } else {
      background(255);
    }



    for ( GameObject obj : sceneObjects) {
      IDisplayable objectToDisplay = (IDisplayable)obj;
      if (obj !=null) {
        objectToDisplay.display();
      }
    }
    debugColliders(false);


    push();
    fill(0, 0, 0,alpha);
    rect(0, 0, width, height);
    pop();


    alpha -=5;
  }

  void debugColliders(boolean debug) {
    if (debug) {
      for ( GameObject obj : sceneObjects) {
        obj.collider.displayCollider();
      }
    }
  }
}
