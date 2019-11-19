import java.util.Collections;

class World {
  PlayerController playerController;

  ArrayList<IDisplayable> displayableObject = new ArrayList<IDisplayable>();
  ArrayList<GameObject> sceneObjects = new ArrayList<GameObject>();


  World() {

    playerController = new PlayerController(this);


    sceneObjects.add(new DemoBox(new PVector(width/2-width/7, height/2-30)));
    DemoBox box =(DemoBox)sceneObjects.get(0);
    box.setLayer(-25);
    box.setColor(color(0, 0, 255));
    sceneObjects.add(new DemoBox(new PVector(width/2-width/7, height/2-30)));
    box =(DemoBox)sceneObjects.get(1);
    box.setLayer(-10);
    box.setColor(color(0, 255, 0));
   
    Collections.sort(sceneObjects);
  }

  void update() {
    playerController.update();
  }

  void display() {
    drawScene1();
    for ( GameObject obj : sceneObjects) {
      IDisplayable objectToDisplay = (IDisplayable)obj;
      if (obj !=null) {
        objectToDisplay.display();
      }
    }

  }


  IDraggable GetPointedObject() {
    for (int i= sceneObjects.size()-1; i>=0; i--) {
      GameObject obj = sceneObjects.get(i);
      if (obj.collider.isMouseOver()) {
        println("gg");
        return (IDraggable)obj;
      }
    }
    
    return null;
  }
  
  
  void drawScene1(){
    push();
    fill(#DE9F00);
    rect(width/2-width/5,height/2, width/5,30); 
    pop();
  }
}
