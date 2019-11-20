class UIElement extends GameObject implements IDisplayable, IInteractable {

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

  void display() {
    push();
    if (img!=null) {
      image(img, position.x, position.y, imgHeight, imgWidth);
    }
      fill(0,0,0);
      rect(position.x, position.y, imgWidth, imgHeight);
    pop();
  }

  void onClick() {
    println("Button Clicked");
  }
  void onDragged() {
  }
  void onRelease() {
    println("Button Released");
  }
}
