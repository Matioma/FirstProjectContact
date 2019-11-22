class PlayerController {

  private final World worldRef;
  private IInteractable interactedObject = null;
  private IInteractable hoveredObject =null;

  //boolean pressed =false;

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



    //Hovering mechanics
    if (hoveredObject ==null) {
      hoveredObject = this.worldRef.getHoveredObject();
      if (hoveredObject !=null) {
        hoveredObject.onHover();
      }
    } else {
      try {
        if (!this.worldRef.isObjectHovered((GameObject)hoveredObject)) {
          hoveredObject.onHoverEnd();
          hoveredObject =null;
        }
      }
      catch(Exception e) {
      }
    }
  }

  void handleMousePressed() {
    if (world.sceneIndex == 2) {
      if (!pointRect(mouseX, mouseY, width/4, height/4, width/2, height/2)) {
        world.setSceneNumber(1);
      }
    }
    if (world.sceneIndex == 4) {
      if (!pointRect(mouseX, mouseY, width/4, height/4, width/2, height/2)) {
        world.setSceneNumber(1);
      }
    }

    //pressed = false;
    if (interactedObject ==null) {
      interactedObject = worldRef.getClickedObject();
      if (interactedObject !=null) {
        interactedObject.onClick();
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
