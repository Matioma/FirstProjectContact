class Vase extends GameObject  implements IDisplayable, IInteractable {

  boolean selected = false;
  color newColor =127;

  Vase(PVector position) {
    super(position);
    SetCollider(new BoxCollider(position, 30, 30));
  }
  Vase(PVector position,  String filePath) {
    super(position, filePath);
    SetCollider(new BoxCollider(position, 30, 30));
    imgHeight = 40;
    imgWidth = 40;
  }
   Vase(PVector position, float _width,float _height,  String filePath) {
    super(position, filePath);
    imgHeight = _height;
    imgWidth = _width;
    SetCollider(new BoxCollider(position, _width, _height));
  }

  void display() {
    push();
    image(img,position.x,position.y,imgHeight,imgWidth);
    pop();
  }

  void followMouse() {
    position.x = mouseX - imgWidth/2;
    position.y = mouseY - imgHeight/2;
  }
  
  void onClick(){
    println("Yay the vase has been clicked");
  }
  void onRelease(){
    println("Yay the vase has been released");
  }  
  void onDragged(){
    followMouse();
  }

  void setColor(color newColor) {
    this.newColor = newColor;
  }
}
