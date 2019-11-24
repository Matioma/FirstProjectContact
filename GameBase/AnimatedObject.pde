class AnimatedObject extends InteractableObject {
  PImage[] images;

  int currentFrame =0;
  boolean spriteAnimation = false;

  float animationTime = 2;
  float animationTimePassed = 0;
  boolean isAnimated =false;
  
  float yOffset =100;

  AnimatedObject(PVector position) {
    super(position);
    collider = new BoxCollider(position, 10, 10);
    imgHeight =10;
    imgWidth=10;
  }
  AnimatedObject(PVector position, float _width, float _height) {
    super(position, _width, _height);
    SetCollider(new BoxCollider(position, _width, _height));
  }
  AnimatedObject(PVector position, String filePath) {
    super(position, 40, 40, filePath);
    SetCollider(new BoxCollider(position, 40, 40));
  }
  AnimatedObject(PVector position, float _width, float _height, String filePath) {
    super(position, _width, _height, filePath);
    SetCollider(new BoxCollider(position, _width, _height));
    //spriteAnimation = true;
  }
  AnimatedObject(PVector position, float _width, float _height, String filePath, int numberOfFrames) {
    super(position, _width, _height);
    SetCollider(new BoxCollider(position, _width, _height));
    spriteAnimation = true;
    images = new PImage[numberOfFrames];
    for (int i=0; i<numberOfFrames; i++) {
      images[i] = loadImage(filePath+"_"+(i+1)+ ".png");
    }
  }

  @Override void display() {
    if (spriteAnimation) { 
      image(images[currentFrame%images.length], position.x, position.y, imgWidth, imgHeight);
      currentFrame++;
    } else {
      if( !isAnimated){
        super.display();        
      }else{
        push();
        translate(position.x + imgWidth/2, position.y + imgHeight/2 -yOffset);
        rotate(radians(10* sin(2*PI*animationTimePassed)));
        translate(-position.x - imgWidth/2, -position.y - imgHeight/2 +yOffset);
        super.display(); 
        pop();
        animationTimePassed += time.lastFrameDeltaTime;
        if (animationTimePassed >=animationTime) {
          animationFinished();
        }
      }
    }
  }

  @Override void onClick() {
    if (!isAnimated && !spriteAnimation) {
      isAnimated = true;
      println("Should start animating the object");
    }
  }

  @Override void onRelease() {
  }

  @Override void onDragged() {
  }

  @Override void onHover() {
  }

  @Override void onHoverEnd() {
  }


  void animationFinished() {
    isAnimated = false;
    animationTimePassed = 0;
  }
}
