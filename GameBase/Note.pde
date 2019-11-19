class Note extends GameObject implements IDisplayable,IClickable{

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
  
  void setLayer(int i){
    
  }
}
