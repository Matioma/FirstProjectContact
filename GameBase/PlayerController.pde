class PlayerController {

  private final World worldRef;


  private boolean isMousePressed=false;
  private IDraggable draggableObject=null;

  PlayerController() {
    worldRef = null;
  }

  PlayerController(World _worldRef) {
    this.worldRef = _worldRef;
  }

  void update() {
    if (isMousePressed && draggableObject ==null) {
      draggableObject =worldRef.GetPointedObject();
    }
    
    if(draggableObject != null){
      GameObject test = (GameObject)draggableObject;
      test.position.set(mouseX,mouseY);
      //(GameObject)draggableObject.position.set(mouseX,mouseY);
    }
  }


  void handleMousePressed() {
    isMousePressed = true;
  }
  void handleMouseReleased() {
    isMousePressed = false;
    draggableObject = null;
  }
}
