import processing.core.*;

public class BlockBand {
  
  private PApplet p;
  
  private int particleCount = 30;
  private float binWidth;
  private float[] x = new float[particleCount];
  private float[] ampHist = new float[particleCount];
  private float[] rotRad= new float[particleCount];


  public BlockBand(PApplet p) {
    this.p = p;
    p.noStroke();
    for (int i = 0; i < particleCount; i++) {
      x[i] = 0;
      rotRad[i] = -2*p.PI/particleCount*i;
    }
  }

  public void display(PApplet p, float z, float amplitude, int col, float bins, float yRotate, int binNo) {
    this.p = p;
    p.strokeWeight(1);
    p.hint(p.ENABLE_DEPTH_MASK);
    binWidth = (p.width-300)/bins;

    // memory for the previous amplitudes
    for (int i = 0; i < particleCount; i++) {
      if (i !=0) {
        ampHist[particleCount-i] =  ampHist[particleCount-i-1];
      } else {
        ampHist[0] = amplitude;
      }
    }
    p.pushMatrix();  // for 3d view w/ rotateX
    //rotateX(xRotate);
    p.rotateY(yRotate);
    p.translate(200+binNo*binWidth, p.height/2, -z);


    // blocks
    for (int i = 0; i < particleCount; i++) {
      p.pushMatrix();   
      //translate(0, 100, 100);
      p.rotateX(rotRad[i]);
      p.fill(col);
      p.box(binWidth, ampHist[i], 20);
      p.popMatrix();
    }
    p.popMatrix();
  }
}
