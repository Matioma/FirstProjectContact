class Note extends InteractableObject {

  Note(PVector position) {
    super(position);
  }
  Note(PVector position, String filePath) {
    super(position, filePath);
  }
  Note(PVector position, float _width, float _height, String filePath) {
    super(position, _width, _height, filePath);
  }


  @Override void onClick() {
    world.OpenScene(targetScene);
  }
  @Override void onRelease() {
  }  
  @Override void onDragged() {
  }
  @Override void onHover(){
  }
  @Override void onHoverEnd(){
  }
  
}
