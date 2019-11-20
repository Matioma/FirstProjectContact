class Note extends GameObject implements IDisplayable, IInteractable {
  
  
  
  Note() {
    super();
  }
  Note(PVector position) {
    super(position);
    SetCollider(new BoxCollider(position, 10, 10));
    imgHeight = 10;
    imgWidth = 10;
  }

  Note(PVector position, String filePath) {
    super(position, filePath);
    SetCollider(new BoxCollider(position, 30, 30));
    imgHeight = 40;
    imgWidth = 40;
  }
  Note(PVector position, float _width, float _height, String filePath) {
    super(position, filePath);
    imgHeight = _height;
    imgWidth = _width;
    SetCollider(new BoxCollider(position, _width, _height));
  }


  void display() {
    push();

    fill(#FCFC0F);
    rect(position.x, position.y, 10, 10);
    
    pop();
  }

  void onClick() {
    println("Yay the note has been clicked");
    world.setSceneNumber(2);
  }
  void onRelease() {
    println("Yay the note has been released");
  }  
  void onDragged() {
    //println("Yay the note has been dragged");
  }
}
