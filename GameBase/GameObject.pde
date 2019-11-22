class GameObject implements Comparable<GameObject> { 
  PVector position;
  Collider collider;
  int layer=0;
  PImage textureToDisplay;
  float imgWidth, imgHeight;
  
  PImage defaultTexture,highlightedTexture;

  GameObject() {
  }

  GameObject(PVector position) {
    this.position = position;
  }
  GameObject(PVector position, float _width,float _height) {
    this(position);
    imgWidth = _width;
    imgHeight = _height;
  }
  GameObject(PVector position, String path) {
    this(position);
    defaultTexture = loadImage(path);
    textureToDisplay =defaultTexture;
  }
  GameObject(PVector position, float _width,float _height, String path) {
    this(position,_width,_height);
    defaultTexture = loadImage(path);
    textureToDisplay =defaultTexture;
  }
   GameObject(PVector position, float _width,float _height, String pathDefault, String pathHighlighted) {
    this(position,_width,_height);
    defaultTexture = loadImage(pathDefault);
    textureToDisplay =defaultTexture;
    highlightedTexture = loadImage(pathHighlighted);
  }



  void SetCollider(Collider collider) {
    this.collider = collider;
  }
  void setLayer(int layer) {
    this.layer = layer;
  }
  int compareTo(GameObject anotherObject) {
    return layer- anotherObject.layer;
  } 
}
