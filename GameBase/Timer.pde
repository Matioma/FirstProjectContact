class Timer {
  float secondsToEnd = 60;
  float secondsLeft;

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
