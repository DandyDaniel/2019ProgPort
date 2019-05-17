//Coded by Godd Howard at Brothesda Studios
Button[] numBtns = new Button[10];
Button[] opBtns = new Button[13];
String displayVal, leftVal, rightVal;
char opVal;
float result;
boolean firstNum, dec;
//Button btn0, btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9;
//Button btnPlus, btnMinus, btnMultiply, btnDivide;

void setup() {
  size(600, 1000);
  displayVal = "";
  leftVal = "";
  rightVal = "";
  opVal = ' ';
  result = 0.0;
  firstNum = true;
  dec = false;
  numBtns[0] = new Button(105, 923, 125, 125, 0, color(141, 90, 167));
  numBtns[1] = new Button(105, 793, 125, 125, 1, color(141, 90, 167));
  numBtns[2] = new Button(234, 793, 125, 125, 2, color(141, 90, 167));
  numBtns[3] = new Button(363, 793, 125, 125, 3, color(141, 90, 167));
  numBtns[4] = new Button(105, 663, 125, 125, 4, color(141, 90, 167));
  numBtns[5] = new Button(234, 663, 125, 125, 5, color(141, 90, 167));
  numBtns[6] = new Button(363, 663, 125, 125, 6, color(141, 90, 167));
  numBtns[7] = new Button(105, 533, 125, 125, 7, color(141, 90, 167));
  numBtns[8] = new Button(234, 533, 125, 125, 8, color(141, 90, 167));
  numBtns[9] = new Button(363, 533, 125, 125, 9, color(141, 90, 167));

  opBtns[0] = new Button(492, 793, 125, 125, 0, color(118, 199, 139)).asOperator("+");
  opBtns[1] = new Button(492, 663, 125, 125, 0, color(216, 188, 230)).asOperator("–");
  opBtns[2] = new Button(492, 533, 125, 125, 0, color(195, 249, 252)).asOperator("x");
  opBtns[3] = new Button(492, 325, 125, 90, 0, color(230, 225, 128)).asOperator("÷");
  opBtns[4] = new Button(492, 420, 125, 90, 0, color(207, 134, 131)).asOperator("^");
  opBtns[5] = new Button(363, 420, 125, 90, 0, color(111, 60, 137)).asOperator("%");
  opBtns[6] = new Button(234, 420, 125, 90, 0, color(111, 60, 137)).asOperator("±");
  opBtns[7] = new Button(105, 420, 125, 90, 0, color(91, 60, 117)).asOperator("Snap");
  opBtns[8] = new Button(363, 325, 125, 90, 0, color(111, 60, 137)).asOperator("1/x");
  opBtns[9] = new Button(234, 325, 125, 90, 0, color(111, 60, 137)).asOperator("x²");
  opBtns[10] = new Button(105, 325, 125, 90, 0, color(111, 60, 137)).asOperator("√");
  opBtns[11] = new Button(234, 923, 125, 125, 0, color(91, 60, 117)).asOperator(".");
  opBtns[12] = new Button(428, 923, 255, 125, 0, color(91, 60, 117)).asOperator("=");
}

void draw() {
  background(0);
  fill(167, 136, 168);
  rect(width/2, height/2, 580, 1000, 50);
  for (int i= 0; i<numBtns.length; i++) {
    numBtns[i].display();
    numBtns[i].hover();
  }
  for (int i= 0; i<opBtns.length; i++) {
    opBtns[i].display();
    opBtns[i].hover();
  }
  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(121, 60, 147);
  rect(width/2, 115, 510, 215, 50);
  fill(255);
  textSize(52);
  textAlign(RIGHT, CENTER);
  if (displayVal == "NaN") {
    text("NaNi", 520, 80);
  } else if (displayVal == "Infinity") {
    text("Infinity Gauntlet", 520, 80);
  } else {
    text(displayVal, 520, 80);
  }
}
void mouseReleased() {
  for (int i = 0; i<numBtns.length; i ++) {
    if (numBtns[i].hov) {
      if (firstNum) {
        leftVal += str(numBtns[i].v);
        displayVal = leftVal;
      } else {
        rightVal += str(numBtns[i].v);
        displayVal = rightVal;
      }
    }
  }
  for (int i = 0; i<opBtns.length; i ++) {
    if (opBtns[i].hov) {
      if (opBtns[i].op == "+") {
        opVal = '+';
        displayVal+=opVal;
        firstNum = false;
      } else if (opBtns[i].op == "-") {
        opVal = '-';
        displayVal+=opVal;
        firstNum = false;
      } else if (opBtns[i].op == "x") {
        opVal = 'x';
        displayVal+=opVal;
        firstNum = false;
      } else if (opBtns[i].op == "÷") {
        opVal = '÷';
        displayVal+=opVal;
        firstNum = false;
      } else if (opBtns[i].op == "%") {
        if (firstNum) {
          leftVal = str(float(leftVal)/100);
          displayVal = leftVal;
        } else {
          rightVal = str(float(leftVal)/100);
          displayVal = rightVal;
        }
      } else if (opBtns[i].op == "^") {
        opVal = '^';
        displayVal+=opVal;
        firstNum = false;
      } else if (opBtns[i].op == "x²") {
        if (firstNum) {
          leftVal = str(pow(float(leftVal), 2));
          displayVal = leftVal;
        } else {
          rightVal = str(pow(float(rightVal), 2));
          displayVal = rightVal;
        }
      } else if (opBtns[i].op == "1/x") {
        if (firstNum) {
          leftVal = str(pow(float(leftVal), -1));
          displayVal = leftVal;
        } else {
          rightVal = str(pow(float(rightVal), -1));
          displayVal = rightVal;
        }
      } else if (opBtns[i].op == "√") {
        if (firstNum) {
          leftVal = str(sqrt(float(leftVal)));
          displayVal = leftVal;
        } else {
          rightVal = str(sqrt(float(rightVal)));
          displayVal = rightVal;
        }
      } else if (opBtns[i].op == "=") {
        performCalc();
      } else if (opBtns[i].op == "Snap") {
        clearApp();
      } else if (opBtns[i].op == ".") {
        if (!dec) {
          if (firstNum) {
            leftVal += opBtns[i].op;
            displayVal = leftVal;
            dec = true;
          } else {
            rightVal += opBtns[i].op;
            displayVal = rightVal;
            dec = true;
          }
        }
      } else if (opBtns[i].op == "±") {
        if (firstNum) {
          leftVal = str(float(leftVal) * -1);
          displayVal = leftVal;
        } else {
          rightVal = str(float(leftVal) * -1);
          displayVal = rightVal;
        }
      }
    }
  }
}


void performCalc() {
  if (opVal == '+') {
    result = float(leftVal) + float(rightVal);
    displayVal = str(result);
    dec = false;
  } else if (opVal == '-') {
    result = float(leftVal) - float(rightVal);
    displayVal = str(result);
    dec = false;
  } else if (opVal == 'x') {
    result = float(leftVal) * float(rightVal);
    displayVal = str(result);
    dec = false;
  } else if (opVal == '÷') {
    result = float(leftVal) / float(rightVal);
    displayVal = str(result);
    dec = false;
  } else if (opVal == '%') {
    result = float(leftVal) / 100;
    displayVal = str(result);
    dec = false;
  } else if (opVal == '^') {
    result = pow(float(leftVal), float(rightVal));
    displayVal = str(result);
    dec = false;
  } else if (opVal == '√') {
    result = pow(float(leftVal), .5);
    displayVal = str(result);
    dec = false;
  } else if (opVal == 'n') {
    result = pow(float(leftVal), -1);
    displayVal = str(result);
    dec = false;
  } else if (opVal == 's') {
    result = pow(float(leftVal), 2);
    displayVal = str(result);
    dec = false;
  }
  leftVal = displayVal;
  firstNum = true;
  //dec = false;
}

void clearApp() {
  displayVal = "0.0";
  leftVal = "";
  rightVal = "";
  opVal = ' ';
  result = 0.0;
  firstNum = true;
  dec = false;
}


void keyPressed() {
  if (key == '1') {
    handleKeyPressed(true, "1");
  } else if (key == '2') {
    handleKeyPressed(true, "2");
  } else if (key == '3') {
    handleKeyPressed(true, "3");
  } else if (key == '4') {
    handleKeyPressed(true, "4");
  } else if (key == '5') {
    handleKeyPressed(true, "5");
  } else if (key == '6') {
    handleKeyPressed(true, "6");
  } else if (key == '7') {
    handleKeyPressed(true, "7");
  } else if (key == '8') {
    handleKeyPressed(true, "8");
  } else if (key == '9') {
    handleKeyPressed(true, "9");
  } else if (key == '0') {
    handleKeyPressed(true, "0");
  } else if (key == '+') {
    handleKeyPressed(false, "+");
  } else if (key == '-') {
    handleKeyPressed(false, "-");
  } else if (key == '*') {
    handleKeyPressed(false, "*");
  } else if (key == '/') {
    handleKeyPressed(false, "/");
  } else if (key == ENTER) {
    handleKeyPressed(false, "=");
  } else if (key == BACKSPACE) {
    handleKeyPressed(false, "C");
  } else if (key == '.') {
    handleKeyPressed(false, ".");
  }
}

void handleKeyPressed(boolean num, String val) {
  if (num) {
    if (firstNum) {
      leftVal += val;
      displayVal = leftVal;
    } else {
      rightVal += val;
      displayVal = rightVal;
    }
  } else {
    if (val == "+") {
      opVal = '+';
      firstNum = false;
      dec = false;
      displayVal += val;
    } else if (val == "-") {
      opVal = '-';
      firstNum = false;
      displayVal += val;
    } else if (val == "*") {
      opVal = 'x';
      firstNum = false;
      dec = false;
      displayVal += val;
    } else if (val == "/") {
      opVal = '÷';
      firstNum = false;
      displayVal += val;
      dec = false;
    } 
    if (val == "=") {
      performCalc();
    } 
    if  (val == "C") {
      clearApp();
    } 
    if (val == ".") {
      if (!dec) {
        if (firstNum) {
          leftVal += val;
          displayVal = leftVal;
          dec = true;
        } else {
          rightVal += val;
          displayVal = rightVal;
          dec = true;
        }
      }
    }
  }
}
