class PlayerController {

  private final World worldRef;
  private IInteractable interactedObject = null;

  PlayerController() {
    worldRef = null;
  }
  PlayerController(World _worldRef) {
    this.worldRef = _worldRef;
  }

  void update() {
    if (interactedObject!= null) {
      interactedObject.onDragged();
    }
  }

  void handleMousePressed() {
    if (interactedObject ==null) {
      interactedObject = worldRef.getClickedObject();
      if (interactedObject !=null) {
        interactedObject.onClick();
      }
    }

    if (world.sceneIndex == 2) {
      if(!pointRect(mouseX,mouseY, width/4,height/4, width/2, height/2)){
        world.setSceneNumber(1);
      }
    }
  }
  
  void handleMouseReleased() {
    if (interactedObject !=null) {
      interactedObject.onRelease();
      interactedObject = null;
    }
  }

  boolean pointRect(float px, float py, float rx, float ry, float rw, float rh) {

    // is the point inside the rectangle's bounds?
    if (px >= rx &&        // right of the left edge AND
      px <= rx + rw &&   // left of the right edge AND
      py >= ry &&        // below the top AND
      py <= ry + rh) {   // above the bottom
      return true;
    }
    return false;
  }
}
