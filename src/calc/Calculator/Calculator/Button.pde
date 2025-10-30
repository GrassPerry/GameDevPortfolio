class Button {
  //member variables
  int x, y, w, h;
  char val;
  boolean over;
  color c1, c2;

  //constructor
  Button(int x, int y, int w, int h, char val, color c1, color c2) {
    this.x = x;
    this.y =y;
    this.w = w;
    this.h = h;
    this.val = val;
    this.c1 = c1;
    this.c2 = c2;
    over = false;
  }

  void display() {
    //button OwO
    rectMode(CENTER);
    if(over == true) {
      fill(c2);
    } else {
    fill(c1);
    }
    strokeWeight(2);
    stroke(50);
    rect(x, y, w, h, 4);
    //text properties
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(25);
    text(val, x, y);
  }

  void hover(int tempX, int tempY) {
    if(x>tempX-w/2 && x<tempX+w/2 && y>tempY-h/2 && y<tempY+h/2) {
      over = true;
    } else {
      over = false;
    }
  }
}
