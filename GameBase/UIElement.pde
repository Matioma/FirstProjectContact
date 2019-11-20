class UIElement extends GameObject implements IDisplayable, IInteractable {
  boolean draggingEnabled =true;
  boolean clickable =false;
  GameObject targetObjectToOverlap  = null;


  UIElement(PVector position) {
    super(position);
    collider = new BoxCollider(position, 1, 1);
    imgHeight =10;
    imgWidth=10;
  }


  UIElement(PVector position, String filePath) {
    super(position, filePath);
    SetCollider(new BoxCollider(position, 30, 30));
    imgHeight = 40;
    imgWidth = 40;
  }
  UIElement(PVector position, float _width, float _height) {
    super(position);
    imgHeight = _height;
    imgWidth = _width;
    SetCollider(new BoxCollider(position, _width, _height));
  }

  UIElement(PVector position, float _width, float _height, String filePath) {
    super(position, filePath);
    imgHeight = _height;
    imgWidth = _width;
    SetCollider(new BoxCollider(position, _width, _height));
  }

  void enableDragging() {
    draggingEnabled = true;
  }

  void disableDragging() {
    draggingEnabled = false;
  }
  
  void setClickable(){
    clickable = true;
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
    if (draggingEnabled) {
      position.x = mouseX - imgWidth/2;
      position.y = mouseY - imgHeight/2;
    }
  }

  void onClick() {
    if(clickable){
      world.setSceneNumber(1);
    }
    
  }
  void onDragged() {
    followMouse();
  }
  void onRelease() {
    println("Button Released");
    if(targetObjectToOverlap !=null){
      if(this.collider.collided((BoxCollider)targetObjectToOverlap.collider)){
        this.position.set(targetObjectToOverlap.position);
        try{
          UIElement buttonElement = (UIElement)targetObjectToOverlap;
          buttonElement.setClickable();
          this.setClickable();
        }catch(Exception e){
          
        }
        
      }
    }
  }
}
