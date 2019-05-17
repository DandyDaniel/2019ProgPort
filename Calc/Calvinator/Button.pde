class Button {
  //Member Variables
  int x, y, w, h, v;
  color c;
  String op;
  boolean hov, asOperator;

  //Multiple Constructors for numbers and other buttons
  Button(int x, int y, int w, int h, int v, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.v = v;
    this.c = c;
    hov = false;
  }

  Button asOperator(String op) {
    this.op = op;
    asOperator = true;
    return this;
  }

  //Display Method
  void display() {
    if (asOperator) {
      rectMode(CENTER);
      if (hov) {
        fill(175);
      } else {
        fill(c);
      }
      //strokeWeight(2);
      rect(x, y, w, h, 20);
      textAlign(CENTER, CENTER);
      fill(255);
      text(op, x, y);
    } else {
      rectMode(CENTER);
      textAlign(CENTER, CENTER);
      if (hov) {
        fill(175);
      } else {
        fill(c);
      }
      rect(x, y, w, h, 15);
      fill(255);
      textSize(26);
      text(v, x, y-2);
    }
  }
  //Hover Method
  void hover() {
    hov = mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
  }
}
