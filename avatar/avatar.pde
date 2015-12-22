
import cassette.audiofiles.SoundFile;
PImage img, home, clock, three, twelve;

SoundFile dialog, three_, twelve_;
boolean playing = false, spoken = false, number_displayed = false;


int threeX, threeY, twelveX, twelveY;

void setup(){
  fullScreen();
  
  loadMedia();
  
}

void loadMedia(){
  img = loadImage("avatar_by_oohorusoo.png");
  home = loadImage("home.ico");
  //clock = loadImage("clock.png");
  dialog = new SoundFile(this, "small_hand.mp3");
  three_ = new SoundFile(this, "three.mp3");
  twelve_ = new SoundFile(this, "twelve.mp3");
  three = loadImage("3.png");
  twelve = loadImage("12.png");
}

void draw(){
  //imageMode(CORNER);
  image(home, width - home.width - 2, 2, home.width /3, home.height / 3);
  //imageMode(CENTER);
  //image(clock, width/2, height/2);
  //imageMode(CORNER);
  image(img, 0, height - img.height);
  threeX = width/2;
  threeY = height/2 + clock.height/2;
  twelveX = width/2 + three.width + 10;
  twelveY = height/2 + clock.height/2;
  if(spoken){
    image(three, threeX, threeY);
    image(twelve, twelveX, twelveY);
    number_displayed = true;
  }
  
  
  }

void mousePressed(){
  if((mouseX < img.width) && (mouseY > (height - img.height))){
    if(! playing){
      playing = true;
      dialog.play();
      spoken = true;
    }
    playing = false;
  }
  
  if(number_displayed){
    if(mouseX > threeX && mouseX < (threeX + three.width) && mouseY > threeY && mouseY < (threeY + three.height)){
      three_.play();
    }
    if(mouseX > twelveX && mouseX < (twelveX + twelve.width) && mouseY > twelveY && mouseY < (twelveY + twelve.height)){
      twelve_.play();
    }
  }
}