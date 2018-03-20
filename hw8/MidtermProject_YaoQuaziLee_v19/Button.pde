// This Button class is copied from the below site and heavily modified
// https://blog.startingelectronics.com/a-simple-button-for-processing-language-code/

class Button {

  // Field

  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  int pressed;  // button pressed 0 or 1.
  color buttonColor;
  int pressedTime; // for the interaction between other buttons; some button need to be deselected based on an order
  // taxButton
  int married; //-1 single, 1 married
  int year; //1 2017, 2 2018
  int selection = -1; // 1 selected, -1 unselected



  // Constructor

  Button() {
  }

  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;

    drawButton(color(224, 224, 224));
  }


  // Method

  void drawButton(color buttonColor) {
    fill(buttonColor);
    stroke(141);
    rect(x, y, w, h, 10);
    textSize(24);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }

  void buttonPressed() {
    if (mouseButton == LEFT) {
      if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
        pressed = (pressed + 1)%2;
        if (pressed == 1) {
          buttonColor = color(#6666FF);
          pressedTime = millis();
          delay(200);
        } else {
          buttonColor = color(224, 224, 224);
          delay(200);
        };
        drawButton(buttonColor);
      }
    }
  }

  // setter to press or unpress button
  void setButton(int pressed) {
    this.pressed = pressed;
    if (pressed == 1) {
      buttonColor = color(0, 0, 255);
    } else {
      buttonColor = color(224, 224, 224);
    };
    drawButton(buttonColor);
  }


  // Tax buttons/ "Easy button"
  void display() {
    if (mouseButton == LEFT) {
      fill(255);
      rect(5, 365, 390, 30);

      //make generic buttons

      for (int i=0; i<4; i++) {
        rect(3+103*i, 365, 103, 33);
      }

      //married block, make sure to include fill and nofill
      fill(#6666FF);
      if (married == 1) {
        rect(3+103, 365, 103, 33);
        println("married");
      } else if (married == -1) {
        rect(3, 365, 103, 33);
        println("single");
      }
      noFill();

      //year block, make sure to include fill and nofill
      fill(#6666FF);
      if (year == 1) {
        rect(3+103*2, 365, 103, 33);
        println("2017");
      } else if (year == 2) {
        rect(3+103*3, 365, 103, 33);
        println("2018");
      }
      noFill();

      //w cloud block,m ake sure to include fill and nofill

      //if (selection == 1) {
      //  fill(232);
      //  rect(980, 10, 150, 30);
      //} else {
      //  noFill();
      //  rect(980, 10, 150, 30);
      //}

      //text overlay
      fill(0);
      textSize(22);
      text("   Single    Married     2017       2018", 5, 370);
    }
  }




  // getter for button pressed
  int getButton() {
    return pressed;
  }

  int getPressedTime() {
    return pressedTime;
  };

  // tax buttons
  int taxPressed() {
    int taxClass = 0;
    if (mouseY >365 && mouseY<398) {
      if (mouseX>3 && mouseX<106) {
        married=-1;
      } else if (mouseX>106 && mouseX<209) {
        married=1;
      } else if (mouseX>209 && mouseX<312) {
        year=1;
      } else if (mouseX>312 && mouseX<415) {
        year=2;
      }
    }
    taxClass = married*year;
    return(taxClass);
  }
  
  int taxYear(){
    return year;
  }
  
  int married(){
   return married; 
  }

  // 'word cloud' button
  //int wordPressed() {
  //  if (mouseY >10 && mouseY<40) {
  //    if (mouseX>980 && mouseX<1130) {
  //      println("Word Cloud");
  //      selection = selection*-1;
  //    }
  //  }
  //  return(selection);
  //}
}