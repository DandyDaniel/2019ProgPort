//SpaceShooter App 2018
//by Daniel Wong
//TODO:
//Global Variables for Game Logic
SpaceShip ship;
ArrayList<Laser> lasers;
ArrayList<SpaceRock> rocks;
ArrayList<Star> stars;
Timer tim;
Timer ticTim;
int rockRate = 250;
int score = 0;
int level = 1;
int[] x = new int[500];
int[] y = new int[500];
boolean ticker = false;
boolean play = false;
boolean GO = true;
String ticText = "";
import processing.sound.*;
SoundFile laserShot;
SoundFile gamerTune;

void setup() {
  laserShot = new SoundFile(this, "laserShot.wav");
  gamerTune = new SoundFile(this, "Bodies.mp3");
  size(1000, 1080);
  rocks = new ArrayList<SpaceRock>();
  stars = new ArrayList<Star>();
  ship = new SpaceShip(50);
  lasers = new ArrayList<Laser>();
  tim = new Timer(rockRate);
  ticTim = new Timer(2000);
  tim.start();
  for (int i = 0; i<x.length; i++) {
    x[i] = int(random(0, width));
    y[i] = int(random(0, height));
  }
}


void draw() {
  noCursor();
  background(0);



  if (!play) {
    SS();
  } else if (play) {
    //Leveling Up
    if (score>100) {
      score = 0;
      level ++;
      ticText = "Level: " + level;
      ticker();
      rockRate-=50;
      tim.totalTime = rockRate;
    }

    //Starfield/Background
    stars.add(new Star(int(random(width)), 0));
    for (int i = stars.size()-1; i>= 0; i--) {
      Star star = (Star) stars.get(i);
      star.move();
      star.display();
      if (star.reachedBot()) {
        stars.remove(star);
      }
    }
    if (ticker) {
      if (!ticTim.isFinished()) {
        fill(255);
        textSize(44);
        textAlign(CENTER);
        text(ticText, width/2, height/2);
      } else if (!ticTim.isFinished() && ship.health < 3) {
        fill(255);
        textSize(44);
        textAlign(CENTER);
        text(ticText, width/2, height/2);
      }
    }


    //Amount of Rocks based on timer.
    if (tim.isFinished()) {
      if (random(101)>5) {
        rocks.add(new SpaceRock(int(random(width)), -20, false));
      } else {
        rocks.add(new SpaceRock(int(random(width)), -20, true));
      }
      tim.start();
    }

    //Display Ship
    ship.placeLoc(mouseX, mouseY);
    ship.display();
    updateDisplay();


    for (int i = lasers.size()-1; i>=0; i--) {
      Laser laser = (Laser) lasers.get(i);
      laser.fire();
      laser.display();
      if (laser.reachTop()) {
        lasers.remove(laser);
      }
    }

    for (int i = rocks.size()-1; i>=0; i--) {
      SpaceRock rock = (SpaceRock) rocks.get(i);
      rock.launch();
      rock.display();
      if (rock.reachBottom()) {
        if (rock.isPU) {
          rocks.remove(rock);
        } else {
          rocks.remove(rock);
          ship.health -= 1;
        }
      }
      //Collision Detector Here
      for (int j = lasers.size()-1; j>=0; j--) {
        Laser las = (Laser) lasers.get(j);
        if (dist(las.x, las.y, rock.x, rock.y)<rock.r) {
          rock.health-=10;
          //lasers.remove(las);
          if (rock.health<20) {
            rocks.remove(rock);
            score+=random(1, 3);
          }
        }
      }
      if (dist(ship.x, ship.y, rock.x, rock.y) < ship.r) {
        if (rock.isPU) {
          rocks.remove(rock);
          ship.health += 2;
          
        } else {
          rocks.remove(rock);
          ship.health -= 2;
        }
      }
    }
    if (ship.health<1) {
      GO();
    }
  }
}
void updateDisplay() {
  fill(127, 127);
  rect(5, 14, 100, 70, 7);
  fill(255);
  textAlign(LEFT);
  textSize(12);
  text("Score: " + score, 10, 30);
  text("Health: " + ship.health, 10, 50);
  text("Level: " + level, 10, 70);
}

void SS() {
  background(0);
  textSize(20);
  textAlign(CENTER);
  text("Welcome", width/2, height/2);
  text("Click to Begin...", width/2, height/2+20);

  if (mousePressed) {
    play = true;
    gamerTune.play();
  }
}


void GO() {
  background(0);
  textSize(20);
  textAlign(CENTER);
  fill(222);
  text("GG no re, muchacho", width/2, height/2);
  noLoop();
}

void ticker() {
  ticTim.start();
  ticker = true;
  if (ticTim.isFinished()) {
    ticker = false;
  }
}


void mousePressed() {
  //lasers.add(new Laser(ship.x-30, ship.y-50));
  //lasers.add(new Laser(ship.x+26, ship.y-50));
  lasers.add(new Laser(ship.x-50, ship.y-30));
  lasers.add(new Laser(ship.x+46, ship.y-30));
  laserShot.play();
}

void keyPressed() {
  if (key == ' ') {
    //lasers.add(new Laser(ship.x-30, ship.y-50));
    //lasers.add(new Laser(ship.x+26, ship.y-50));
    lasers.add(new Laser(ship.x-50, ship.y-30));
    lasers.add(new Laser(ship.x+46, ship.y-30));
    laserShot.play();
  }
}
