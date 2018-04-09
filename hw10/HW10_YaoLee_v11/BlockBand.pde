class BlockBand {

  int particleCount = 30;
  float binWidth;
  float[] x = new float[particleCount];
  float[] ampHist = new float[particleCount];
  float[] rotRad= new float[particleCount];


  BlockBand() {
    noStroke();
    for (int i = 0; i < particleCount; i++) {
      x[i] = 0;
      rotRad[i] = -2*PI/particleCount*i;
    }
  }

  void display(float z, float amplitude, color col, float bins, float yRotate, int binNo) {
    hint(ENABLE_DEPTH_MASK);
    binWidth = (width-300)/bins;
    
    // memory for the previous amplitudes
    for (int i = 0; i < particleCount; i++) {
      if (i !=0) {
        ampHist[particleCount-i] =  ampHist[particleCount-i-1];
      } else {
        ampHist[0] = amplitude;
      }
    }
    pushMatrix();  // for 3d view w/ rotateX
    //rotateX(xRotate);
    rotateY(yRotate);
    translate(200+binNo*binWidth, height/2, -z);


    // blocks
    for (int i = 0; i < particleCount; i++) {
      pushMatrix();   
      //translate(0, 100, 100);
      rotateX(rotRad[i]);
      fill(col);
      box(binWidth, ampHist[i], 20);
      popMatrix();
    }
    popMatrix();
  }
}
