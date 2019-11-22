class Safe extends InteractableObject {

  Safe(PVector position) {
    super(position);
  }
  Safe(PVector position, float _width, float _height) {
    super(position, _width, _height);
  }
  Safe(PVector position, String filePath) {
    super(position, filePath);
  }
  Safe(PVector position, float _width, float _height, String filePath) {
    super(position, _width, _height, filePath);
  }

  @Override void onClick() {
    world.OpenScene(targetScene);
  }

  @Override void onRelease() {
  }

  @Override void onDragged() {
  }

  @Override void onHover() {
//println("safe");
  }
  @Override void onHoverEnd() {
  }
}
