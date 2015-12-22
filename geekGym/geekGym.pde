import controlP5.*;
import java.io.File;
File dir;
File[] files;
ControlP5 cp5;
ArrayList<PImage> images;
int displayed;

void setup() {
  fullScreen();
  
 images = new ArrayList<PImage>();
 dir = new File("/Users/aksinghdce/Documents/processing3/needrepreneur/geekGym/data");

 files = dir.listFiles();
 for( int i=0; i < files.length; i++ ){ 
   String path = files[i].getAbsolutePath();

   // check the file type and work with jpg/png files
   if( path.toLowerCase().endsWith(".jpg") || path.toLowerCase().endsWith(".png") ) {
     
     PImage image = loadImage( path );
     images.add(image);
     //
     // do stuff with your images
     //

   }
  }
 
 
  cp5 = new ControlP5(this);
  ButtonBar b = cp5.addButtonBar("bar")
     .setPosition(0, 0)
     .setSize(width, 40)
     ;
  int i;
  for(i=0; i<images.size(); i++){
    b.addItem(""+i, i);
  }
  
  
}

void bar(int n) {
  displayed = n;
}

void draw() {
  background(220);
  image(images.get(displayed), 0, 40);
}