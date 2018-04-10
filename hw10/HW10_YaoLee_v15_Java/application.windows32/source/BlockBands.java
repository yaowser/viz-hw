import processing.core.*;
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 
import java.util.ArrayList; 

public class BlockBands {

  private PApplet p;
  // class variables 

  private final ArrayList<BlockBand> blockBands= new ArrayList();
  private int col;
  private float maxAmp; // record of highest amplitude

  // constructors

  public BlockBands() {
  }

  public BlockBands(int binSize, PApplet p) {
    this.p = p;
    //create numerous block bands
    for ( int i = 0; i<binSize; i++) {
      blockBands.add(new BlockBand(p));
    }
  }

  // methods

  public void display(PApplet p, float amplitude, float yRotate, int binSize, int i) {
    this.p = p;
    //p.hint(ENABLE_DEPTH_MASK);
    // record maxAmp
    if (amplitude > maxAmp) { 
      maxAmp = amplitude;
    }
    //color change
    if (amplitude > 0.6*maxAmp) {
      col = p.color(255, 0, 255);
    } else {
      col = p.color(i*15, 255, 255-i*15 );
    }

    //void display(PApplet p, float z, float amplitude, int col, float bins, float yRotate, int binNo) {
    blockBands.get(i).display(p, 100, amplitude, col, binSize, yRotate, i);
  }
}
