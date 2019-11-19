DemoBox box= new DemoBox(new PVector(200,200)); 
DemoBox box2= new DemoBox(new PVector(210,200)); 



void setup(){
  size (1280,720);
  box2.collider = new CircleCollider(box2.position, 30);
}

void draw(){
  background(0);
    if( pointRect(mouseX, mouseY,box.position.x, box.position.y, 50,50)){
      if(mousePressed){
          box.position.set(mouseX,mouseY);
          box.clicked = true;
      }else{
          box.clicked =false;
      }
    }
    box.display();
    box2.display();
    
    if(box.collider.collided((CircleCollider)box2.collider)){
      println("YAY");
    }
    
}

boolean pointRect(float px, float py, float rx, float ry, float rw, float rh) {

  // is the point inside the rectangle's bounds?
  if (px >= rx &&        // right of the left edge AND
      px <= rx + rw &&   // left of the right edge AND
      py >= ry &&        // below the top AND
      py <= ry + rh) {   // above the bottom
        return true;
  }
  return false;
}
