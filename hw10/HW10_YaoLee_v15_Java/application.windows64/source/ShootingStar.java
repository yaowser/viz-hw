import processing.core.*;

public class ShootingStar {

  private PApplet p;

  // Snowflake; 2018.02.02 Mooyoung Lee

  private int particleCount = 200;
  private float particleCountCurrent = 0;
  private float birthRate =1;
  private float[] x = new float[particleCount];
  private float[] y = new float[particleCount];
  private float[] x2 = new float[particleCount];
  private float[] y2 = new float[particleCount];
  private int[] sideCount = new int[particleCount];
  private float[] radius= new float[particleCount]; 
  private float[] speedX= new float[particleCount];
  private float[] speedY= new float[particleCount];
  private float[] gravity = new float[particleCount];
  private float[] termimalSpd = new float[particleCount];

  // screen limit for rain/snow
  private int xmin = 0; 
  private int xmax = 1200;
  private int ymin = 0;
  private int ymax = 1200;

  public ShootingStar(PApplet p) {
    this.p = p;
    // initial particle setup
    for (int i=0; i< particleCount; i++) {
      x[i] = p.random(xmin+100, xmax-100);
      y[i] = p.random(ymin+100, ymax-100);

      sideCount[i] = 8;//int(random(3, 10));
      speedX[i] = p.random(1, 30);
      speedY[i] = p.random(-1, 1);
      radius[i] = p.random(1, 13);
      gravity[i] = p.random(-1, 1);
      termimalSpd[i] = radius[i]*.2f;

      x2[i] = p.random(xmin+100, xmax-100);
      y2[i] = p.random(ymin+100, ymax-100);
    }
  }



  public void display(PApplet p) {
    this.p = p;
    p.stroke(p.random(50, 150));
    for (int i=0; i< particleCountCurrent; i++) { 
      p.strokeWeight(radius[i]/4);
      p.line(x[i], y[i], x[i]+speedX[i], y[i]+speedY[i]*2) ;
      x[i] += speedX[i];// + random(-1, 1);  // w/ jitter effect
      y[i] += speedY[i];
      speedX[i] += gravity[i];//
      speedX[i] = p.constrain(speedX[i], 5, termimalSpd[i]*13);

      checkCollisions(i);
    }
    if (particleCountCurrent < particleCount - birthRate) {
      particleCountCurrent += birthRate;
    }
  }

  public void checkCollisions(int i) {
    
    if (x[i] > xmax) {
      x[i] = xmin;
    } else if (x[i] < xmin) {
      x[i] = xmax;
    }
    if (y[i] > ymax) {
      y[i] = ymin;
    }
  }
  public void checkCollisions2(int i, PApplet p) {
    this.p = p;
    if (x2[i] > xmax) {
      x2[i] = xmin+100+p.random(0, 50);
      y2[i] = ymin+100+p.random(-30, 0);
    } 
    if (y[i] > ymax) {
      y2[i] = ymin;
    } else if (y[i] < ymin) {
      y2[i] = ymax;
    }
  }
}
