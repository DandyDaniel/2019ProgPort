class Star {
  int x, y, r, speed;

  Star(int x, int y) {
    this.x = x;
    this.y = y;
    r = int(random(1, 3));
    speed = int(random(10, 15));
  }

  void display() {
    noStroke();
    fill(random(150, 222));
    ellipse(x, y, r, r);
  }

  void move() {
    y += speed;
  }

  boolean reachedBot() {
    if (y> height + r*4) {
      return true;
    } else {
      return false;
    }
  }
}
