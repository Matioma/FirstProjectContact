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
    println("Yay the note has been clicked");
    world.setSceneNumber(2);
  }
  @Override void onRelease() {
    println("Yay the note has been released");
  }  
  @Override void onDragged() {
  }
  @Override void onHover(){
    println("Mouse hovered on Vase");
  }
  @Override void onHoverEnd(){
  }
  
}
