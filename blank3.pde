//Font
PFont f;

// back button and front button
PImage back_image, front_image, demo_image;

// A state variable determines what elements are visible on the screen
int state;

//Strings
String message1 = "Welcome to GeekCafe";
String message2 = "Demo";
String message3 = "Cool";
String message4 = "This is a Demo";

// An array of Letter objects of type button
Text_Button greeting, demo, next;

// Manage this with "state" variable
boolean greeting_ = false, demo_ = false, next_ = false;
boolean welcome = true;

// An image button class
Image_Button backButton, frontButton, demoImage;

void setup() {
  size(920, 760);
  // Load the font
  f = createFont("Arial",64,true);
  textFont(f);
  greeting = new Text_Button(message1, 20, 50);
  demo = new Text_Button(message2, 70, 180);
  next = new Text_Button(message3, 100, 310);
  //back_image = new PImage(); //the next line is enough to instantiate the PImage
  back_image = loadImage("arrow_960_720.png");
  front_image = loadImage("front_960_720.png");
  demo_image = loadImage("demo.png");
  demo_image.resize(600, 400);
  back_image.resize(50, 50);
  front_image.resize(50, 50);
  backButton = new Image_Button(back_image, back_image.width, height - back_image.height, "bac");
  frontButton = new Image_Button(front_image, width - front_image.width, height - front_image.height, "fron");
  demoImage = new Image_Button(demo_image, width/2, height/2, "demo");
}

void show_welcome(){
  backButton.deactivate();
  greeting.activate();
  demo.activate();
  next.activate();
  greeting.display();
  demo.display();
  next.display();
  frontButton.display();
}

void show_demo(){
  background(255);
    greeting.deactivate();
    next.deactivate();
    demo.deactivate();
    backButton.activate();
    backButton.display();
    imageMode(CENTER);
    demoImage.display();
}
void draw() { 
  background(255);
  
  // display screen one
  // this screen shows the welcome message, "demo" button, and "get started" button
  // When you click on the "get_started" button
  // and so far a demo hasn't been viewed, then highlight the demo button on the top
  if(welcome){
    show_welcome();
  }
  
  if(demo.was_pressed){
    welcome = false;
    show_demo();
  }
  
  if(demo.was_pressed && backButton.was_pressed){
    backButton.was_pressed = false;
    demo.was_pressed = false;
    welcome = true;
    show_welcome();
  }
}