//Grace Perry | Sept 25 2025 | Calculator
Button[] buttons = new Button [11];
Button[] numButtons = new Button[10];
int num =0;
float l, r, result;
boolean left;
String dVal;
char op;

void setup() {
  size(230, 300);
  background(#AD5EA2);
  left= true;
  l= 0.0;
  r= 0.0;
  result= 0.0;
  dVal = "0.0";
  op = ' ';
  buttons[0] = new Button(25, 70, 40, 40, '±', #AAE8EA, #D827CD);
  buttons[1] = new Button(85, 70, 50, 40, '√', #AAE8EA, #4B4EE0);
  buttons[2] = new Button(165, 70, 80, 40, 'C', #AAE8EA, #F06FE7);
  buttons[3] = new Button(190, 240, 40, 30, '+', #AAE8EA, #6FF0EE);
  buttons[4] = new Button(88, 240, 40, 30, '.', #AAE8EA, #E39A2C);
  buttons[5] = new Button(193, 115, 30, 30, '-', #AAE8EA, #34D11E);
  buttons[6] = new Button(193, 155, 30, 30, '÷', #AAE8EA, #D12F1E);
  buttons[7] = new Button(193, 195, 30, 30, 'x', #AAE8EA, #FF7489);
  buttons[8] = new Button(114, 280, 100, 30, '=', #AAE8EA, #D827CD);
  buttons[9] = new Button(190, 280, 40, 30, '%', #AAE8EA, #4B4EE0);
  buttons[10] = new Button(35, 280, 45, 30, '^', #AAE8EA, #F0D46F);
  numButtons[0] = new Button(140, 240, 40, 30, '0', #FF7489, #AAE8EA);
  numButtons[1] = new Button(150, 195, 30, 30, '1', #D12F1E, #AAE8EA);
  numButtons[2] = new Button(105, 195, 30, 30, '2', #E39A2C, #AAE8EA);
  numButtons[3] = new Button(55, 195, 30, 30, '3', #F0D46F, #AAE8EA);
  numButtons[4] = new Button(150, 155, 30, 30, '4', #34D11E, #AAE8EA);
  numButtons[5] = new Button(105, 155, 30, 30, '5', #6FF0EE, #AAE8EA);
  numButtons[6] = new Button(55, 155, 30, 30, '6', #4B4EE0, #AAE8EA);
  numButtons[7] = new Button(150, 115, 30, 30, '7', #8B1ED1, #AAE8EA);
  numButtons[8] = new Button(105, 115, 30, 30, '8', #F06FE7, #AAE8EA);
  numButtons[9] = new Button(55, 115, 30, 30, '9', #D827CD, #AAE8EA);
}

void draw() {
  background(#AD5EA2);
  for (int i = 0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}


void keyPressed() {
  println("Key: " + key);
  println("KeyCode: " + keyCode);
  if (keyCode == 61) {
    left= false;
    dVal = "0.0";
    op = '+';
  } else if (keyCode == 88) {
    left= false;
    dVal = "0.0";
    op = '*';
  } else if (keyCode == 45) {
    left= false;
    dVal = "0.0";
    op = '-';
  } else if (keyCode == 47) {
    left= false;
    dVal = "0.0";
    op = '/';
  } else if (keyCode == 10) {
    performCalculation();
  } else if (keyCode == 27) {
    //all actions to clear calc
    left= true;
    l= 0.0;
    r= 0.0;
    result= 0.0;
    dVal = "0.0";
    op = ' ';
  } else if (keyCode == 110 || keyCode == 46) {
    if (dVal.contains(".")==false) {
      dVal += ".";
    }
  } else if (keyCode == 49 || keyCode == 97) {
    if (dVal.length()<17) {
      if (left==true) {
        if (dVal.equals("0.0")) {
          dVal = "1";
          l = float(dVal);
        } else {
          dVal += "1";
          l = float(dVal);
        }
      } else if (left == false) {
        if (dVal.equals("0.0")) {
          dVal = "1";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 50 || keyCode == 98) {
    if (dVal.length()<17) {
      if (left==true) {
        if (dVal.equals("0.0")) {
          dVal = "2";
          l = float(dVal);
        } else {
          dVal += "2";
          l = float(dVal);
        }
      } else if (left == false) {
        if (dVal.equals("0.0")) {
          dVal = "2";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 51 || keyCode == 99) {
    if (dVal.length()<17) {
      if (left==true) {
        if (dVal.equals("0.0")) {
          dVal = "3";
          l = float(dVal);
        } else {
          dVal += "3";
          l = float(dVal);
        }
      } else if (left == false) {
        if (dVal.equals("0.0")) {
          dVal = "3";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 52 || keyCode == 100) {
    if (dVal.length()<17) {
      if (left==true) {
        if (dVal.equals("0.0")) {
          dVal = "4";
          l = float(dVal);
        } else {
          dVal += "4";
          l = float(dVal);
        }
      } else if (left == false) {
        if (dVal.equals("0.0")) {
          dVal = "4";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 53 || keyCode == 101) {
    if (dVal.length()<17) {
      if (left==true) {
        if (dVal.equals("0.0")) {
          dVal = "5";
          l = float(dVal);
        } else {
          dVal += "5";
          l = float(dVal);
        }
      } else if (left == false) {
        if (dVal.equals("0.0")) {
          dVal = "5";
          r = float(dVal);
        }
      }
    }
  }else if (keyCode == 54 || keyCode == 102) {
    if (dVal.length()<17) {
      if (left==true) {
        if (dVal.equals("0.0")) {
          dVal = "6";
          l = float(dVal);
        } else {
          dVal += "6";
          l = float(dVal);
        }
      } else if (left == false) {
        if (dVal.equals("0.0")) {
          dVal = "6";
          r = float(dVal);
        }
      }
    }
  }else if (keyCode == 55 || keyCode == 103) {
    if (dVal.length()<17) {
      if (left==true) {
        if (dVal.equals("0.0")) {
          dVal = "7";
          l = float(dVal);
        } else {
          dVal += "7";
          l = float(dVal);
        }
      } else if (left == false) {
        if (dVal.equals("0.0")) {
          dVal = "7";
          r = float(dVal);
        }
      }
    }
  }else if (keyCode == 56 || keyCode == 104) {
    if (dVal.length()<17) {
      if (left==true) {
        if (dVal.equals("0.0")) {
          dVal = "8";
          l = float(dVal);
        } else {
          dVal += "8";
          l = float(dVal);
        }
      } else if (left == false) {
        if (dVal.equals("0.0")) {
          dVal = "8";
          r = float(dVal);
        }
      }
    }
  }else if (keyCode == 57 || keyCode == 105) {
    if (dVal.length()<17) {
      if (left==true) {
        if (dVal.equals("0.0")) {
          dVal = "9";
          l = float(dVal);
        } else {
          dVal += "9";
          l = float(dVal);
        }
      } else if (left == false) {
        if (dVal.equals("0.0")) {
          dVal = "9";
          r = float(dVal);
        }
      }
    }
  }else if (keyCode == 48 || keyCode == 96) {
    if (dVal.length()<17) {
      if (left==true) {
        if (dVal.equals("0.0")) {
          dVal = "0";
          l = float(dVal);
        } else {
          dVal += "0";
          l = float(dVal);
        }
      } else if (left == false) {
        if (dVal.equals("0.0")) {
          dVal = "0";
          r = float(dVal);
        }
      }
    }
  }
}



void mousePressed() {
  //not numbers
  for (int i = 0; i<buttons.length; i++) {
    if (buttons[i].over && buttons[i].val == '+') {
      left= false;
      dVal = "0.0";
      op = '+';
    } else if (buttons[i].over && buttons[i].val == '-') {
      left= false;
      dVal = "0.0";
      op = '-';
    } else if (buttons[i].over && buttons[i].val == '÷') {
      left= false;
      dVal = "0.0";
      op = '/';
    } else if (buttons[i].over && buttons[i].val == '.') {
      if (dVal.contains(".")==false) {
        dVal += ".";
      }
    } else if (buttons[i].over && buttons[i].val == 'x') {
      left= false;
      dVal = "0.0";
      op = '*';
    } else if (buttons[i].over && buttons[i].val == 'C') {
      //all actions to clear calc
      left= true;
      l= 0.0;
      r= 0.0;
      result= 0.0;
      dVal = "0.0";
      op = ' ';
    } else if (buttons[i].over && buttons[i].val == '=') {
      performCalculation();
    } else if (buttons[i].over && buttons[i].val == '±') {
      if (left) {
        l = l*=1;
        dVal = str(l);
      } else {
        r*=r;
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == '^') {
      dVal = "0.0";
      left= false;
      op = '^';
    } else if (buttons[i].over && buttons[i].val == '%') {
      if (left) {
        l = l*=0.01;
        dVal = str(l);
      } else {
        r= r*=0.01;
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == '√') {
      if (left) {
        l =sqrt(l);
        dVal = str(l);
      } else {
        l =sqrt(l);
        dVal = str(r);
      }
    }
  }
  //dVal = "Pressed";
  for (int i = 0; i<numButtons.length; i++) {
    if (dVal.length()<19) {
      if (numButtons[i].over && left == true) {
        if (dVal.equals("0.0")) {
          dVal = str(numButtons[i].val);
          l = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          l= float(dVal);
        }
      } else if (numButtons[i].over && !left) {
        if (dVal.equals("0.0")) {
          dVal = str(numButtons[i].val);
          r = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          r = float(dVal);
        }
      }
    }
  }
  println("l:"+l);
  println("r:"+r);
  println("result:"+result);
  println("op:"+op);
  println("left:"+left);
}

void updateDisplay() {
  rectMode(CORNER);
  fill(255);
  rect(10, 5, 200, 40);
  fill(0);
  textAlign(RIGHT);
  if (dVal.length()>15) {
    textSize(20);
  }
  text(dVal, 205, 35);
}


void performCalculation() {
  if (op == '+') {
    result = l+r;
  } else if (op == '-') {
    result = l-r;
  } else if (op == '/') {
    result = l/r;
  } else if (op == '*') {
    result = l*r;
  } else if (op == '^') {
    result = pow(l, r);
  }
  dVal = str(result);
}
