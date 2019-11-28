class GameObject implements Comparable<GameObject> { 
  PVector position;
  Collider collider;
  int layer=0;
  PImage textureToDisplay;
  float imgWidth, imgHeight;

  PVector rotation = new PVector();

  PImage defaultTexture, highlightedTexture;

  int stage =0;

  PImage[] defaultTextures = new PImage[4];
  PImage[] highlightedTextures = new PImage[4];
  /*PImage defaultTexture1, highlightedTexture1;
   PImage defaultTexture2, highlightedTexture2;
   PImage defaultTexture3, highlightedTexture3;*/

  GameObject() {
  }

  GameObject(PVector position) {
    this.position = position;
  }
  GameObject(PVector position, float _width, float _height) {
    this(position);
    imgWidth = _width;
    imgHeight = _height;
  }
  GameObject(PVector position, String path) {
    this(position);
    defaultTexture = loadImage(path);
    textureToDisplay =defaultTexture;
  }
  GameObject(PVector position, float _width, float _height, String path) {
    this(position, _width, _height);
    defaultTexture = loadImage(path);
    textureToDisplay =defaultTexture;
  }
  GameObject(PVector position, float _width, float _height, String pathDefault, String pathHighlighted) {
    this(position, _width, _height);
    defaultTexture = loadImage(pathDefault);
    textureToDisplay =defaultTexture;
    highlightedTexture = loadImage(pathHighlighted);
  }

  void setTextureToDisplay(String filePath) {
    textureToDisplay = loadImage(filePath);
  }
  void setDefaultTexture(String filePath) {
    defaultTexture = loadImage(filePath);
    textureToDisplay = defaultTexture;
  }

  void setHighlightedTexture(String filePath) {
    highlightedTexture = loadImage(filePath);
  }

  void setHighlightedTexture(PImage image) {
    highlightedTexture = image;
    textureToDisplay = defaultTexture;
  }
  void setDefaultTexture(PImage image) {
    defaultTexture = image;
    textureToDisplay = defaultTexture;
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

  void setStageImages( int stage, String path1, String path2) {
    defaultTextures[stage] = loadImage(path1);
    highlightedTextures[stage] = loadImage(path2);
  }


  void SetStage(int stage) {
    if (defaultTextures[stage] !=null) {
      setDefaultTexture(defaultTextures[stage]);
    }
    if (highlightedTextures[stage] !=null) {
      setHighlightedTexture(highlightedTextures[stage]);
    }
  }
}
