class DemoBox extends GameObject  implements IDraggable, IDisplayable {

  boolean selected = false;
  color newColor =127;

  DemoBox(PVector position) {
    super(position);
    SetCollider(new BoxCollider(position, 30, 30));
  }


  void display() {
    push();
    fill(newColor);
    rect(position.x, position.y, 30, 30);
    pop();
  }



  void followMouse() {
    position.x = mouseX - 15;
    position.y = mouseY - 15;
  }

  void setLayer(int layer) {
    super.layer = layer;
  }
  void setColor(color newColor) {
    this.newColor = newColor;
  }
}
