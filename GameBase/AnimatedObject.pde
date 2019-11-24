class AnimatedObject extends InteractableObject {
  PImage[] images;

  int currentFrame =0;
  boolean spriteAnimation = false;

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
    }
  }


  @Override void onClick() {
  }

  @Override void onRelease() {
  }

  @Override void onDragged() {
  }

  @Override void onHover() {
  }



  @Override void onHoverEnd() {
  }
}
