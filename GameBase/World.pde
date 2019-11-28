
enum Levels {
  MAIN_MENU, 
    LIVING_ROOM, 
    BOTTLE_PUZZLE, 
    READ_NOTE, 
    READ_BOOK, 
    SAFE_CLOSED, 
    SAFE_OPENED, 
    WINDOW_SCENE, 
    DEFEAT,
    VICTORY_SCENE
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

  int madnessLevel=0;

  AudioPlayer backgroundSound  = null;
  AudioPlayer actorSound = null;

  UIElement dialogBox = new UIElement(new PVector(500, height-120), 300, 120, "Data/Narrators_box.png"); 
  int dialogNumber =-1;

  GameObject fireObject =null;

  World() {
    playerController = new PlayerController(this);

    setupMainMenu();
    setupLivingRoom();
    setupReadNote();
    setupClosedSafe();
    setupBottlePuzzle();
    setupOpenSafe();
    setupWindow();
    setupDefeatScene();
    setupReadBook();
    setupVictoryScene();
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
    displayDialogBox();
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
  void setupMainMenu() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    sceneObjects.add(new UIElement(new PVector(898, 168), 350, 90, "Data/transparent.png"));
    element = (UIElement)sceneObjects.get(0);
    element.disableDragging();
    element.setLayer(-5);
    element.setTargetScene(Levels.LIVING_ROOM);


    println(map(835, 0, 1192, 0, 1280));
    println(map(155, 0, 671, 0, 720));
    sceneObjects.add(new UIElement(new PVector(193, 257), 120, 60, "Data/Play.png"));
    element = (UIElement)sceneObjects.get(1);
    element.setLayer(1);
    element.setTargetScene(Levels.LIVING_ROOM);

    element = (UIElement)sceneObjects.get(1);
    element.setTargetCollider(sceneObjects.get(0));

    Collections.sort(sceneObjects);
    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/MainMenuBG.jpg");

    scenes.add(scene);

    scenesData.put(Levels.MAIN_MENU, scene);
  }

  //Living Room
  void setupLivingRoom() {
    sceneObjects = new ArrayList<GameObject>();

    sceneObjects.add(new Note(new PVector(440, 495), 20, 20, "Data/transparent.png"));//0
    InteractableObject object =(InteractableObject)sceneObjects.get(sceneObjects.size()-1);
    sceneObjects.get(sceneObjects.size()-1).setLayer(0);
    object.setTargetScene(Levels.READ_NOTE);

    sceneObjects.add(new Safe(new PVector(396.6, 384.6), 55, 55, "Data/transparent.png"));//1
    InteractableObject interactable = (InteractableObject)sceneObjects.get(sceneObjects.size()-1);
    sceneObjects.get(sceneObjects.size()-1).setLayer(0);
    interactable.setTargetScene(Levels.SAFE_CLOSED);

    //Bottles puzzle
    sceneObjects.add(new UIElement(new PVector(970, 240), 0.7*347,0.7* 99, "Data/Bottles1.png","Data/Bottles1_Highlight.png"));//2
    sceneObjects.get(sceneObjects.size()-1).setStageImages(1,"Data/Bottles2.png","Data/Bottles2_Highlight.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2,"Data/Bottles3.png","Data/Bottles3_Highlight.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(3,"Data/Bottles4.png","Data/Bottles4_Highlight.png");
    interactable = (InteractableObject)sceneObjects.get(sceneObjects.size()-1);
    interactable.setLayer(0);
    interactable.disableDragging();
    interactable.setClickable(true);
    interactable.setTargetScene(Levels.BOTTLE_PUZZLE);

    sceneObjects.add(new UIElement(new PVector(628, 0), 260, 430, "Data/transparent.png"));//3
    interactable = (InteractableObject)sceneObjects.get(sceneObjects.size()-1);
    interactable.setLayer(0);
    interactable.disableDragging();
    interactable.setClickable(true);
    interactable.setTargetScene(Levels.WINDOW_SCENE);

    //Read book
    sceneObjects.add(new UIElement(new PVector(120, 165), 36, 15, "Data/RedBook.png", "Data/RedBook_Highlight.png"));//4
    sceneObjects.get(sceneObjects.size()-1).setStageImages(1, "Data/RedBook1.png", "Data/RedBook1_Highlight.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2, "Data/RedBook2.png", "Data/RedBook2_Highlight.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2, "Data/RedBook3.png", "Data/RedBook3_Highlight.png");
    interactable = (InteractableObject)sceneObjects.get(sceneObjects.size()-1);
    interactable.setLayer(0);
    interactable.disableDragging();
    interactable.setClickable(true);
    interactable.setTargetScene(Levels.READ_BOOK);


    sceneObjects.add(new Lamp(new PVector(950, 0), 1.5* 30.3, 1.5* 100, "Data/Lamp.png", "Data/Lamp_outline.png"));//5
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2, "Data/Lamp3.png", "Data/Lamp3_outline.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(3, "Data/Lamp4.png", "Data/Lamp4_outline.png");
    sceneObjects.add(new Lamp(new PVector(1050, -30), 1.5* 30.3, 1.5* 100, "Data/Lamp.png", "Data/Lamp_outline.png"));//6
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2, "Data/Lamp3.png", "Data/Lamp3_outline.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(3, "Data/Lamp4.png", "Data/Lamp4_outline.png");
    sceneObjects.add(new Lamp(new PVector(1150, -60), 1.5* 30.3, 1.5* 100, "Data/Lamp.png", "Data/Lamp_outline.png"));//7
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2, "Data/Lamp3.png", "Data/Lamp3_outline.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(3, "Data/Lamp4.png", "Data/Lamp4_outline.png");

    sceneObjects.add(new Painting(new PVector(500, 50), 0.5*74, 0.5* 117, "Data/Key_Painting1.png", "Data/Key_Painting1_outline.png"));//8
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2, "Data/Key_Painting3.png", "Data/Key_Painting3_outline.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(3, "Data/Key_Painting4.png", "Data/Key_Painting4_outline.png");
    sceneObjects.add(new Painting(new PVector(530, 130), 0.5*37, 0.5* 66, "Data/Goat_Painting1.png", "Data/Goat_Painting1_outline.png"));//9
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2, "Data/Goat_Painting3.png", "Data/Goat_Painting4_outline.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(3, "Data/Goat_Painting4.png", "Data/Goat_Painting4_outline.png");
    sceneObjects.add(new Painting(new PVector(560, 210), 0.5*75, 0.5* 119, "Data/Trophy_painting1.png", "Data/Trophy_painting1_outline.png"));//10
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2, "Data/Trophy_painting3.png", "Data/Trophy_painting3_outline.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(3, "Data/Trophy_painting4.png", "Data/Trophy_painting4_outline.png");

    sceneObjects.add(new Vase(new PVector(433, 470), 25, 50, "Data/vase_vector.png", "Data/vase_vector_outline.png"));//11
    sceneObjects.get(sceneObjects.size()-1).setLayer(1);

    sceneObjects.add(new Fire(new PVector(360, 365), 90, 90, "Data/Fire/", 4));//12
    interactable = (InteractableObject)sceneObjects.get(sceneObjects.size()-1);
    interactable.setLayer(1);
    interactable.disableDragging();
    interactable.setClickable(false);
    fireObject = interactable;

    sceneObjects.add(new UIElement(new PVector(50, 90), 0.25* 226, 0.25*222, "Data/Plant1.png", "Data/Plant1_Outline.png"));//13
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2, "Data/Plant3.png", "Data/Plant3_Outline.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(3, "Data/Plant4.png", "Data/Plant4_Outline.png");
    interactable = (InteractableObject)sceneObjects.get(sceneObjects.size() - 1);
    interactable.setLayer(12);
    interactable.setClickable(false);
    sceneObjects.add(new UIElement(new PVector(120, 90), 0.25* 226, 0.25*222, "Data/Plant1.png", "Data/Plant1_Outline.png"));//144
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2, "Data/Plant3.png", "Data/Plant3_Outline.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(3, "Data/Plant4.png", "Data/Plant4_Outline.png");
    interactable = (InteractableObject)sceneObjects.get(sceneObjects.size() - 1);
    interactable.setLayer(12);
    interactable.setClickable(false);
    sceneObjects.add(new UIElement(new PVector(190, 90), 0.25* 226, 0.25*222, "Data/Plant1.png", "Data/Plant1_Outline.png"));//15
    sceneObjects.get(sceneObjects.size()-1).setStageImages(2, "Data/Plant3.png", "Data/Plant3_Outline.png");
    sceneObjects.get(sceneObjects.size()-1).setStageImages(3, "Data/Plant4.png", "Data/Plant4_Outline.png");
    interactable = (InteractableObject)sceneObjects.get(sceneObjects.size() - 1);
    interactable.setLayer(12);
    interactable.setClickable(false);


    Collections.sort(sceneObjects);

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/LivingRoom.png");
    scenes.add(scene);

    scenesData.put(Levels.LIVING_ROOM, scene);
  }

  //Note
  void setupReadNote() {
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
  void setupClosedSafe() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    int positionStartX = 530;
    int positionStartY = 300;
    
    int xOffset = 43;
    int yOffset =43;

    sceneObjects.add(new UIElement(new PVector(positionStartX, positionStartY), 40, 42, "Data/number_1.png"));//0
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);  
    //element.setMessage("1");
    element.setLayer(15);
    element.setValue(1);
    sceneObjects.add(new UIElement(new PVector(positionStartX + xOffset, positionStartY), 40, 42, "Data/number_2.png"));//1
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(15);
    element.setValue(2);
    sceneObjects.add(new UIElement(new PVector(positionStartX + 2*xOffset, positionStartY), 40, 42, "Data/number_3.png"));//2
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(15);
    element.setValue(3);
    sceneObjects.add(new UIElement(new PVector(positionStartX + 3*xOffset, positionStartY), 40, 42, "Data/number_4.png"));//3
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(15);
    element.setValue(4);
    sceneObjects.add(new UIElement(new PVector(positionStartX+0.5*yOffset, positionStartY-yOffset), 40, 42, "Data/number_5.png"));//4
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(15);
    element.setValue(5);
    sceneObjects.add(new UIElement(new PVector(positionStartX+0.5*xOffset +xOffset, positionStartY-yOffset), 40, 42, "Data/number_6.png"));//5
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(15);
    element.setValue(6);
    sceneObjects.add(new UIElement(new PVector(positionStartX+0.5*xOffset +2*xOffset, positionStartY-yOffset), 40, 42, "Data/number_7.png"));//6
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(15);
    element.setValue(7);
    sceneObjects.add(new UIElement(new PVector(positionStartX+1*xOffset, positionStartY-2*yOffset), 40, 42, "Data/number_8.png"));//7
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(15);
    element.setValue(8);
    sceneObjects.add(new UIElement(new PVector(positionStartX+1*xOffset+xOffset, positionStartY-2*yOffset), 40, 42, "Data/number_9.png"));//8
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(15);
    element.setValue(9);
    sceneObjects.add(new UIElement(new PVector(positionStartX+1.5*xOffset, positionStartY-3*yOffset), 40, 42, "Data/number_0.png"));//9
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(15);
    element.setValue(0);

    sceneObjects.add(new UIElement(new PVector(562, 497), 40, 42, "Data/transparent.png"));//10
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(0);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(562+49, 497), 40, 42, "Data/transparent.png"));//11
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(1);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(562+95, 497), 40, 42, "Data/transparent.png"));//12
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(2);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(562+139, 497), 40, 42, "Data/transparent.png"));//13
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(3);
    element.setLayer(10);

    sceneObjects.add(new UIElement(new PVector(0, height-100), 174, 100, "Data/BackButton.png", "Data/BackButton_Hover.png"));//14
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(3);
    element.setLayer(0);
    element.setClickable(true);
    element.setTargetScene(Levels.LIVING_ROOM);

    //setup what places the numbers can be placed int
    UIElement elementRef;
    elementRef = (UIElement)sceneObjects.get(0);
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));

    elementRef = (UIElement)sceneObjects.get(1);
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));
    
    elementRef = (UIElement)sceneObjects.get(2);
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));

    elementRef = (UIElement)sceneObjects.get(3);
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));
     elementRef = (UIElement)sceneObjects.get(4);
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));
    
     elementRef = (UIElement)sceneObjects.get(5);
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));
    
    
     elementRef = (UIElement)sceneObjects.get(6);
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));
  
     elementRef = (UIElement)sceneObjects.get(7);
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));
    
     elementRef = (UIElement)sceneObjects.get(8);
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));
    
     elementRef = (UIElement)sceneObjects.get(9);
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));

    Collections.sort(sceneObjects);
    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/Safe_CLOSED.png");
    scenes.add(scene);



    scenesData.put(Levels.SAFE_CLOSED, scene);
  }

  //Bottles level
  void setupBottlePuzzle() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    float slotsStartPosition =175;
    float offset = 0.4*324;
    float sizeX =122;
    float sizeY=144;


    sceneObjects.add(new UIElement(new PVector(slotsStartPosition, 200), sizeX, sizeY, "Data/LetterO.png"));//0
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);  
    element.setLayer(15);
    element.setValue(2);
    element.setRepresentNumber(false);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+offset, 200), sizeX, sizeY, "Data/LetterB.png"));//1
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(15);
    element.setValue(1);
    element.setRepresentNumber(false);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+2*offset, 200), sizeX, sizeY, "Data/LetterE.png"));//2
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(15);
    element.setValue(5);
    element.setRepresentNumber(false);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+3*offset, 200), sizeX, sizeY, "Data/LetterT.png"));//3
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(20);
    element.setValue(3);
    element.setRepresentNumber(false);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+4*offset, 200), sizeX, sizeY, "Data/LetterL.png"));//4
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(20);
    element.setValue(4);
    element.setRepresentNumber(false);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+5*offset, 200), sizeX, sizeY, "Data/LetterT2.png"));//5
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(20);
    element.setValue(3);
    element.setRepresentNumber(false);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+6*offset, 200), sizeX, sizeY, "Data/LetterS.png"));//6
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(20);
    element.setValue(6);
    element.setRepresentNumber(false);


    sceneObjects.add(new UIElement(new PVector(slotsStartPosition, 380), sizeX, sizeY, "Data/Placeholder3.png"));//7
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(0);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+offset, 380), sizeX, sizeY, "Data/Placeholder3.png"));//8
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(1);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+2*offset, 380), sizeX, sizeY, "Data/Placeholder3.png"));//9
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(2);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+3*offset, 380), sizeX, sizeY, "Data/Placeholder3.png"));//10
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(3);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+4*offset, 380), sizeX, sizeY, "Data/Placeholder3.png"));//11
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(4);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+5*offset, 380), sizeX, sizeY, "Data/Placeholder3.png"));//12
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(5);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(slotsStartPosition+6* offset, 380), sizeX, sizeY, "Data/Placeholder3.png"));//13
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();
    element.setConbinationSlotIndex(6);
    element.setLayer(10);



    ///Square
    sceneObjects.add(new UIElement(new PVector(116, 178), 1048, 364, "Data/Bottles_scene.png"));
    sceneObjects.get(sceneObjects.size()-1).setLayer(0);
    element =  (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.disableDragging();

    UIElement elementRef;
    elementRef = (UIElement)sceneObjects.get(0);
    elementRef.addOverlapTargets(sceneObjects.get(7));
    elementRef.addOverlapTargets(sceneObjects.get(8));
    elementRef.addOverlapTargets(sceneObjects.get(9));
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));

    elementRef = (UIElement)sceneObjects.get(1);
    elementRef.addOverlapTargets(sceneObjects.get(7));
    elementRef.addOverlapTargets(sceneObjects.get(8));
    elementRef.addOverlapTargets(sceneObjects.get(9));
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));

    elementRef = (UIElement)sceneObjects.get(2);
    elementRef.addOverlapTargets(sceneObjects.get(7));
    elementRef.addOverlapTargets(sceneObjects.get(8));
    elementRef.addOverlapTargets(sceneObjects.get(9));
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));

    elementRef = (UIElement)sceneObjects.get(3);
    elementRef.addOverlapTargets(sceneObjects.get(7));
    elementRef.addOverlapTargets(sceneObjects.get(8));
    elementRef.addOverlapTargets(sceneObjects.get(9));
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));

    elementRef = (UIElement)sceneObjects.get(4);
    elementRef.addOverlapTargets(sceneObjects.get(7));
    elementRef.addOverlapTargets(sceneObjects.get(8));
    elementRef.addOverlapTargets(sceneObjects.get(9));
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));

    elementRef = (UIElement)sceneObjects.get(5);
    elementRef.addOverlapTargets(sceneObjects.get(7));
    elementRef.addOverlapTargets(sceneObjects.get(8));
    elementRef.addOverlapTargets(sceneObjects.get(9));
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));

    elementRef = (UIElement)sceneObjects.get(6);
    elementRef.addOverlapTargets(sceneObjects.get(7));
    elementRef.addOverlapTargets(sceneObjects.get(8));
    elementRef.addOverlapTargets(sceneObjects.get(9));
    elementRef.addOverlapTargets(sceneObjects.get(10));
    elementRef.addOverlapTargets(sceneObjects.get(11));
    elementRef.addOverlapTargets(sceneObjects.get(12));
    elementRef.addOverlapTargets(sceneObjects.get(13));



    Collections.sort(sceneObjects); 

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/LivingRoom_Dark.png");
    scenes.add(scene);


    scenesData.put(Levels.BOTTLE_PUZZLE, scene);
  }

  //open safe
  void setupOpenSafe() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    sceneObjects.add(new UIElement(new PVector(610, 520), 46.6, 79.3, "Data/transparent.png"));
    element = (UIElement)sceneObjects.get(sceneObjects.size()-1);
    element.setLayer(0);
    element.disableDragging();
    element.setClickable(true);
    element.setTargetScene(Levels.VICTORY_SCENE);
    

    Collections.sort(sceneObjects); 

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/Safe_OPEN.png");
    scenes.add(scene);

    scenesData.put(Levels.SAFE_OPENED, scene);
    
  }


  //Window scene
  void setupWindow() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    sceneObjects.add(new UIElement(new PVector(0, height-100), 174, 100, "Data/BackButton.png", "Data/BackButton_Hover.png"));
    sceneObjects.get(0).setLayer(10);
    element =  (UIElement)sceneObjects.get(0);
    element.disableDragging();
    element.setClickable(true);
    element.setTargetScene(Levels.LIVING_ROOM);

    Collections.sort(sceneObjects); 

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/window_Scene.png");
    scenes.add(scene);

    scenesData.put(Levels.WINDOW_SCENE, scene);
  }


  //Defeat scene
  void setupDefeatScene() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    Collections.sort(sceneObjects); 

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/Game_Over.png");
    scenes.add(scene);
    
    
     sceneObjects.add(new UIElement(new PVector(420, height-265), 450, 100, "Data/transparent.png"));
    sceneObjects.get(0).setLayer(10);
    element =  (UIElement)sceneObjects.get(0);
    element.disableDragging();
    element.setClickable(false);
    element.setTargetScene(Levels.LIVING_ROOM);

    scenesData.put(Levels.DEFEAT, scene);
  }


  //readbook
  void setupReadBook() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    sceneObjects.add(new UIElement(new PVector(width/4, height/4), width/2, height/2, "Data/Book_scene.png"));
    sceneObjects.get(0).setLayer(1);
    element =  (UIElement)sceneObjects.get(0);
    element.disableDragging();

    Collections.sort(sceneObjects); 

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/LivingRoom_Dark.png");
    scenes.add(scene);

    scenesData.put(Levels.READ_BOOK, scene);
  }
  
   void setupVictoryScene() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    sceneObjects.add(new UIElement(new PVector(width/4, height/4), width/2, height/2, "Data/Book_scene.png"));
    sceneObjects.get(0).setLayer(1);
    element =  (UIElement)sceneObjects.get(0);
    element.disableDragging();


    Collections.sort(sceneObjects); 

    Scene scene = new Scene(sceneObjects);
    //scene.setBackground("Data/LivingRoom_Dark.png");
    scenes.add(scene);

    scenesData.put(Levels.VICTORY_SCENE, scene);
  }



  void OpenScene(Levels levelKey) {
    if (currentSceneKey != levelKey && levelKey !=null) {
      onSceneChanged(levelKey);
      currentSceneKey = levelKey;
      sceneChanged();
      if (currentSceneKey == Levels.LIVING_ROOM) {
        timer.start();
      }
    } else {
      println("Trying to open the exactly the same scene or the object you pressed on has no targetScene");
    }
  }
  void onSceneChanged(Levels levelKey) {
    if (currentSceneKey == Levels.MAIN_MENU) {
      setBackgroundMusic("BgMusicStage1");
    }
  }

  void onMadnessLevelChange(int _madnessLevel) { 
    if (_madnessLevel != madnessLevel) {
      madnessLevel = _madnessLevel;
      switch(madnessLevel) {
      case 0:
        break;
      case 1:
        scenesData.get(Levels.LIVING_ROOM).setBackground("Data/CrazyScene2.png");
        for (GameObject object : scenesData.get(Levels.LIVING_ROOM).sceneObjects) {
          object.SetStage(1);
        }
        scenesData.get(Levels.WINDOW_SCENE).setBackground("Data/window_Scene2.png");
        scenesData.get(Levels.BOTTLE_PUZZLE).setBackground("Data/Stage_2_Darken.png");
        break;
      case 2:

        scenesData.get(Levels.LIVING_ROOM).setBackground("Data/CrazyScene3.png");
        for (GameObject object : scenesData.get(Levels.LIVING_ROOM).sceneObjects) {
          object.SetStage(2);
        }
        scenesData.get(Levels.WINDOW_SCENE).setBackground("Data/window_Scene3.png");
        scenesData.get(Levels.BOTTLE_PUZZLE).setBackground("Data/Stage_3_Darken.png");

        break;
      case 3:
        scenesData.get(Levels.LIVING_ROOM).setBackground("Data/CrazyScene4.png");
        for (GameObject object : scenesData.get(Levels.LIVING_ROOM).sceneObjects) {
          object.SetStage(3);
        }
        scenesData.get(Levels.WINDOW_SCENE).setBackground("Data/window_Scene4.png");
        scenesData.get(Levels.BOTTLE_PUZZLE).setBackground("Data/Stage_4_Darken.png");
        break;
      default: 
        break;
      }
    }
  }

  void PuzzleSolved() {
  }

  void setBackgroundMusic(String soundName) {
    try {

      backgroundSound.pause();
      backgroundSound.rewind();
    }
    catch(Exception ex) {
    }

    backgroundSound = sounds.get(soundName);
    if (backgroundSound ==null) {
      println("failed to get sound file from the hash map");
    } else {
      backgroundSound.play();
      backgroundSound.loop();
      backgroundSound.setVolume(0.4);
    }
  }

  void playActorSound(AudioPlayer soundKey) {
    actorSound = soundKey;
    actorSound.play();
  }

  void displayDialogBox() {
    if (dialogBox!=null && actorSound !=null) {
      if (actorSound.isPlaying()) {
        dialogBox.display();
      }
    }
  }

  void displayNextDialog() {
    if (dialogNumber >= phrases.size()-1) {
      return;
    }
    if (actorSound==null) {
      dialogNumber++;
      playActorSound(actorSoundFiles.get(dialogNumber));
      dialogBox.setMessage(phrases.get(dialogNumber));
    } else {
      if (!actorSound.isPlaying()) {
        dialogNumber++;
        playActorSound(actorSoundFiles.get(dialogNumber));
        dialogBox.setMessage(phrases.get(dialogNumber));
      }
    }
  }

  Scene getCurrentScene() {
    return null;
  }

  void SafeOpened() {
    OpenScene(Levels.SAFE_OPENED);
    PuzzleSolved();
  }
  void DisableFire() {
    if (fireObject !=null) {
      scenes.get(1).sceneObjects.remove(fireObject);
    }
  }
  void sceneChanged() {
  }
}
