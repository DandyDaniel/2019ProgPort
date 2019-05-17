//Coded by Daniel Wong
Line [] myLines = new Line[250];
int frames = 0;

void setup() {
  background(random(0, 100));
  size(displayWidth, displayHeight);
  for(int i=0; i<myLines.length; i++) {
    myLines [i] = new Line(random(width),random(height),random(2,10),random(40,60));
  }
  
  frameRate(60);
}

void draw() {
  frames ++;
  if (frames >100){
    background(0);
    frames = 0;
  }
  for(int i=0; i<myLines.length; i++){
    myLines[i].display();
  }
}
