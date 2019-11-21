import java.util.Collections;

class World {
  public int sceneIndex =0;



  ArrayList<Scene> scenes = new ArrayList<Scene>(); 

  PlayerController playerController;
  ArrayList<GameObject> sceneObjects = new ArrayList<GameObject>();

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
  }

  void display() {
    try {
      scenes.get(sceneIndex).display();
    }
    catch(Exception e) {
      println("Failed to displat a scene with index");
    }
  }


  IInteractable getClickedObject() {
    Scene currentScene;

    try {
      currentScene = scenes.get(sceneIndex);
    }
    catch(Exception e) {
      println("Scene with Index does not exist");
      currentScene = null;
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


  //Main Menu
  void setupScene0() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;

    sceneObjects.add(new UIElement(new PVector(width/3, height/2), width/5, 60));
    element = (UIElement)sceneObjects.get(0);
    element.disableDragging();
    element.setLayer(-5);
    element.setSceneToOpen(1);

    sceneObjects.add(new UIElement(new PVector(width/5, height/4), width/5, 30, "Data/Text_so_you_want_to_play.png"));
    element = (UIElement)sceneObjects.get(1);
    element.disableDragging();
    element.setLayer(0);

    sceneObjects.add(new UIElement(new PVector(width/2, height/4), width/5, 30, "Data/Play.png"));
    element = (UIElement)sceneObjects.get(2);
    element.setLayer(1);
    element.setSceneToOpen(1);

    element = (UIElement)sceneObjects.get(2);
    element.setTargetCollider(sceneObjects.get(0));

    Collections.sort(sceneObjects);
    Scene scene = new Scene(sceneObjects);

    scenes.add(scene);
  }


  //Living Room
  void setupScene1() {
    sceneObjects = new ArrayList<GameObject>();

    /*println(map(678, 0, 1920, 0, 1280));
     println(map(577, 0, 1080, 0, 720));*/
    sceneObjects.add(new Vase(new PVector(420, 470), 50, 50, "Data/vase_vector.png"));//vase
    sceneObjects.get(0).setLayer(1);


    sceneObjects.add(new Note(new PVector(440, 495)));//note
    InteractableObject object =(InteractableObject)sceneObjects.get(1);
    sceneObjects.get(1).setLayer(-2);
    object.setSceneToOpen(2);

    sceneObjects.add(new Safe(new PVector(396.6, 384.6), 55, 55));
    InteractableObject interactable = (InteractableObject)sceneObjects.get(2);
    sceneObjects.get(2).setLayer(-2);
    interactable.setSceneToOpen(3);


    //Bottles puzzle
    sceneObjects.add(new UIElement(new PVector(500, 600), 150, 120));
    interactable = (InteractableObject)sceneObjects.get(3);
    interactable.setLayer(-2);
    interactable.disableDragging();
    interactable.setClickable(true);
    interactable.setSceneToOpen(4);


    Collections.sort(sceneObjects);

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/LivingRoom.png");
    scenes.add(scene);
  }


  //Note
  void setupScene2() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;



    sceneObjects.add(new UIElement(new PVector(width/4, height/4), width/2, height/2));
    sceneObjects.get(0).setLayer(1);
    element =  (UIElement)sceneObjects.get(0);
    element.disableDragging();


    Collections.sort(sceneObjects); 

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/LivingRoom.png");
    scenes.add(scene);
  }

  //Safe
  void setupScene3() {
    sceneObjects = new ArrayList<GameObject>();
    // Safe  safe= new Safe();
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

    //println(map(12, 0, 1600, 0, 1280));
    sceneObjects.add(new UIElement(new PVector(531, 490), 36, 36));
    element = (UIElement)sceneObjects.get(4);
    element.disableDragging();
    element.setNumberIndex(0);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+36+9.6, 490), 36, 36));
    element = (UIElement)sceneObjects.get(5);
    element.disableDragging();
    element.setNumberIndex(1);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+2*(36+9.6), 490), 36, 36));
    element = (UIElement)sceneObjects.get(6);
    element.disableDragging();
    element.setNumberIndex(2);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+3*(36+9.6), 490), 36, 36));
    element = (UIElement)sceneObjects.get(7);
    element.disableDragging();
    element.setNumberIndex(3);
    element.setLayer(10);


    sceneObjects.add(new UIElement(new PVector(0, height-70), 150, 70));
    element = (UIElement)sceneObjects.get(8);
    element.disableDragging();
    element.setNumberIndex(3);
    element.setLayer(0);
    element.setClickable(true);
    element.setSceneToOpen(1);


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
  }

  //Bottles level
  void setupScene4() {
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
    element.setLayer(20);
    element.setValue(4);

    //println(map(12, 0, 1600, 0, 1280));
    sceneObjects.add(new UIElement(new PVector(531, 490), 36, 36));
    element = (UIElement)sceneObjects.get(4);
    element.disableDragging();
    element.setNumberIndex(0);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+36+9.6, 490), 36, 36));
    element = (UIElement)sceneObjects.get(5);
    element.disableDragging();
    element.setNumberIndex(1);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+2*(36+9.6), 490), 36, 36));
    element = (UIElement)sceneObjects.get(6);
    element.disableDragging();
    element.setNumberIndex(2);
    element.setLayer(10);
    sceneObjects.add(new UIElement(new PVector(531+3*(36+9.6), 490), 36, 36));
    element = (UIElement)sceneObjects.get(7);
    element.disableDragging();
    element.setNumberIndex(3);
    element.setLayer(10);


    sceneObjects.add(new UIElement(new PVector(width/4, height/4), width/2, height/2));
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
    scene.setBackground("Data/LivingRoom.png");
    scenes.add(scene);
  }

  void setupScene5() {
    sceneObjects = new ArrayList<GameObject>();
    UIElement element;


    println(map(70,0,1920,0,1280));
    println(map(119,0,1080,0,720));
    sceneObjects.add(new UIElement(new PVector(622.6, 533.3),46.6, 79.3, "Data/transparent.png"));
    sceneObjects.get(0).setLayer(1);
    element =  (UIElement)sceneObjects.get(0);
    element.disableDragging();
    
    


    Collections.sort(sceneObjects); 

    Scene scene = new Scene(sceneObjects);
    scene.setBackground("Data/Safe_OPEN.png");
    scenes.add(scene);
  }

  void setSceneNumber(int scene) {
    sceneIndex = scene;
  }

  void foundPill() {
    setSceneNumber(5);
  }

  float map(float s, float a1, float a2, float b1, float b2)
  {
    return b1 + (s-a1)*(b2-b1)/(a2-a1);
  }
}
