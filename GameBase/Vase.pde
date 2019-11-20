class Vase extends GameObject  implements IDisplayable, IInteractable {

  boolean selected = false;
  color newColor =127;

  Vase(PVector position) {
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
