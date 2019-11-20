class Note extends GameObject implements IDisplayable,IInteractable{

  Note(){
    super();
  }
  Note(PVector position) {
    super(position);
    SetCollider(new BoxCollider(position, 10, 10));
  }

  void display(){
    push();
    fill(#FCFC0F);
    rect(position.x,position.y, 10,10);
    pop();
  }
  
  void onClick(){
    println("Yay the note has been clicked");
  }
  void onRelease(){
    println("Yay the note has been released");
  }  
  void onDragged(){
    //println("Yay the note has been dragged");
  }
}
