import processing.core.*;
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 
import java.util.ArrayList; 

public class SphereBand {

  PApplet p;
  
  private int particleCount = 72;
  private float radius = 2; 
  private float speedR = 5;
  private float gravity = 0;
  private float termimalRadius = 500;
  private boolean hitBoundary = false;
  private float[] x = new float[particleCount];
  private float[] y = new float[particleCount];
  private float[] rotRad= new float[particleCount];

  public SphereBand(PApplet p) {
    this.p = p;
    p.sphereDetail(8);
    p.noStroke();

    for (int i = 0; i < particleCount; i++) {
      x[i] = 0;
      y[i] = 0;
      rotRad[i] = 2*p.PI/particleCount*i;
    }
  }

  public void display(PApplet p, float z, float gravity, int col, float xRotate) {
    this.gravity = gravity;
    speedR += gravity;

    p.pushMatrix();  // for 3d view w/ rotateX
    p.rotateX(xRotate);
    //rotateY(PI/6);
    p.translate(p.width/2, p.height/2, -z);
    
    // spheres
    for (int i = 0; i < particleCount; i++) {

      p.pushMatrix();   
      p.translate(x[i], y[i]);
      //fill(mouseX * 2, 0, 160);
      p.fill(col);
      p.sphere(radius);
      p.popMatrix();

      if (p.dist(0, 0, x[i], y[i]) < termimalRadius) {
        x[i] += speedR*p.cos(rotRad[i]);
        y[i] += speedR*p.sin(rotRad[i]);
        hitBoundary = false;
      } else {
        hitBoundary = true;
      }
    }
    p.popMatrix();
  }

  public boolean checkBoundary() {
    return hitBoundary;
  }
}
