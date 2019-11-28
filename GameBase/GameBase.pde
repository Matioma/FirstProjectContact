import processing.sound.*;
import java.util.Collections;
import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;

World world;
SoundFile file1;
SoundFile file2;

int[] password = {5, 9, 3, 1};
int[] fireWord = {1, 2, 3, 3, 4, 5, 6};

int[] currentlyPlacedValues = new int[7];
int[] currentlyFireValues = new int[7];

Timer timer = new Timer();
Time time;

Minim minim;

HashMap<String, AudioPlayer> sounds = new HashMap<String, AudioPlayer>();

ArrayList<String> phrases = new ArrayList<String>();
ArrayList<AudioPlayer> actorSoundFiles = new ArrayList<AudioPlayer>();



void setup() {

  size (1280, 720,P2D);
  
  minim = new Minim(this);
  loadSounds();
  loadActorSounds();
  loadFonts();
  loadTextMessages();

  world = new World();
  time = new Time();
  world.setBackgroundMusic("MainMenuBgMusic");
  frameRate(30);
}

void draw() {

  //fill(0,0,0,5);
  time.update();
  background(0);
  world.update();
  world.display();

  time.lastFrameDeltaTime = time.getDeltaTime();
  println(time.lastFrameDeltaTime);
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

void loadSounds() {
  sounds.put("PickingVase", minim.loadFile("Sounds/picking_vase.mp3"));
  sounds.get("PickingVase").setGain(10);
  sounds.put("OpenSafe", minim.loadFile("Sounds/Cut_Safe.mp3"));
  sounds.put("SwingingLamp", minim.loadFile("Sounds/Cut_swinging_lamp.mp3"));
  sounds.put("MainMenuBgMusic", minim.loadFile("Sounds/mainmenu_bg_music.mp3"));
  //sounds.get("MainMenuBgMusic").setGain(-10);
  sounds.put("BgMusicStage1", minim.loadFile("Sounds/Cut_Puzzle_2.mp3"));
  sounds.get("BgMusicStage1").setGain(-20);
}

void loadTextMessages() {
  phrases.add("Typical human: \n Being too dumb to realize how dumb you really are. ");
  phrases.add("It is getting crazier, isn’t it?!");
  phrases.add("You should look yourself in the mirror, haha.");
  phrases.add("Make a use of your brain.");
  phrases.add("I crushed your mind, lol.");
  phrases.add("More sweat and tears, please. "); 
  phrases.add("That was clearly too much for you. "); 
  phrases.add("Unacceptable rate of progress. ");
  phrases.add("Yeah, I am so sorry, but you will get it eventually.");
}

void loadActorSounds() {
  actorSoundFiles.add(minim.loadFile("Sounds/typical_human.wav"));
  actorSoundFiles.add(minim.loadFile("Sounds/crazier_isnt_it.wav"));
  actorSoundFiles.add(minim.loadFile("Sounds/see_urself_in_the_mirror.wav"));
  actorSoundFiles.add(minim.loadFile("Sounds/make_use_of_ur_brain.wav"));
  actorSoundFiles.add(minim.loadFile("Sounds/ill_crush_ur_mind.wav"));
  actorSoundFiles.add(minim.loadFile("Sounds/MoreSweatandTears.wav"));
  actorSoundFiles.add(minim.loadFile("Sounds/ClearlyToo_much_for_you.wav"));
  actorSoundFiles.add(minim.loadFile("Sounds/unacc_rate_of_progress.wav"));
  actorSoundFiles.add(minim.loadFile("Sounds/hahaha_I_am_so_sorry_but_you_will_get_it_eventually.wav"));
}

void Defeat() {
  world.OpenScene(Levels.DEFEAT);
  timer.pause();
  println("Defeat");
}
void Victory() {
  println("Victory");
}
void Restart() {
  world = new World();
  timer = new Timer();
}
