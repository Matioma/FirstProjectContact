class BoxCollider extends Collider{
  PVector position;
  float colWidth;
  float colHeight;
  
  BoxCollider(PVector position, float colliderWidth, float colliderHeight){
    this.position = position;
    colWidth = colliderWidth;
    colHeight  = colliderHeight;
  }
  
  @Override void displayCollider(){
    push();
    strokeWeight(2);
    stroke(204, 102, 0);
    fill(0,0,0,0);
    rect(position.x, position.y,colWidth,colHeight);
    pop();
  }
}
