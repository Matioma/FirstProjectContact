class Vase extends InteractableObject{
  boolean selected = false;
  color newColor =127;

  Vase(PVector position) {
    super(position);
  }
  Vase(PVector position,  String filePath) {
    super(position, filePath);
  }
   Vase(PVector position, float _width,float _height,  String filePath) {
    super(position,_width, _height, filePath);
  }
  
  void onClick(){
    println("Yay the vase has been clicked");
  }
  void onRelease(){
    println("Yay the vase has been released");
  }  
  void onDragged(){
    followMouse();
  }

}
