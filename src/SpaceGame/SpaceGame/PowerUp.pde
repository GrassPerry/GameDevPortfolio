class PowerUp {
  //Member Variables
  int x, y, diam, speed;
  char type;
  color c1;
  
  //Constructor
  PowerUp() {
    x = int(random(width));
    y = -100;
    diam = 100;
    speed = int(random(5, 6));
    if (random(10)>7) {
      //r1 = loadImage("rock01.png");
      type = 'H';
    } else if (random(10)>5) {
      //r1 = loadImage("rock02.png");
      type = 'T';
      c1 = color(0,25,180);
    } else {
      //r1 = loadImage("rock03.png");
      type = 'A';
      c1 = color(180,45,0);
    }
  }

  //Member Methods
  void display() {
    fill(c1);
    ellipse(x,y,diam,diam);
    fill(255);
    textSize(20);
    text(type,x,y-5);
    //imageMode(CENTER);
    //if (diam<1) {
    //  diam = diam-10;
    //}
    //image(r1, x, y);
  }

  void move() {
    y = y + speed;
  }

  boolean reachedBottom() {
    if (y>height+diam) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if(d<50) {
      return true;
    } else {
      return false;
    }
  }
}
