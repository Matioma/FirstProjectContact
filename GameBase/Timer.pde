public class Time {
  double lastFrameTime;
  double lastFrameDeltaTime =0;

  Time() {
    lastFrameTime = millis();
  }

  void update() {
    lastFrameTime = millis();
  }

  double getDeltaTime() {
    return (  millis()-lastFrameTime)/1000;
  }
}

class Timer {
  float secondsToEnd = 210;
  float secondsLeft;

  boolean timerStarted = false;

  int backgroundSwapTime = 45;

  Timer() {
    secondsLeft = secondsToEnd;
  }

  void start() {
    timerStarted = true;
  }
  void pause() {
    timerStarted =false;
  }
  void update() {

    if (timerStarted) {
      //println((secondsToEnd-secondsLeft)/backgroundSwapTime);

      secondsLeft -= time.lastFrameDeltaTime;
      if ((int)secondsLeft%15 ==0) {
        world.displayNextDialog();
      }
      world.onMadnessLevelChange((int)(secondsToEnd-secondsLeft)/backgroundSwapTime);
    }
    if (secondsLeft<=0) {
      Defeat();
    }
  }



  String getTimeString() {
    return ""+(int)secondsLeft/60 +":" + (int)secondsLeft%60;
  }
}
