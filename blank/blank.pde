PFont f;
PImage back_image, front_image;
String message1 = "Welcome to GeekCafe";
String message2 = "Demo";
String message3 = "Got it";
// An array of Letter objects
Welcome greeting, demo, next;
boolean greeting_ = false, demo_ = false, next_ = false;


void setup() {
  size(940, 540);
  // Load the font
  f = createFont("Arial",20,true);
  textFont(f);
  greeting = new Welcome(message1, 20, 50);
  demo = new Welcome(message2, 70, 180);
  next = new Welcome(message3, 100, 310);
  //back_image = new PImage(); //the next line is enough to instantiate the PImage
  back_image = loadImage("arrow_960_720.png");
  front_image = loadImage("front_960_720.png");
  back_image.resize(50, 50);
  front_image.resize(50, 50);
}


void draw() { 
  background(255);
  greeting.display();
  greeting_ = true;
  if(greeting.mouse_was_pressed_on_me()){
    demo_ = true;
  }
  
  
  
  if(demo_){
    greeting.deactivate();
    demo.display();
    pushMatrix();
    translate(back_image.width, height - back_image.height);
    image(back_image, 0, 0);
    popMatrix();
  }
  
  if(demo.mouse_was_pressed_on_me()){
    next_ = true;
  }
  
  if(next_){
    demo.deactivate();
    next.display();
    pushMatrix();
    translate(width - front_image.width, height - front_image.height);
    image(front_image, 0, 0);
    popMatrix();
  }
}


class Welcome {
  String message;
  int homex, homey;
  int width_, height_;
  boolean activated;
  Letter[] letters;
  boolean i_was_clicked;

  Welcome(String msg, int X, int Y){
    message = msg;
    homex = X;
    homey = Y;
    i_was_clicked = false;
    letters = new Letter[message.length()];  
    // Initialize Letters at the correct x location
    int x = homex;
    for (int i = 0; i < message.length(); i++) {
      letters[i] = new Letter(x,homey,message.charAt(i)); 
      x += textWidth(message.charAt(i));
    }
    width_ = x - homex;
    activated = true;
  }// Welcome() constructor over
  
  void display(){
    if(! activated){
      return;
    }
    for (int i = 0; i < letters.length; i++) {
    // Display all letters
    letters[i].display();
    i_was_clicked = mouse_was_pressed_on_me();
    // If the mouse is pressed the letters shake
    // If not, they return to their original location
    if (i_was_clicked) {
      letters[i].shake();
    } else {
      letters[i].home();
    }//if-else ends
    
   }//for ends
  }//display over
  
  boolean mouse_was_pressed_on_me(){
    if(mouseX > homex && mouseX < homex + width_ && mouseY > homey - textAscent() && mouseY < homey + textDescent()){
      if(mousePressed){
        return true;
      }
    }
    return false;
  }
  
  void deactivate(){
    activated = false;
  }
  void activate(){
    activated = true;
  }
}

class Button{
  
  Button(int x, int y, int wide, int tall){
  }
}


// A class to describe a single Letter
class Letter {
  char letter;
  // The object knows its original "home" location
  float homex,homey;
  // As well as its current location
  float x,y;

  Letter (float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_; 
  }

  // Display the letter
  void display() {
    fill(0);
    textAlign(LEFT);
    text(letter,x,y);
  }

  // Move the letter randomly
  void shake() {
    x += random(-2,2);
    y += random(-2,2);
  }

  // Return the letter home
  void home() {
    x = homex;
    y = homey; 
  }
}