class Laser {
  //Member Variables
  int x, y, w, h, speed;
  PImage l1;

  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 6;
    h = 12;
    speed = 5;
    l1= loadImage("laser01.gif");
  }

  //Member Methods
  void display() {
    imageMode(CENTER);
    l1.resize(50,50);
    image(l1, x, y);
  }

  void move() {
    y = y - speed;
  }


  void fire() {
  }

  boolean reachedTop() {
    if (y<0-20) {
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
