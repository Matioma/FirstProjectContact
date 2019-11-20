
class CircleCollider extends Collider{
  PVector position;
  float radius;
  
  CircleCollider(PVector position, float radius){
    this.position = position;
    this.radius = radius;
  }
  
  @Override void displayCollider(){
    push();
    strokeWeight(2);
    stroke(204, 102, 0);
    circle(position.x, position.y,radius*2);
    pop();
  }
}
