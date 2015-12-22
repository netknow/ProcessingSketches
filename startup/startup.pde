String name = "Start Up";
PFont[] f;
String[] fontList = PFont.list();
int l = fontList.length;

int current = 0;
void setup(){
  fullScreen();
  l = l - 1;
  background(255,255,255,125);
  f = new PFont[l];
  for(int i =0; i < l; i++){
  f[i] = createFont(fontList[0], 16, true);
  }
}

void draw(){
  current++;
  current %= l;
  textFont(f[current]);
  textSize(random(128));
 
  fill(random(255), random(255), random(255));
  text(name,random(width), random(height));
}

void mousePressed(){
  save("startup.png");
}