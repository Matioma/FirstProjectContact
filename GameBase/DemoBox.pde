class DemoBox extends GameObject  implements IDraggable, IDisplayable {
  
  boolean selected = false;
  
  
  DemoBox(PVector position){
    super(position);
    SetCollider(new BoxCollider(position, 30,30));
  }
 
  
  void display() {
    if (selected) {
      //position.x =mouseX;
      //position.y =mouseY;
    }
    rect(position.x, position.y, 30, 30);
  }

  void followMouse(){
    position.x = mouseX;
    position.y = mouseY;
    //collider.position.set(mouseX,mouseY);
  }

  void clicked() {
    selected = false;
  }

  void released() {
    selected = true;
  }
}
