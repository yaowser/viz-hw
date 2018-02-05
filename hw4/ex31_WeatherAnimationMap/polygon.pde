void polygon(float x, float y, int sides, float radius, float strokeWt, color strokeCol) {
// Draw polygon with given number of side and radius
// 1/21/2018 Mooyoung Lee
// Reference: Ira Greenberg; SMU 2DS MSDS6390 CH3

  float theta = 0;
  float x2, y2;
  //strokeWeight(strokeWt);
  //stroke(strokeCol);
  //noFill();
  fill(strokeCol);
  noStroke();

  beginShape();
  for (int i = 0; i<sides; i++) {
    x2 = x + cos(theta + TWO_PI/sides*i)*radius;
    y2 = y + sin(theta + TWO_PI/sides*i)*radius;
    vertex(x2, y2);
  }
  endShape(CLOSE);
}