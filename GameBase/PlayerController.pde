class PlayerController {
  private final World worldRef;
  private IInteractable interactedObject = null;
  private IInteractable hoveredObject =null;

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
    if (world.currentSceneKey ==Levels.READ_NOTE ||world.currentSceneKey ==Levels.READ_BOOK) {
      if (!pointRect(mouseX, mouseY, width/4, height/4, width/2, height/2)) {
        world.OpenScene(Levels.LIVING_ROOM);
      }
    }
    if (world.currentSceneKey ==Levels.BOTTLE_PUZZLE) {
      if (!pointRect(mouseX, mouseY, 116, 178, 1048, 364)) {
        world.OpenScene(Levels.LIVING_ROOM);
      }
    }
    if (world.currentSceneKey ==Levels.DEFEAT) {
      if (pointRect(mouseX, mouseY, 420, height-265, 450, 100)) {
        Restart();
        world.OpenScene(Levels.LIVING_ROOM);
      }
    }

    if (interactedObject ==null) {
      interactedObject = worldRef.getHoveredObject();
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
