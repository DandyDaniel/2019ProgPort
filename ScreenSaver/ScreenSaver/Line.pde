class Line {
  //Member Variable
  float xpos;
  float ypos;
  float strokeW;
  float pointCount;
  float rand;

  //Constructor
  Line(float xpos, float ypos, float strokeW, float pointCount) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.strokeW = strokeW;
    this.pointCount = pointCount;
    rand = 0.0;
  }



  //Display Method
  void display() {
    strokeW = random(2, 10);
    pointCount = random(40, 60);
    stroke(random(95,120), random(45,60), random(110,125));
    strokeWeight(strokeW);
    if (xpos > width || xpos <0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      rand = random(100);
      if (rand>75) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, pointCount);
      } else if (rand>50) {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, pointCount);
      } else if (rand>25) {
        strokeWeight(strokeW);
        moveDown(xpos, ypos, pointCount);
      } else {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, pointCount);
      }
    }
  }


  //Movement Method
  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX + i;
    }
  }

  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX - i;
    }
  }

  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      ypos = startY - i;
    }
  }

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      ypos = startY + i;
    }
  }
}
