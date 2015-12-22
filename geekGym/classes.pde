class Button{
  int width_, height_, x_, y_;
  //active: the button is visible
  // was_pressed: the button is visible and pressed
  boolean active, was_pressed;
  //name of the button
  String name_;
  
  Button(String name, int x, int y){
    x_ = x;
    y_ = y;
    name_ = name;
    width_ = 0;
    height_ = 0;
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


class Image_Button extends Button{
  PImage image_;
  int image_id;
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
    
  }//display ends

}