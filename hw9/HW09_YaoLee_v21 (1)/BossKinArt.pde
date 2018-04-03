class BossKinArt {

  color center = color(255, 255, 0);


  BossKinArt() {
  }


  void display(float x, float y, float angle) {
    pushMatrix();
    translate(x, y);
    scale(.2);
    oscillation(angle, center);
    scale(-1, 1);
    oscillation(angle, center);
    popMatrix();
  }

  void oscillation(float theta, color Col) {
    /*  Oscillation Kinetic Art
     2018.01.24 Mooyoung Lee
     
     input: theta -  initial piece rotation angle
     Col   -  color for fill/stroke
     */
    // center circle
    fill(Col);
    ellipse(0, 0, 50, 50);

    // 12 legs
    noFill();
    strokeWeight(10);
    stroke(Col);

    for (int i = 0; i<12; i++) {
      pushMatrix();
      rotate(PI/6*i + theta);
      arc(115, 0, 235, 260, 3.2, 4.13);
      line(50, -110, -24, -175);
      arc(70, -70, 280, 280, 3.98, 5.5);
      popMatrix();
    }
  }
}
