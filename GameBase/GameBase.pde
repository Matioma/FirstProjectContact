World world;
int[] password = {3,1,2,4};
int[] fireWord = {1,2,3,4};

int[] currentlyPlacedValues = new int[4];
int[] currentlyFireValues = new int[4];
  
  
void setup(){
  size (1280,720);
  world = new World();
}

void draw(){
  background(0);
  world.update();
  world.display();
}

void mousePressed(){
  world.playerController.handleMousePressed();
}
void mouseReleased(){
  world.playerController.handleMouseReleased();
}

void currentPassword(){
  for(int i=0; i<currentlyFireValues.length; i++){
    print(currentlyFireValues[i] +":");
  }
}

boolean checkPassword(){
  boolean isRight = true;
  for(int i=0; i<password.length; i++){
    if(password[i] != currentlyPlacedValues[i]){
      isRight =false;
      break;
    }
  }
  return isRight;
}


boolean checkFireWord(){
  boolean isRight = true;
  for(int i=0; i<fireWord.length; i++){
    if(fireWord[i] != currentlyFireValues[i]){
      isRight =false;
      break;
    }
  }
  return isRight;
}
