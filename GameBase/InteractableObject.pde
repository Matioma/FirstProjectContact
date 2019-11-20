abstract class InteractableObject extends GameObject implements IDisplayable, IInteractable {
  boolean isDraggable =true;
  boolean isClickable =false;
  
  GameObject targetObjectToOverlap  = null;

  InteractableObject(PVector position) {
    super(position);
    collider = new BoxCollider(position, 10, 10);
    imgHeight =10;
    imgWidth=10;
  }
  
  InteractableObject(PVector position, float _width, float _height) {
    super(position,_width, _height);
    SetCollider(new BoxCollider(position, _width, _height));
  }

  InteractableObject(PVector position, String filePath) {
    super(position,40,40,filePath);
    SetCollider(new BoxCollider(position, 40, 40));
  }
  
  InteractableObject(PVector position, float _width, float _height, String filePath) {
    super(position,_width,_height, filePath);
    SetCollider(new BoxCollider(position, _width, _height));
  }

  void enableDragging() {
    isDraggable = true;
  }

  void disableDragging() {
    isDraggable = false;
  }
  
  void setClickable(boolean value){
    isClickable = value;
  }
  void setTargetCollider(GameObject _targetObject){
    targetObjectToOverlap = _targetObject;
  }

  void display() {
    push();
    if (img!=null) {
      image(img, position.x, position.y, imgWidth, imgHeight);
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
