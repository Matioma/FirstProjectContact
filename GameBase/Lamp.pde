class Lamp extends AnimatedObject {
  float animationTime = 2;
  float animationTimePassed = 0;
  float yOffset =100;
  
  Lamp(PVector position, float _width, float _height, String filePath) {
    super(position, _width, _height, filePath);
    SetCollider(new BoxCollider(position, _width, _height));
  }

  @Override void animationFrameDraw() {
    push();
    translate(position.x + imgWidth/2, position.y + imgHeight/2 -yOffset);
    rotate(radians(10* sin(2*PI*animationTimePassed)));
    translate(-position.x - imgWidth/2, -position.y - imgHeight/2 +yOffset);
    displayObject();
    pop();
    animationTimePassed += time.lastFrameDeltaTime;
    if (animationTimePassed >=animationTime) {
      finishAnimation();
    }
  }

  @Override void onClick() {
    startAnimation();
    sounds.get("SwingingLamp").rewind();
    sounds.get("SwingingLamp").play();
  }

  @Override void finishAnimation(){
    super.finishAnimation();
    animationTimePassed =0;
    sounds.get("SwingingLamp").pause();
    sounds.get("SwingingLamp").rewind();
  }
}
