int X, Y;

void setup(){
  fullScreen();
}
void draw(){
  X = constrain(mouseX, 300, 600);
  Y = constrain(mouseY, 200, 900);
  beginShape();
  vertex(0, 0);
  bezierVertex(mouseX, mouseY, 60, 90, X, Y);
  endShape();
}