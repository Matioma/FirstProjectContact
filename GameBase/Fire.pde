class Fire extends AnimatedObject {
  PImage[] images;
  int currentFrame =0;

  Fire(PVector position, float _width, float _height, String filePath, int framesCount ) {
    super(position, _width, _height);
    SetCollider(new BoxCollider(position, _width, _height));
    
    images = new PImage[framesCount];
    for (int i=0; i<framesCount; i++) {
      images[i] = loadImage(filePath+"_"+(i+1)+ ".png");
    }
    looping = true;
  }

  @Override void animationFrameDraw() {
    image(images[currentFrame%images.length], position.x, position.y, imgWidth, imgHeight);
    currentFrame++;
  }
}
