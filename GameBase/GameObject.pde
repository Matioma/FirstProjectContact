class GameObject{ 
  PVector position;
  Collider collider;
  int layer=0;
  
  GameObject(PVector position){
   this.position = position;
  }
  
  void SetCollider(Collider collider){
    this.collider = collider;
  }
}
