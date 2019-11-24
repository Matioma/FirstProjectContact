import processing.sound.*;
import java.util.Collections;


World world;
SoundFile file1;
SoundFile file2;

int[] password = {3, 1, 2, 4};
int[] fireWord = {1, 2, 3, 4};

int[] currentlyPlacedValues = new int[4];
int[] currentlyFireValues = new int[4];

Timer timer = new Timer();
Time time;

void setup() {
  size (1280, 720);
  world = new World();
  time = new Time();

  loadFonts();
  //file1 = new SoundFile(this, "Sounds/1.1.wav");
  //file2 = new SoundFile(this, "Sounds/1.6.wav");
  ///file.play();
}

void draw() {
  time.update();
  background(0);
  world.update();
  world.display();

  time.lastFrameDeltaTime = time.getDeltaTime();
}

void mousePressed() {
  world.playerController.handleMousePressed();
}
void mouseReleased() {
  world.playerController.handleMouseReleased();
}

void currentPassword() {
  for (int i=0; i<currentlyFireValues.length; i++) {
    print(currentlyFireValues[i] +":");
  }
}

boolean checkPassword() {
  boolean isRight = true;
  for (int i=0; i<password.length; i++) {
    if (password[i] != currentlyPlacedValues[i]) {
      isRight =false;
      break;
    }
  }
  return isRight;
}


boolean checkFireWord() {
  boolean isRight = true;
  for (int i=0; i<fireWord.length; i++) {
    if (fireWord[i] != currentlyFireValues[i]) {
      isRight =false;
      break;
    }
  }
  return isRight;
}
void loadFonts() {
  FontData.addedFonts.put("PhosphateInline", loadFont("Data/PhosphateInline-32.vlw"));
  FontData.addedFonts.put("Helvetica", loadFont("Data/Helvetica-48.vlw"));
}

void Defeat() {
  println("Defeat");
}
void Victory() {
  println("Victory");
}
