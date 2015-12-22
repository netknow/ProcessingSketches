PImage dart;
void setup(){
  size(250, 250);
  background(230, 235, 233, 0);
  dart = loadImage("dart.png");
  dart.resize(25, 25);
  RecCircle(100, 100, 80);
  RecCircle(160, 100, 80);
  RecCircle(130, 160, 80);
  image(dart, 100, 75);
  image(dart, 160, 75);
  image(dart, 130, 135);
  
}
int RecCircle(int x, int y, int r){
  fill(255-r, r, 0);
  
  ellipse(x,y,r,r);
  if(r<=10)
    return(10);
  else
    return(r * RecCircle(x, y, r-10));
}