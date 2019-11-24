
enum Levels {
  MAIN_MENU, 
    LIVING_ROOM, 
    BOTTLE_PUZZLE, 
    READ_NOTE, 
    READ_BOOK, 
    SAFE_CLOSED, 
    SAFE_OPENED
};

class World {
  public int sceneIndex =0;

  public Levels currentSceneKey = Levels.MAIN_MENU;

  boolean startedTheGame =false;


  ArrayList<Scene> scenes = new ArrayList<Scene>(); 
  UIElement timerElement;


  PlayerController playerController;
  ArrayList<GameObject> sceneObjects = new ArrayList<GameObject>();
  HashMap<Levels, Scene> scenesData =new HashMap<Levels, Scene>();

  GameObject fireObject =null;

  World() {
    playerController = new PlayerController(this);

    setupScene0();
    setupScene1();
    setupScene2();
    setupScene3();
    setupScene4();
    setupScene5();
  }

  void update() {
    playerController.update();
    timer.update();
    if (timerElement !=null) {
      timerElement.setMessage(timer.getTimeString());
    }
  }

  void display() {
    try {
      scenesData.get(currentSceneKey).display();
    }
    catch(Exception e) {
    }
  }

  IInteractable getHoveredObject() {
    Scene currentScene=null;

    try {
      currentScene = scenesData.get(currentSceneKey);
    }
    catch(Exception e) {
      println("Error at getting the hovered object inexistent scene with the currentSceneKey");
    }

    if (currentScene != null) {
      for (int i=currentScene.sceneObjects.size()-1; i>=0; i--) {
        GameObject obj = currentScene.sceneObjects.get(i);
        if (obj.collider.isMouseOver()) {
          try {
            IInteractable clickedObject = (IInteractable)obj;
            return clickedObject;
          }
          catch(Exception e) {
            println("Failed to cast to clicked object");
          }
        }
      }
    }
    return null;
  }

  boolean isObjectHovered(GameObject hoveredObject) {
    return hoveredObject.collider.isMouseOver();
  }



  //Main Menu
  void setupScene0() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    sceneObjects.add(new UIElement(new PVector(width/3, height/2), width/5, 30));
    element = (UIElement)sceneObjects.get(0);
    element.disableDragging();
    element.setLayer(-5);
    element.setTargetScene(Levels.LIVING_ROOM);

    sceneObjects.add(new UIElement(new PVector(width/5, height/4), width/5, 30, "Data/Text_so_you_want_to_play.png"));
    element = (UIElement)sceneObjects.get(1);
    element.disableDragging();
    element.setLayer(0);

    sceneObjects.add(new UIElement(new PVector(width/2, height/4), width/5, 30, "Data/Play.png"));
    element = (UIElement)sceneObjects.get(2);
    element.setLayer(1);
    element.setTargetScene(Levels.LIVING_ROOM);

    element = (UIElement)sceneObjects.get(2);
    element.setTargetCollider(sceneObjects.get(0));

    Collections.sort(sceneObjects);
    Scene scene = new Scene(sceneObjects);

    scenes.add(scene);

    scenesData.put(Levels.MAIN_MENU, scene);
  }

  //Living Room
  void setupScene1() {
    sceneObjects = new ArrayList<GameObject>();

    sceneObjects.add(new Vase(new PVector(433, 470), 25, 50, "Data/vase_vector.png", "Data/vase_vector_outline.png"));//vase
    sceneObjects.get(0).setLayer(1);


    sceneObjects.add(new Note(new PVector(440, 495)));//note
    InteractableObject object =(InteractableObject)sceneObjects.get(1);
    sceneObjects.get(1).setLayer(-2);
    object.setTargetScene(Levels.READ_NOTE);

    sceneObjects.add(new Safe(new PVector(396.6, 384.6), 55, 55, "Data/transparent.png"));
    InteractableObject interactable = (InteractableObject)sceneObjects.get(2);
    sceneObjects.get(2).setLayer(-2);
    interactable.setTargetScene(Levels.SAFE_CLOSED);

    //Bottles puzzle
    sceneObjects.add(new UIElement(new PVector(992, 191.33), 249.3, 66.6, "Data/transparent.png"));
    interactable = (InteractableObject)sceneObjects.get(3);
    interactable.setLayer(-2);
    interactable.disableDragging();
    interactable.setClickable(true);
    interactable.setTargetScene(Levels.BOTTLE_PUZZLE);

    sceneObjects.add(new UIElement(new PVector(396.6, 384.6), 55, 55, "Data/firePlace.png"));
    interactable = (InteractableObject)sceneObjects.get(4);
    interactable.setLayer(12);
    interactable.disableDragging();
    interactable.setClickable(false);
    fireObject = interactable;

    sceneObjects.add(new UIElement(new PVector(width-300, height-120), 300, 120));
    UIElement element = (UIElement)sceneObjects.get(5);
    element.disableDragging();
    element.setLayer(0);
    element.setMessage(timer.getTimeString());
    timerElement = element;

    Collections.sort(sceneObjects);

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/LivingRoom.png");
    scenes.add(scene);

    scenesData.put(Levels.LIVING_ROOM, scene);
  }

  //Note
  void setupScene2() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    sceneObjects.add(new UIElement(new PVector(width/4, height/4), width/2, height/2, "Data/Note_scene.png"));
    sceneObjects.get(0).setLayer(1);
    element =  (UIElement)sceneObjects.get(0);
    element.disableDragging();

    Collections.sort(sceneObjects); 

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/LivingRoom_Dark.png");
    scenes.add(scene);

    scenesData.put(Levels.READ_NOTE, scene);
  }

  //Safe
  void setupScene3() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    sceneObjects.add(new UIElement(new PVector(width/3+60, height/2), 36, 36, "Data/number_1.png"));
    element = (UIElement)sceneObjects.get(0);  
    element.setLayer(15);
    element.setValue(1);
    sceneObjects.add(new UIElement(new PVector(width/3+120, height/2), 36, 36, "Data/number_2.png"));
    element = (UIElement)sceneObjects.get(1);
    element.setLayer(15);
    element.setValue(2);
    sceneObjects.add(new UIElement(new PVector(width/3+180, height/2), 36, 36, "Data/number_3.png"));
    element = (UIElement)sceneObjects.get(2);
    element.setLayer(15);
    element.setValue(3);
    sceneObjects.add(new UIElement(new PVector(width/3+240, height/2), 36, 36, "Data/number_4.png"));
    element = (UIElement)sceneObjects.get(3);
    element.setLayer(15);
    element.setValue(4);

    sceneObjects.add(new UIElement(new PVector(531, 490), 36, 36));
    element = (UIElement)sceneObjects.get(4);
    element.disableDragging();
    element.setConbinationSlotIndex(0);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+36+9.6, 490), 36, 36));
    element = (UIElement)sceneObjects.get(5);
    element.disableDragging();
    element.setConbinationSlotIndex(1);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+2*(36+9.6), 490), 36, 36));
    element = (UIElement)sceneObjects.get(6);
    element.disableDragging();
    element.setConbinationSlotIndex(2);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+3*(36+9.6), 490), 36, 36));
    element = (UIElement)sceneObjects.get(7);
    element.disableDragging();
    element.setConbinationSlotIndex(3);
    element.setLayer(10);

    sceneObjects.add(new UIElement(new PVector(0, height-70), 150, 70));
    element = (UIElement)sceneObjects.get(8);
    element.disableDragging();
    element.setConbinationSlotIndex(3);
    element.setLayer(0);
    element.setClickable(true);
    element.setTargetScene(Levels.LIVING_ROOM);

    //setup what places the numbers can be placed int
    UIElement elementRef;
    elementRef = (UIElement)sceneObjects.get(0);
    elementRef.addOverlapTargets(sceneObjects.get(4));
    elementRef.addOverlapTargets(sceneObjects.get(5));
    elementRef.addOverlapTargets(sceneObjects.get(6));
    elementRef.addOverlapTargets(sceneObjects.get(7));

    elementRef = (UIElement)sceneObjects.get(1);
    elementRef.addOverlapTargets(sceneObjects.get(4));
    elementRef.addOverlapTargets(sceneObjects.get(5));
    elementRef.addOverlapTargets(sceneObjects.get(6));
    elementRef.addOverlapTargets(sceneObjects.get(7));

    elementRef = (UIElement)sceneObjects.get(2);
    elementRef.addOverlapTargets(sceneObjects.get(4));
    elementRef.addOverlapTargets(sceneObjects.get(5));
    elementRef.addOverlapTargets(sceneObjects.get(6));
    elementRef.addOverlapTargets(sceneObjects.get(7));

    elementRef = (UIElement)sceneObjects.get(3);
    elementRef.addOverlapTargets(sceneObjects.get(4));
    elementRef.addOverlapTargets(sceneObjects.get(5));
    elementRef.addOverlapTargets(sceneObjects.get(6));
    elementRef.addOverlapTargets(sceneObjects.get(7));

    Collections.sort(sceneObjects);
    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/Safe.jpeg");
    scenes.add(scene);



    scenesData.put(Levels.SAFE_CLOSED, scene);
  }

  //Bottles level
  void setupScene4() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;


    sceneObjects.add(new UIElement(new PVector(width/3+60, height/2), 36, 36, "Data/Letter_I.png"));
    element = (UIElement)sceneObjects.get(0);  
    element.setLayer(15);
    element.setValue(2);
    element.setRepresentNumber(false);
    sceneObjects.add(new UIElement(new PVector(width/3+120, height/2), 36, 36, "Data/Letter_F.png"));
    element = (UIElement)sceneObjects.get(1);
    element.setLayer(15);
    element.setValue(1);
    element.setRepresentNumber(false);
    sceneObjects.add(new UIElement(new PVector(width/3+180, height/2), 36, 36, "Data/Letter_E.png"));
    element = (UIElement)sceneObjects.get(2);
    element.setLayer(15);
    element.setValue(4);
    element.setRepresentNumber(false);
    sceneObjects.add(new UIElement(new PVector(width/3+240, height/2), 36, 36, "Data/Letter_R.png"));
    element = (UIElement)sceneObjects.get(3);
    element.setLayer(20);
    element.setValue(3);
    element.setRepresentNumber(false);

    sceneObjects.add(new UIElement(new PVector(531, 490), 36, 36));
    element = (UIElement)sceneObjects.get(4);
    element.disableDragging();
    element.setConbinationSlotIndex(0);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+36+9.6, 490), 36, 36));
    element = (UIElement)sceneObjects.get(5);
    element.disableDragging();
    element.setConbinationSlotIndex(1);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+2*(36+9.6), 490), 36, 36));
    element = (UIElement)sceneObjects.get(6);
    element.disableDragging();
    element.setConbinationSlotIndex(2);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+3*(36+9.6), 490), 36, 36));
    element = (UIElement)sceneObjects.get(7);
    element.disableDragging();
    element.setConbinationSlotIndex(3);
    element.setLayer(10);

    ///Square
    sceneObjects.add(new UIElement(new PVector(width/4, height/4), width/2, height/2, "Data/Bottles_scene.png"));
    sceneObjects.get(8).setLayer(0);
    element =  (UIElement)sceneObjects.get(8);
    element.disableDragging();



    UIElement elementRef;
    elementRef = (UIElement)sceneObjects.get(0);
    elementRef.addOverlapTargets(sceneObjects.get(4));
    elementRef.addOverlapTargets(sceneObjects.get(5));
    elementRef.addOverlapTargets(sceneObjects.get(6));
    elementRef.addOverlapTargets(sceneObjects.get(7));

    elementRef = (UIElement)sceneObjects.get(1);
    elementRef.addOverlapTargets(sceneObjects.get(4));
    elementRef.addOverlapTargets(sceneObjects.get(5));
    elementRef.addOverlapTargets(sceneObjects.get(6));
    elementRef.addOverlapTargets(sceneObjects.get(7));

    elementRef = (UIElement)sceneObjects.get(2);
    elementRef.addOverlapTargets(sceneObjects.get(4));
    elementRef.addOverlapTargets(sceneObjects.get(5));
    elementRef.addOverlapTargets(sceneObjects.get(6));
    elementRef.addOverlapTargets(sceneObjects.get(7));

    elementRef = (UIElement)sceneObjects.get(3);
    elementRef.addOverlapTargets(sceneObjects.get(4));
    elementRef.addOverlapTargets(sceneObjects.get(5));
    elementRef.addOverlapTargets(sceneObjects.get(6));
    elementRef.addOverlapTargets(sceneObjects.get(7));

    Collections.sort(sceneObjects); 

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/LivingRoom_Dark.png");
    scenes.add(scene);


    scenesData.put(Levels.BOTTLE_PUZZLE, scene);
  }

  //open safe
  void setupScene5() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    sceneObjects.add(new UIElement(new PVector(622.6, 533.3), 46.6, 79.3, "Data/transparent.png"));
    sceneObjects.get(0).setLayer(1);
    element =  (UIElement)sceneObjects.get(0);
    element.disableDragging();

    Collections.sort(sceneObjects); 

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/Safe_OPEN.png");
    scenes.add(scene);

    scenesData.put(Levels.SAFE_OPENED, scene);
  }


  void OpenScene(Levels levelKey) {
    if (currentSceneKey != levelKey && levelKey !=null) {
      currentSceneKey = levelKey;
      sceneChanged();
      if(currentSceneKey == Levels.LIVING_ROOM){
        timer.start();
      }
    } else {
      println("Trying to open the exactly the same scene or the object you pressed on has no targetScene");
    }
  }


  void SafeOpened() {
    OpenScene(Levels.SAFE_OPENED);
  }
  void DisableFire() {
    if (fireObject !=null) {
      scenes.get(1).sceneObjects.remove(fireObject);
    }
  }

  void sceneChanged() {
  }
}
