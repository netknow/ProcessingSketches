
import cassette.audiofiles.SoundFile;
//import processing.sound.*;
PImage[] img = new PImage[9];
SoundFile[] music = new SoundFile[9];
int[] times = {30, 41, 49, 24, 17, 40, 25, 56, 59};
/*25, 41, 49, 24, 17, 40, 25, 56, 59*/
int image_number = 0;
int psec;
boolean change = true; 
void setup(){
  size(1920, 1080);
  frameRate(1);
  img[0] = loadImage("MerryChristmas.jpg");
  img[1] = loadImage("santaclaus.jpg");
  img[2] = loadImage("universe.jpg");
  img[3] = loadImage("milkywaygalaxy.jpg");
  img[4] = loadImage("solarsystem.jpg");
  img[5] = loadImage("planets.jpg");
  img[6] = loadImage("earth.jpg");
  img[7] = loadImage("worldmap.jpg");
  img[8] = loadImage("india.jpg");
  
  //for(int i =0; i < 9; i++){
  //  img[i].resize(img[i].width/2, img[i].height/2);
  //}
  
  music[0] = new SoundFile(this, "Audio1.mp3");
  music[1] = new SoundFile(this, "Audio2.mp3");
  music[2] = new SoundFile(this, "Audio3.mp3");
  music[3] = new SoundFile(this, "Audio4.mp3");
  music[4] = new SoundFile(this, "Audio5.mp3");
  music[5] = new SoundFile(this, "Audio6.mp3");
  music[6] = new SoundFile(this, "Audio7.mp3");
  music[7] = new SoundFile(this, "Audio8.mp3");
  music[8] = new SoundFile(this, "Audio9.mp3");
}

void draw(){
  if(change){
      background(255);
      image(img[image_number], 0, 0);
      music[image_number].play();
      psec = times[image_number];
      change = false;
  }
  psec--;
  if(psec < 0){
  image_number++;
  image_number %= 9;
  change = true;
  }
}