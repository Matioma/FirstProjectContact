class UIElement extends InteractableObject {

  UIElement(PVector position) {
    super(position);
  }
  UIElement(PVector position, String filePath) {
    super(position, filePath);
  }
  UIElement(PVector position, float _width, float _height) {
    super(position,_width,_height);
  }
  UIElement(PVector position, float _width, float _height, String filePath) {
    super(position,_width,_height, filePath);
  }

  void onClick() {
    if(isClickable){
      world.setSceneNumber(1);
    } 
  }
  void onDragged() {
    followMouse();
  }
  void onRelease() {
    println("Button Released");
    if(targetObjectToOverlap !=null){
      if(this.collider.collided((BoxCollider)targetObjectToOverlap.collider)){
        this.position.set(targetObjectToOverlap.position);
        try{
          UIElement buttonElement = (UIElement)targetObjectToOverlap;
          buttonElement.setClickable(true);
          this.setClickable(true);
        }catch(Exception e){
          
        }
      }
    }
  }
}
