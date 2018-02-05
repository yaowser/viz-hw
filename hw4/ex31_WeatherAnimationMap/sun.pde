void sun() {
  // Sun; 2/4/2018 Mooyoung Lee
  // Function: draw Sun animation
  
  float var1 = 25*sin(frameCount/PI/10);
  float var2 = 10*cos(frameCount/PI/10);

  //translate(var1, var2);

  float r = 50;   // radius of Sun
  float alpha = PI/6;
  float triHgt = r*cos(alpha/2); // r*cos(theta), height shift
  float triWidth = r*sin(alpha/2);
  float[][] points = {{-triWidth, triHgt, 0}, 
    {triWidth, triHgt, 0}, 
    {0, triHgt, 0}};

  pushMatrix();
  translate(var1, var2);
  // Flame of the Sun
  for (int k=0; k<12; k++) {

    // Flame height
    fill(255, 128, 0);
    if (k%2 == 1) {
      points[2][1] = var1+triHgt*2;
    } else {
      points[2][1] = var2+triHgt*2;
    }
    noStroke();
    pushMatrix();
    rotate(alpha*k);
    triangle(points[0][0], points[0][1], points[1][0], points[1][1], points[2][0], points[2][1]);  // draw triangle
    popMatrix();

    stroke(255, 165, 0);
    strokeWeight(3);
    fill(255, 255, 0);
    ellipse(0, 0, r*2, r*2);
  }
  popMatrix();
}