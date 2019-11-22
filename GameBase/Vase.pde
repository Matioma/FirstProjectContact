class Vase extends InteractableObject {
  boolean selected = false;
  color newColor =127;

  Vase(PVector position) {
    super(position);
  }
  Vase(PVector position, String filePath) {
    super(position, filePath);
  }
  Vase(PVector position, float _width, float _height, String filePath) {
    super(position, _width, _height, filePath);
  }
  Vase(PVector position, float _width, float _height, String pathDefault, String pathHighlighted) {
    super(position, _width, _height, pathDefault, pathHighlighted);
  }

  @Override void onClick() {
  }
  @Override void onRelease() {
  }  
  @Override void onDragged() {
    followMouse();
  }
  @Override void onHover() {
    println("vase");
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
