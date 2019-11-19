class DemoBox extends GameObject  implements IDraggable {
  private boolean clicked = false;

  Collider collider;

  DemoBox(PVector position){
    super(position);
    collider = new BoxCollider(position, 30,30);
  }
  void display() {
    if (clicked) {
      position.x =mouseX;
      position.y =mouseY;
    }
    //circle(position.x,position.y, 30);
    //rectMode(CENTER);
    rect(position.x, position.y, 30, 30);
  }

  void Clicked() {
    clicked = true;
  }

  void Released() {
    clicked = false;
  }
}
