PFont f;
PImage back_image, front_image;
String message1 = "Welcome to GeekCafe";
String message2 = "Demo";
String message3 = "Got it";
// An array of Letter objects
Welcome greeting, demo, next;
boolean greeting_ = false, demo_ = false, next_ = false;
Image_Button back;

void setup() {
  size(960, 720);
  // Load the font
  f = createFont("Arial",64,true);
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
    back = new Image_Button(back_image, 40, 80);
    back.display();
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


class Welcome extends Button {
  String message;
  Letter[] letters;

  Welcome(String msg, int X, int Y){
    super(X, Y);
    message = msg;
    letters = new Letter[message.length()];  
    // Initialize Letters at the correct x location
    int x = x_;
    for (int i = 0; i < message.length(); i++) {
      letters[i] = new Letter(x,y_,message.charAt(i)); 
      x += textWidth(message.charAt(i));
    }
    set_width(x - x_);
    set_height(int(textAscent() + textDescent()));
    active = true;
  }// Welcome() constructor over
  
  void display(){
    if(! active){
      return;
    }
    for (int i = 0; i < letters.length; i++) {
    // Display all letters
    letters[i].display();
    // If the mouse is pressed the letters shake
    // If not, they return to their original location
    if (mouse_was_pressed_on_me()) {
      letters[i].shake();
    } else {
      letters[i].home();
    }//if-else ends
    
   }//for ends
  }//display over
  
  boolean mouse_was_pressed_on_me(){
    if(mouseX > x_ && mouseX < x_ + width_ && mouseY > y_ - textAscent() && mouseY < y_ + textDescent()){
      if(mousePressed){
        return true;
      }
    }
    return false;
  }
}

class Image_Button extends Button{
  PImage image_;
  Image_Button(PImage image, int x_, int y_){
    super(x_, y_);
    image_ = image;
    set_width(image_.width);
    set_height(image_.height);
 }
  
  void display(){
    pushMatrix();
    translate(width_, height - height_);
    image(back_image, 0, 0);
    popMatrix();
    if(mouse_was_pressed_on_me()){
      println("back button was pressed");
    }
  }
}

class Button{
  int width_, height_, x_, y_;
  boolean active;
  Button(int x, int y){
    x_ = x;
    y_ = y;
  }
  void set_width(int w_){
    width_ = w_;
  }
  void set_height(int h_){
    height_ = h_;
  }
  boolean mouse_was_pressed_on_me(){
    if(mouseX > x_ && mouseX < x_ + width_ && mouseY > y_ && mouseY < y_ + width_){
      if(mousePressed){
        return true;
      }
    }
    return false;
  }
  void deactivate(){
    active = false;
  }
  void activate(){
    active = true;
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