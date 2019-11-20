World world;

void setup(){
  size (1280,720);
  world = new World();
}

void draw(){
  background(0);
  world.update();
  world.display();
}

void mousePressed(){
  world.playerController.handleMousePressed();
}
void mouseReleased(){
  world.playerController.handleMouseReleased();
}
