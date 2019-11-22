public static class FontData {
  static float FontSize = 15;
  static float[] padding ={ 10, 10, 10, 10}; 


  static HashMap<String, PFont> addedFonts = new HashMap<String, PFont>();
}

class UIElement extends InteractableObject {
  private int numberIndex=-1;


  boolean hasValue =false;
  int value = -1;
  boolean wasPlaced =false;
  GameObject targetPlaced =null;

  boolean representNumber =true;

  private String message = "";



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

  void setMessage(String message) {
    this.message = message;
  }

  @Override void display() {
    super.display();

    push();
    fill(50);
    textFont(FontData.addedFonts.get("Helvetica"));
    textAlign(CENTER, CENTER);
    textSize(FontData.FontSize);
    textLeading(FontData.FontSize);
    text(message, position.x +FontData.padding[3], position.y+FontData.padding[0], imgWidth-FontData.padding[3]-FontData.padding[1], imgHeight-FontData.padding[0]-FontData.padding[2]);
    pop();
  }

  void setNumberIndex(int number) {
    numberIndex = number;
  }
  void setValue(int value) {
    this.value = value;
  }
  void setRepresentNumber(boolean value) {
    representNumber = value;
  }



  @Override void onClick() {
    if (isClickable) {
      openScene();
    }
    if (targetPlaced !=null) {
      UIElement element = (UIElement)targetPlaced;
      element.hasValue = false;
      element.value = -1;
      currentlyPlacedValues[element.numberIndex] = -1;
      targetPlaced =null;
    }
  }
  @Override void onDragged() {
    followMouse();
  }
  @Override void onRelease() {
    if (representNumber) {
      if (overlapTargets.size()>0) {
        for (GameObject obj : overlapTargets) {
          if (this.collider.collided(obj.collider)) {
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
    } else {
      if (overlapTargets.size()>0) {
        for (GameObject obj : overlapTargets) {
          if (this.collider.collided(obj.collider)) {
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
      if (this.collider.collided(targetObjectToOverlap.collider)) {
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
  @Override void onHover() {
    println("ui Element");
  }
  @Override void onHoverEnd() {
  }
}
