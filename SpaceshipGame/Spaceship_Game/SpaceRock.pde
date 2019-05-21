class SpaceRock{
  //Member Variables
  int x,y,r;
  color c;
  float speed;
  int health;
  boolean isPU;
  char PU;
  
  //Constructor
  SpaceRock(int x, int y, boolean isPU) {
    r = int(random(15,55));
    this.x = x;
    this.y = y;
    this.isPU = isPU;
    speed = int(random(5,7));
    c = color(random(200,210),random(175,185), random(135,145));
    health = r;
    
  }
  //Member Methods
  void launch(){
    y += speed;
  }
  
  
  boolean reachBottom() {
    if (y>height + r*4){
      return true;
    } else {
      return false;
    }
  }
  
  void display(){
    if(isPU){
      fill(255,0,0);
    } else {
      fill(c);
    }
    rectMode(CENTER);
    noStroke();
    rect(x,y,health,health);
    textSize(9);
    textAlign(CENTER);
    if(isPU){
      fill(255);
      text("PU",x,y+5);
    } else {
      fill(c);
    }
  }
}
