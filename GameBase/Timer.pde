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
  float secondsToEnd = 60;
  float secondsLeft;

  boolean timerStarted = false;

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
      println(time.lastFrameDeltaTime);
    }
  }
  String getTimeString() {
    return ""+(int)secondsLeft/60 +":" + (int)secondsLeft%60;
  }
}
