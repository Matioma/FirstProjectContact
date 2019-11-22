class Timer {
  float secondsToEnd = 300;
  float secondsLeft =300;

  float gameStartTime;
  float currentFrameTime;

  boolean timerStarted = false;

  Timer() {
    gameStartTime = millis();
    secondsLeft =300;
  }

  void start() {
    timerStarted = true;
    gameStartTime = millis();
  }
  void update() {
    if (timerStarted) {
      currentFrameTime = millis();
      secondsLeft = secondsToEnd - (currentFrameTime - gameStartTime)/1000;
    }
  }
  String getTimeString() {
    return ""+(int)secondsLeft/60 +":" + (int)secondsLeft%60;
  }
}
