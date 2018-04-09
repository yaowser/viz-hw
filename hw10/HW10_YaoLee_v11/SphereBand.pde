class SphereBand {

  int particleCount = 72;
  float radius = 2; 
  float speedR = 5;
  float gravity = 0;
  float termimalRadius = 500;
  boolean hitBoundary = false;
  float[] x = new float[particleCount];
  float[] y = new float[particleCount];
  float[] rotRad= new float[particleCount];

  SphereBand() {
    sphereDetail(8);
    noStroke();

    for (int i = 0; i < particleCount; i++) {
      x[i] = 0;
      y[i] = 0;
      rotRad[i] = 2*PI/particleCount*i;
    }
  }

  void display(float z, float gravity, color col, float xRotate) {
    this.gravity = gravity;
    speedR += gravity;

    pushMatrix();  // for 3d view w/ rotateX
    rotateX(xRotate);
    //rotateY(PI/6);
    translate(width/2, height/2, -z);
    
    // spheres
    for (int i = 0; i < particleCount; i++) {

      pushMatrix();   
      translate(x[i], y[i]);
      //fill(mouseX * 2, 0, 160);
      fill(col);
      sphere(radius);
      popMatrix();

      if (dist(0, 0, x[i], y[i]) < termimalRadius) {
        x[i] += speedR*cos(rotRad[i]);
        y[i] += speedR*sin(rotRad[i]);
        hitBoundary = false;
      } else {
        hitBoundary = true;
      }
    }
    popMatrix();
  }

  boolean checkBoundary() {
    return hitBoundary;
  }
}
