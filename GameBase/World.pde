class World {
  Scene1 scene1;
  PlayerController playerController;

  ArrayList<IDisplayable> displayableObject = new ArrayList<IDisplayable>();

  World() {

    playerController = new PlayerController(this);

    displayableObject.add(new DemoBox(new PVector(200, 200)));
    displayableObject.add(new DemoBox(new PVector(210, 200)));
  }

  void update() {
    playerController.update();
  }

  void display() {
    for (IDisplayable obj : displayableObject) {
      obj.display();
    }
  }


  IDraggable GetPointedObject() {
    for (IDisplayable obj : displayableObject) {
      GameObject gameObject = (GameObject)obj;
      if (gameObject.collider.isMouseOver()) {
        println("gg");
        return (IDraggable)gameObject;
      }
    }
    return null;
  }
}
