class UIElement extends InteractableObject {
  private int numberIndex=-1;


  boolean hasValue =false;
  int value = -1;
  boolean wasPlaced =false;
  GameObject targetPlaced =null;

  boolean representNumber =true;

  UIElement(PVector position) {
    super(position);
  }
  UIElement(PVector position, String filePath) {
    super(position, filePath);
  }
  UIElement(PVector position, float _width, float _height) {
    super(position, _width, _height);
  }
  UIElement(PVector position, float _width, float _height, String filePath) {
    super(position, _width, _height, filePath);
  }

  void setNumberIndex(int number) {
    numberIndex = number;
  }
  void setValue(int value) {
    this.value = value;
  }
  void setRepresentNumber(boolean value){
    representNumber = value;
  }

  void onClick() {
    if (isClickable) {
      openScene();
      //world.setSceneNumber(1);
    }
    if (targetPlaced !=null) {
      UIElement element = (UIElement)targetPlaced;
      element.hasValue = false;
      element.value = -1;
      currentlyPlacedValues[element.numberIndex] = -1;
      targetPlaced =null;
    }
  }
  void onDragged() {
    followMouse();
  }
  void onRelease() {
    if (representNumber) {
      if (overlapTargets.size()>0) {
        for (GameObject obj : overlapTargets) {
          if (this.collider.collided((BoxCollider)obj.collider)) {
            UIElement element = (UIElement)obj;
            if (!element.hasValue) {
              element.hasValue = true;
              targetPlaced = obj;
              currentlyPlacedValues[element.numberIndex] = value;
              println(checkPassword());
              this.position.set(obj.position);
              if (checkPassword()) {
                world.SafeOpened();
              }
            }
          }
        }
      }
    }else{
       if (overlapTargets.size()>0) {
        for (GameObject obj : overlapTargets) {
          if (this.collider.collided((BoxCollider)obj.collider)) {
            UIElement element = (UIElement)obj;
            if (!element.hasValue) {
              element.hasValue = true;
              targetPlaced = obj;
              currentlyFireValues[element.numberIndex] = value;
              println(checkFireWord());
              this.position.set(obj.position);
              if (checkFireWord()) {
                world.DisableFire();
              }
            }
          }
        }
      }
    
    
    
    }

    if (targetObjectToOverlap !=null) {
      if (this.collider.collided((BoxCollider)targetObjectToOverlap.collider)) {
        this.position.set(targetObjectToOverlap.position);
        try {
          UIElement buttonElement = (UIElement)targetObjectToOverlap;
          buttonElement.setClickable(true);
          buttonElement.disableDragging();
          this.setClickable(true);
          this.disableDragging();
        }
        catch(Exception e) {
        }
      }
    }
  }
}
