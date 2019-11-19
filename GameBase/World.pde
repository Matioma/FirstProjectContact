import java.util.Collections;

class World {
  PlayerController playerController;

  ArrayList<IDisplayable> displayableObject = new ArrayList<IDisplayable>();
  ArrayList<GameObject> sceneObjects = new ArrayList<GameObject>();


  World() {

    playerController = new PlayerController(this);


    sceneObjects.add(new Vase(new PVector(width/2-width/7, height/2-30)));
    Vase box =(Vase)sceneObjects.get(0);
    box.setLayer(1);
    box.setColor(color(0, 0, 255));
    sceneObjects.add(new Note(new PVector(width/2-width/7, height/2-30)));
    Note note =(Note)sceneObjects.get(1);
    note.setLayer(-1);
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
        try {
          IDraggable draggableObj = (IDraggable)obj;
          //println("gg");
          if (draggableObj!=null)
            return draggableObj;
        }
        catch(Exception e) {
        }
      }
    }
    return null;
  }


  void drawScene1() {
    push();
    fill(#DE9F00);
    rect(width/2-width/5, height/2, width/5, 30); 
    pop();
  }
}
