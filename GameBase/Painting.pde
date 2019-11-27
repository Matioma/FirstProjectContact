enum PaintingBehaviour {
  FALL, 
    ROTATE, 
    ZOOM_IN
}

class Painting extends AnimatedObject {
  float animationTime = 1;
  float animationTimePassed = 0;


  boolean pressedAlready =false;


  Painting(PVector position, float _width, float _height, String filePath) {
    super(position, _width, _height, filePath);
    SetCollider(new BoxCollider(position, _width, _height));
  }
  Painting(PVector position, float _width, float _height, String filePath1, String filePath2) {
    super(position, _width, _height, filePath1,filePath2);
    SetCollider(new BoxCollider(position, _width, _height));
  }

  @Override void animationFrameDraw() {
    rotatePainting();
  }
  @Override void onClick() {
    startAnimation();
    //pressedAlready=true;
  }

  void rotatePainting() {
    /*if (pressedAlready) {
     rotation.x = 30* sin(2*PI*animationTimePassed);
     }*/
    //displayObject();  
    push();
    if (!pressedAlready) {
      translate(position.x + imgWidth/2, position.y + imgHeight/2);
      rotate(radians(30* sin(2*PI*animationTimePassed)));
      translate(-position.x - imgWidth/2, -position.y - imgHeight/2);
    }
    displayObject();
    pop();
    animationTimePassed += time.lastFrameDeltaTime;
    if (animationTimePassed >=animationTime) {
      finishAnimation();
    }
  }
}
