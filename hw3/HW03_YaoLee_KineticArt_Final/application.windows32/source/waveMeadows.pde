void waveMeadows(float p, float q, float s) {
 // Master assembly file for the WAVE at SMU Meadows Museum; 2018.01.28 Mooyoung Lee

  noStroke();

  float[] anglesInit = {p, q, 0};          // initial angle value; bar rotation
  float[] angles = {p, q, 0};              // angle array inside of draw for-loop
  anglesInit[0] = 0.106*sin(60/PI*frameCount);
  float[] xyz = {0, 0, 0};
  float[] scale = {s, s, s};

  // bar wave (original piece = 123 bars)
  for (int i=0; i<160; i++) {
    //angles[0] = barAngle[angleNo];
    //angles[0] = anglesInit[0] + 0.106*sin(60/PI*i);
    angles[0] = 0.106*sin(60/PI*(frameCount+i))+p;

    colNo = abs(255*sin(60/PI*(frameCount+i)));
    color c1 = color(colNo, 0, 0);
    color c2 = color(colNo, colNo, 0);
    color c3 = color(0, colNo, 0);
    color c4 = color(0, colNo, colNo);
    color c5 = color(0, 0, colNo);
    color c6 = color(colNo, 0, colNo);
    color[] colArray = {c1, c2, c3, c4, c5, c6};

    squareBar2(angles, xyz, scale, colArray);
    xyz[0] += 5*s/2;
  };
}