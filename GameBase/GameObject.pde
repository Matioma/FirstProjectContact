class GameObject implements Comparable<GameObject>{ 
  PVector position;
  Collider collider;
  int layer=0;
  PImage img;
  float imgWidth,imgHeight;
  
  
  GameObject(){
  }
  
  GameObject(PVector position){
   this.position = position;
  }
  
  GameObject(PVector position, String path){
   this.position = position;
   img =loadImage(path);
  }
  
  void SetCollider(Collider collider){
    this.collider = collider;
  }
  
  int compareTo(GameObject anotherObject){
      return layer- anotherObject.layer;
  } 
  
  void setLayer(int layer){
    this.layer = layer; 
  }
}
