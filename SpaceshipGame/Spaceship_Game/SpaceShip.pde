class SpaceShip {
  //Member Variables
  int x, y, r;
  color c;
  float spd;
  int health;

  //Constructor
  SpaceShip(int r) {
    this.r = r;
    health = 10;
  }
  void placeLoc(int x,int y){
    this.x = x;
    this.y = y;
  }
  //Member Methods
  void display() {
    rectMode(CORNER);
    noStroke();
    fill(255);
    //Main Body
    fill(0, 0, 255);
    triangle(x, y-50, x-30.5, y-18, x+30.5, y-18);
    fill(255);
    ellipse(x, y-20, 19, 60);
    fill(255, 0, 0);
    rect(x-24, y-10, 18, 30);
    rect(x+6, y-10, 18, 30);
    fill(255);
    triangle(x, y-90, x-12, y-30, x+12, y-30);
    triangle(x, y+15, x-5, y+2, x+5, y+2);
    rect(x-2, y+10, 4, 8);
    fill(255, 0, 0);
    triangle(x, y-60, x-4, y-30, x+4, y-30);
    rect(x-4, y-25, 8, 8);

    //Left Wing
    fill(255);
    quad(x-4, y-40, x-50, y, x-52, y+20, x-5, y-10);
    rectMode(CORNER);
    fill(255);
    rect(x-50, y-25, 4, 30);
    rect(x-30, y-45, 4, 30);
    fill(255, 0, 0);
    rect(x-50, y-29, 4.5, 4);
    rect(x-30, y-49, 4.5, 4);

    //Right Wing
    fill(255);
    quad(x+4, y-40, x+50, y, x+52, y+20, x+5, y-10);
    rectMode(CORNER);
    rect(x+46, y-25, 4, 30);
    rect(x+26, y-45, 4, 30);
    fill(255, 0, 0);
    rect(x+46, y-29, 4.5, 4);
    rect(x+26, y-49, 4.5, 4);
  }
}
