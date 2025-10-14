//Grace Perry | 25 Sept 2025 | SpaceGame
Spaceship s1;
import processing.sound.*;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rockTimer, puTimer;
SoundFile laser;
int score, rocksPass;
PImage bg, gOver, gStart;
boolean play;



void setup() {
  frameRate(35);
  size(500, 500);
  background(22);
  s1 = new Spaceship();
  rockTimer = new Timer(1500);
  rockTimer.start();
  puTimer = new Timer(10000);
  puTimer.start();
  score = 0;
  rocksPass = 0;
  bg= loadImage("background4.png");
  play = false;
  gOver = loadImage("gameOver.png");
  gStart = loadImage("gameStart.png");
  laser = new SoundFile(this, "laser.wav");
}

void draw() {
  if (play == false) {
    startScreen();
  } else {
    background(bg);
    //adding stars
    stars.add(new Star());
    //gameover
    if (s1.health<10) {
      gameOver();
    }
    //rocks appear
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
    }
    //display of rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        rocks.remove(rock);
        score=score+rock.diam;
        s1.health -= 20;
      }
      if (rock.reachedBottom()==true) {
        rocks.remove(rock);
        i--;
        rocksPass++;
      }
    }
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
    }
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp powerup = powerups.get(i);
      powerup.display();
      powerup.move();
      if (powerup.intersect(s1)) {
        //remove powerup
        powerups.remove(powerup);
        //reward for each powerup
        if (powerup.type == 'H') {
          s1.health+=100;
        } else if (powerup.type == 'T') {
          s1.turretCount+=1;
          if (s1.turretCount>5) {
            s1.turretCount=5;
          }
        } else if (powerup.type == 'A') {
          s1.laserCount+=100;
        }
        //
      }
      if (powerup.reachedBottom()==true) {
        powerups.remove(powerup);
        i--;
      }
    }

    // stars disappear
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()==true) {
        stars.remove(star);
      }
    }

    //hehe the sun's deadly lasers >:3
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          //reduce hit point on rock
          r.diam = r.diam - 10;
          if (r.diam<5) {
            rocks.remove(r);
          }
          //2 remove the deadly laser
          lasers.remove(laser);
          //3 add to the score
          score = score + 10;
          //4 powerup depending on score

          //5 effect for visuals
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
      println(lasers.size());
    }

    s1.display();
    s1.move(mouseX, mouseY);

    scorePanel();
  }

  //gameOver criteria
  if (s1.health<1) {
    gameOver();
  }
}

void mousePressed() {
  if (laser.isPlaying()) {
    laser.stop();
  } else {
    laser.play();
  }
  s1.laserCount -= 1;
  if (s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
  } else if (s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
  } else if (s1.turretCount == 3) {
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
  } else if (s1.turretCount == 4) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
  } else if (s1.turretCount == 5) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
  }
}

void scorePanel() {
  rectMode(CENTER);
  fill(67, 137, 255, 137);
  rect(width/2, 475, width, 50);
  fill(255);
  textSize(15);
  textAlign(LEFT);
  text("Score: " + score, 20, 488);
  text("Passed Rocks: " + rocksPass, 350, 488);
  text("Turrets: " + s1.turretCount, 280, 488);
  text("Ammo: "+s1.laserCount, 100, 488);
  text("Health: " +s1.health, 190, 488);
  fill(255);
  rect(50, height-100, 100, 10);
  fill(255, 0, 0);
  rect(50, height-100, s1.health, 10);
}

void startScreen() {
  background(gStart);
  textAlign(CENTER);
  textSize(40);
  text("Click Mouse To Start!!", 250, 400);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(gOver);
  textAlign(CENTER);
  textSize(33);
  text("Good Try", width/2, 400);
  noLoop();
}
