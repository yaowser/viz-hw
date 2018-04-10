import processing.core.*;
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 
import java.util.ArrayList; 

public class SphereBands {

  private PApplet p;
  
  // class variables

  private SphereBand sphereBand;
  private int numBands = 4;
  private int currentNumBands = 0;
  private boolean maxNumReached = false;
  private ArrayList<SphereBand> bands = new ArrayList(1);
  private float bandCountCurrent = 0;
  private float birthRate = 0.6f;
  private int col;

  // class constructors

  public SphereBands(PApplet p) {
    this.p = p;
    //create numerous sphere bands
    for ( int i = 0; i<numBands; i++) {
      bands.add(new SphereBand(p));
    }
  }

  //methods
  
  public void display(PApplet p, float z, float gravity, float xRotate) {
    this.p = p;
    //println(gravity);
    for (int b = 0; b <p.floor(bandCountCurrent); b++) {
      if (bands.get(b).checkBoundary()) {
        bands.remove(b);
        bandCountCurrent -= 1;
      } else {
        if (b==0) {
          col = p.color(gravity*40, gravity*40, 0);
        } else if (b==2) {
          col = p.color(0, gravity*40, gravity*40);
          //}else if(b==4){
          //  col = color(0,0,gravity*40);
        } else {
          col = p.color(p.random(255), p.random(255), p.random(255));
        }
        bands.get(b).display(p, z, -1/gravity, col, xRotate);
        bands.add(new SphereBand(p));
      }
    }

    // birth control
    if (bandCountCurrent + birthRate < numBands) {
      bandCountCurrent += birthRate;
    } else {
      maxNumReached = true;
    }
  }
}
