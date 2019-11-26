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

int[] password = {3, 1, 2, 4};
int[] fireWord = {1, 2, 3, 4};

int[] currentlyPlacedValues = new int[4];
int[] currentlyFireValues = new int[4];

Timer timer = new Timer();
Time time;

Minim minim;

HashMap<String, AudioPlayer> sounds = new HashMap<String, AudioPlayer>();

ArrayList<String> phrases = new ArrayList<String>();
ArrayList<AudioPlayer> actorSoundFiles = new ArrayList<AudioPlayer>();



void setup() {

  size (1280, 720);
  minim = new Minim(this);
  loadSounds();
  loadActorSounds();
  loadFonts();
  loadTextMessages();

  world = new World();
  time = new Time();
  world.setBackgroundMusic("MainMenuBgMusic");
}

void draw() {

  //fill(0,0,0,5);
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

void loadSounds() {
  /*
  sounds.put("PickingVase", new AudioPlayer( "Sounds/picking_vase.mp3"));
   sounds.put("OpenSafe", new AudioPlayer(this, "Sounds/Cut_Safe.mp3"));
   sounds.put("SwingingLamp", new SoundFile(this, "Sounds/Cut_swinging_lamp.mp3"));
   sounds.put("MainMenuBgMusic", new SoundFile(this, "Sounds/mainmenu_bg_music.mp3"));
   sounds.put("BgMusicStage1", new SoundFile(this, "Sounds/Cut_Puzzle_2.mp3"));
   */
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
  /*
  actorSoundFiles.add(new SoundFile(this, "Sounds/typical_human.wav"));
   actorSoundFiles.add(new SoundFile(this, "Sounds/crazier_isnt_it.wav"));
   actorSoundFiles.add(new SoundFile(this, "Sounds/see_urself_in_the_mirror.wav"));
   actorSoundFiles.add(new SoundFile(this, "Sounds/make_use_of_ur_brain.wav"));
   actorSoundFiles.add(new SoundFile(this, "Sounds/ill_crush_ur_mind.wav"));
   actorSoundFiles.add(new SoundFile(this, "Sounds/MoreSweatandTears.wav"));
   actorSoundFiles.add(new SoundFile(this, "Sounds/ClearlyToo_much_for_you.wav"));
   actorSoundFiles.add(new SoundFile(this, "Sounds/unacc_rate_of_progress.wav"));
   actorSoundFiles.add(new SoundFile(this, "Sounds/hahaha_I_am_so_sorry_but_you_will_get_it_eventually.wav"));
   */
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
