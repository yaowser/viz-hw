class Car {
  // member variables
  color c;
  float xpos, ypos, yspeed;
  //constructor
  Car(/*color cTemp*/) {
    c = color(255);
    ypos = 300+random(300);//
    xpos = 300+round(random(30))*10;//
    yspeed = random(8-(MeanGasPrice[int(mouseY/35.25)]-2)*5);
  }
  // member methods
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 10, 20);
    rect(xpos-6, ypos-5, 3, 5);
    rect(xpos-6, ypos+5, 3, 5);
    rect(xpos+7, ypos+5, 3, 5);
    rect(xpos+7, ypos-5, 3, 5);
    rectMode(CORNER);
  }
  void drive() {
    ypos = ypos - yspeed;
    if (ypos < 300) {//
      ypos = 600;//
    }
  }
}
