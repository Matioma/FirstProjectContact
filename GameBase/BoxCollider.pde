class BoxCollider extends Collider{
  PVector position;
  float colWidth;
  float colHeight;
  
  BoxCollider(PVector position, float colliderWidth, float colliderHeight){
    this.position = position;
    colWidth = colliderWidth;
    colHeight  = colliderHeight;
  }
}
