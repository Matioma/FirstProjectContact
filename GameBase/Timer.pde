public class Time {
  float lastFrameTime;
  float lastFrameDeltaTime =0;

  Time() {
    lastFrameTime = millis();
  }

  void update() {
    lastFrameTime = millis();
  }

  float getDeltaTime() {
    return (millis()-lastFrameTime)/1000;
  }
}

class Timer {
  float secondsToEnd = 300;
  float secondsLeft;

  boolean timerStarted = false;
  
  //ev

  Timer() {
    secondsLeft = secondsToEnd;
  }

  void start() {
    timerStarted = true;
  }
  void pause(){
    timerStarted =false;
  }
  void update() {
    if (timerStarted) {
      secondsLeft -= time.lastFrameDeltaTime;
      if((int)secondsLeft%15 ==0){
        world.displayNextDialog();
      }
      if((int)secondsLeft%15 ==1){
        world.onMadnessLevelChange();
        
      }
      if((int)secondsLeft%15 ==0){
        world.someTimePassed();
      }
    }
    if(secondsLeft<=0){
      Defeat();
    }
  }
  void TriggerEvent(int time){
    if((int)secondsLeft%time ==0){
    
    }
  
  }
  
  
  String getTimeString() {
    return ""+(int)secondsLeft/60 +":" + (int)secondsLeft%60;
  }
}
