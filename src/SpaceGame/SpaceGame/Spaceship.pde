class Spaceship {
  //Member Variables
  int x, y, w, laserCount, turretCount, health;
  PImage s1;

  //Constructor
  Spaceship() {
    x = int(random(width));
    y = -100;
    w = int(random(10, 100));
    s1= loadImage("ship2.png");
    laserCount = 1000;
    turretCount = 1;
    health = 100;
  }

  //Member Methods
  void display() {
    imageMode(CENTER);
    image(s1, x, y);
    s1.resize(100,100);
  }
  
  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  boolean fire() {
    if(laserCount>0) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if(d<50) {
      return true;
    } else {
      return false;
    }
  }
  
}
