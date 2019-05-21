class Laser {
  //Member Variables
  int x, y, w, h;
  color c;
  float speed;
  float r;

  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    speed = random(10,15);
    c = color(255,0,0);
    //speed = 15;
  }
  //Member Methods
  void fire() {
    y -= speed;
  }
  boolean reachTop() {
    if (y<0) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    noStroke();
    fill(c);
    rect(x, y, 4, 25, 7);
  }
}
