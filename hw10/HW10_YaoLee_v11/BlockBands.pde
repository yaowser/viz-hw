class BlockBands {

  // class variables 

  ArrayList<BlockBand> blockBands= new ArrayList();
  color col;
  float maxAmp; // record of highest amplitude

  // constructors

  BlockBands() {
  }

  BlockBands(int binSize) {

    //create numerous block bands
    for ( int i = 0; i<binSize; i++) {
      blockBands.add(new BlockBand());
    }
  }

  // methods
 
  void display(float amplitude, float yRotate, int binSize, int i) {
    hint(ENABLE_DEPTH_MASK);
    // record maxAmp
    if (amplitude > maxAmp) { 
      maxAmp = amplitude;
    }
    //color change
    if (amplitude > 0.6*maxAmp) {
      col = color(255, 0, 255);
    } else {
      col = color(i*15, 255, 255-i*15 );
    }

    //void display(float z, float amplitude, color col, float bins, float yRotate) {
    blockBands.get(i).display(100, amplitude, col, binSize, yRotate, i);
  }
}
