class Safe extends GameObject implements IDisplayable, IInteractable {

  int[] password = {3,1,4,2};
  
  Safe(){
  
  }
  
  Safe(PVector position) {
    super(position);
    SetCollider(new BoxCollider(position, 30, 30));
  }
  Safe(PVector position, float _width, float _height) {
    super(position);
    SetCollider(new BoxCollider(position, _width, _height));
    imgWidth = _width;
    imgHeight = _height;
  }
  Safe(PVector position, String filePath) {
    super(position, filePath);
    SetCollider(new BoxCollider(position, 30, 30));
    imgHeight = 30;
    imgWidth = 30;
  }
  Safe(PVector position, float _width, float _height, String filePath) {
    super(position, filePath);
    imgHeight = _height;
    imgWidth = _width;
    SetCollider(new BoxCollider(position, _width, _height));
  }

  void display() {
    push();
    if (img != null) {
      image(img, position.x, position.y, imgHeight, imgWidth);
    }
    else{
      rect(position.x, position.y, imgWidth,imgHeight);
    }
    pop();
  }

  void onClick() {
    world.setSceneNumber(3);
  }

  void onRelease() {
  }

  void onDragged() {
  }
}
