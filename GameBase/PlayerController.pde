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
  }
  void handleMouseReleased() {
    if (interactedObject !=null) {
      interactedObject.onRelease();
      interactedObject = null;
    }
  }
}
