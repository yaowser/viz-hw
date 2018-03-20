class Car {
  // member variables
  color c;
  float xpos, ypos, yspeed;
  //constructor
  Car(/*color cTemp*/) {
    c = color(255);
    ypos = 1200+random(300);
    xpos = 700+round(random(30))*10;
    int cityNum = map.getCityNum();
    //float cummute = dsJob.incomeAdj(cityNum)[3];
    //float cummuteSize = map(cummute, 0, 150000, 0, 204);

    //yspeed = random(8-(cummuteSize/10)*5);
    yspeed = random(8-(MeanGasPrice[cityNum]-2)*5);
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
    if (ypos < 600) {
      ypos = 900;
    }
  }
}