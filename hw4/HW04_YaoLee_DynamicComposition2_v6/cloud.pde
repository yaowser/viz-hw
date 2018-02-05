void cloud(int extraObj) {
  // Cloud; 2/4/2018 Mooyoung Lee
  // Function: draw cloud animation; extra objects can be shown if follow conditions are met.  
  //extraObj 1 = thunder, 2 = sun

  float shiftRate = frameCount/PI/10;
  noStroke();
  // cloud #1
  pushMatrix();
  translate(0, 20*sin(shiftRate));
  //fill(63, 96, 139);
  fill(16, 53, 97);
  ellipse(145, 45, 100, 100);
  ellipse(195, 85, 100, 100);
  ellipse(255, 125, 100, 100);
  ellipse(100, 85, 100, 100);
  ellipse(190, 140, 120, 120);
  ellipse(105, 140, 100, 120);
  ellipse(50, 125, 100, 100);
  popMatrix();

  // cloud #2
  pushMatrix();
  translate(-30*sin(shiftRate+50), 20*sin(shiftRate+50));
  fill(160, 160, 160);
  ellipse(170, 80, 90, 90);
  ellipse(210, 105, 85, 85);
  ellipse(240, 140, 90, 90);
  ellipse(190, 145, 100, 100);
  ellipse(125, 140, 120, 120);
  ellipse(65, 140, 90, 90);
  ellipse(105, 110, 100, 100);
  popMatrix();

  if (extraObj == 1) {
    //thunder 1
    pushMatrix();
    scale(1.5);
    translate(30, 60*sin(shiftRate));
    fill(255, 128, 0);
    beginShape();
    vertex(95, 115);
    vertex(120, 115);
    vertex(107, 147);
    vertex(130, 147);
    vertex(105, 190);
    vertex(112, 155);
    vertex(89, 155);
    endShape(CLOSE);
    popMatrix();
    //thunder 2
    pushMatrix();
    scale(1.5);
    translate(-30, 70*sin(shiftRate+150));
    fill(255, 128, 0);
    beginShape();
    vertex(95, 115);
    vertex(120, 115);
    vertex(107, 147);
    vertex(130, 147);
    vertex(105, 190);
    vertex(112, 155);
    vertex(89, 155);
    endShape(CLOSE);
    popMatrix();
  } else if (extraObj == 2) {
    pushMatrix();
    //scale(2);
    translate(30,60);
    sun();
    popMatrix();
  }

  //cloud #3
  pushMatrix();
  noStroke();
  translate(30, 20*sin(shiftRate+150)+5);
  fill(16, 53, 97);
  ellipse(90, 60, 80, 70);
  ellipse(135, 85, 80, 70);
  ellipse(60, 90, 80, 70);
  ellipse(35, 120, 80, 80);
  ellipse(75, 125, 70, 80);
  ellipse(125, 130, 100, 75);
  ellipse(175, 120, 50, 60);
  popMatrix();
}