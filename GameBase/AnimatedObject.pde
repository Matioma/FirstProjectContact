abstract class AnimatedObject extends InteractableObject {
  boolean looping =false;

  AnimatedObject(PVector position, float _width, float _height) {
    super(position, _width, _height);
    SetCollider(new BoxCollider(position, _width, _height));
  }
  AnimatedObject(PVector position, float _width, float _height, String filePath) {
    super(position, _width, _height, filePath);
    SetCollider(new BoxCollider(position, _width, _height));
  }
  AnimatedObject(PVector position, float _width, float _height, String filePath1, String filePath2) {
    super(position, _width, _height, filePath1, filePath2);
    SetCollider(new BoxCollider(position, _width, _height));
  }

  @Override void display() {
    if ( !looping) {
      super.display();
    } else {
      animationFrameDraw();
    }
  }

  void finishAnimation() {
    looping = false;
  }

  void startAnimation() {
    if (!looping) {
      looping = true;
    }
  }

  abstract void animationFrameDraw();

  @Override void onClick() {
  }
  @Override void onRelease() {
  }
  @Override void onDragged() {
  }
  @Override void onHover() {
    if (highlightedTexture!=null) {
      textureToDisplay = highlightedTexture;
    }
  }
  @Override void onHoverEnd() {
    if (defaultTexture!=null) {
      textureToDisplay = defaultTexture;
    }
  }
}
