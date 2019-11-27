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
      println((secondsToEnd-secondsLeft)/backgroundSwapTime);
      //println((int)(secondsToEnd-secondsLeft)/30);


      secondsLeft -= time.lastFrameDeltaTime;
      if ((int)secondsLeft%15 ==0) {
        world.displayNextDialog();
      }
      /*if ((int)secondsLeft%29 ==0) {
       println("test 30 seconds" +(int)(secondsToEnd-secondsLeft)/30);
       }*/
      //println((int)(secondsToEnd-secondsLeft)/backgroundSwapTime);
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
