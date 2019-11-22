abstract class InteractableObject extends GameObject implements IDisplayable, IInteractable {
  boolean isDraggable =true;
  boolean isClickable =false;

  GameObject targetObjectToOverlap  = null;
  ArrayList<GameObject> overlapTargets = new ArrayList<GameObject>();

  //private int sceneToOpen = -1;
  protected Levels targetScene=null;

  InteractableObject(PVector position) {
    super(position);
    collider = new BoxCollider(position, 10, 10);
    imgHeight =10;
    imgWidth=10;
  }

  InteractableObject(PVector position, float _width, float _height) {
    super(position, _width, _height);
    SetCollider(new BoxCollider(position, _width, _height));
  }

  InteractableObject(PVector position, String filePath) {
    super(position, 40, 40, filePath);
    SetCollider(new BoxCollider(position, 40, 40));
  }

  InteractableObject(PVector position, float _width, float _height, String filePath) {
    super(position, _width, _height, filePath);
    SetCollider(new BoxCollider(position, _width, _height));
  }
  InteractableObject(PVector position, float _width, float _height, String pathDefault, String pathHighlighted) {
    super(position, _width, _height, pathDefault, pathHighlighted);
    SetCollider(new BoxCollider(position, _width, _height));
  }

  void enableDragging() {
    isDraggable = true;
  }

  void disableDragging() {
    isDraggable = false;
  }

  void setClickable(boolean value) {
    isClickable = value;
  }
  
  void setTargetScene(Levels sceneKey) {
    targetScene = sceneKey;
  }

  void setTargetCollider(GameObject _targetObject) {
    targetObjectToOverlap = _targetObject;
  }

  void addOverlapTargets(GameObject _targetObject) {
    overlapTargets.add(_targetObject);
  }

  @Override void display() {
    push();
    if (textureToDisplay!=null) {
      image(textureToDisplay, position.x, position.y, imgWidth, imgHeight);
    } else {
      fill(127);
      rect(position.x, position.y, imgWidth, imgHeight);
    }
    pop();
  }

  void followMouse() {
    if (isDraggable) {
      position.x = mouseX - imgWidth/2;
      position.y = mouseY - imgHeight/2;
    }
  }
}
