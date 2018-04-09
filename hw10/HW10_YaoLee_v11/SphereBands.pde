class SphereBands {

  // class variables

  SphereBand sphereBand;
  int numBands = 4;
  int currentNumBands = 0;
  boolean maxNumReached = false;
  ArrayList<SphereBand> bands = new ArrayList(1);
  float bandCountCurrent = 0;
  float birthRate = 0.6;
  color col;

  // class constructors

  SphereBands() {
    //create numerous sphere bands
    for ( int i = 0; i<numBands; i++) {
      bands.add(new SphereBand());
    }
  }

  //methods
  
  void display(float z, float gravity, float xRotate) {
    //println(gravity);
    for (int b = 0; b <floor(bandCountCurrent); b++) {
      if (bands.get(b).checkBoundary()) {
        bands.remove(b);
        bandCountCurrent -= 1;
      } else {
        if (b==0) {
          col = color(gravity*40, gravity*40, 0);
        } else if (b==2) {
          col = color(0, gravity*40, gravity*40);
          //}else if(b==4){
          //  col = color(0,0,gravity*40);
        } else {
          col = color(random(255), random(255), random(255));
        }
        bands.get(b).display(z, -1/gravity, col, xRotate);
        bands.add(new SphereBand());
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
