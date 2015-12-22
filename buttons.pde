class Text_Button extends Button {
  String message;
  Letter[] letters;

  Text_Button(String msg, int X, int Y){
    super(msg, X, Y);
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
  }// Text_Button() constructor over
  
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
        was_pressed = true;
        return true;
      }
    }
    return false;
  }
}

class Image_Button extends Button{
  PImage image_;
  
  Image_Button(PImage image, int x_, int y_, String name){
    super(name, x_, y_);
    image_ = image;
    width_ = image_.width;
    height_ = image_.height;
 }
  
  void display(){
    if( ! active){
      return;
    }//if ends
    
    pushMatrix();
    translate(x_, y_);
    image(image_, 0, 0);
    //println(x_, y_, width_, height_);
    popMatrix();
    
    if(mouse_was_pressed_on_me()){
      println(name_ + " button was pressed");
    }//if ends
  
  }//display ends

}

class Button{
  int width_, height_, x_, y_;
  boolean active, was_pressed;
  
  String name_;
  Button(String name, int x, int y){
    x_ = x;
    y_ = y;
    name_ = name;
    was_pressed = false;
    active = true;
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
        was_pressed = true;
        println(name_ + " was pressed");
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