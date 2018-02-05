void squareBar2(float[] angles, float[] xyz, float[] scale, color[] colArray) {
  /*  3D bar projection;  2018.01.26 Mooyoung Lee
   
   function : draw a 3D bar projection for the SMU WAVE Kinetic Art w/
              - a complete set of 3D vertices below
              - utilizing matMult and matXform3 functions
              - only the sides that is visible will be drawn

   input : angles -  an array of rotation angles in radian about the x, y, and z axis, {float alpha, float beta, float gamma}
           xyz    -  an array to translate a point along x, y, and z axis, {float dx, float dy, float dz}
           scale  -  an array to scale the final matrix values along x, y, and z axis (3x1)
           color  -  an array to color six different sides, (6x1)
   output: void   -  draw a 3D bar projection on xy-plane
   */
   
  // square bar dimension (inches)
  float x = 5;
  float y = 5;
  float z = 288;

  // 3d figure; list the opposite sides right next to each other
  float[][][] bar = {{{0, -y, -z/2}, {x, -y, -z/2}, {x, 0, -z/2}, {0, 0, -z/2}}, 
    {{0, -y, z/2}, {x, -y, z/2}, {x, 0, z/2}, {0, 0, z/2}}, 
    {{0, -y, -z/2}, {0, -y, z/2}, {0, 0, z/2}, {0, 0, -z/2}}, 
    {{x, -y, -z/2}, {x, -y, z/2}, {x, 0, z/2}, {x, 0, -z/2}}, 
    {{0, -y, -z/2}, {0, -y, z/2}, {x, -y, z/2}, {x, -y, -z/2}}, 
    {{0, 0, -z/2}, {0, 0, z/2}, {x, 0, z/2}, {x, 0, -z/2}}};
  int side = bar.length;
  //float[][] points = new float[4][3];


  int rows = bar[0].length;  // number of points
  float[][] point = new float[4][1];     // input point holder
  float[][] pointH = new float[3][1];    // transformed point holder
  float[][][] pointT = new float[side][rows][3]; // transformed points



  // matrix transformation 
  for (int i=0; i<side; i++) {
    for (int j = 0; j<rows; j++) {
      point = new float[][]{{bar[i][j][0]}, {bar[i][j][1]}, {bar[i][j][2]}, {1}};
      pointH = matMult(matXform3(angles, xyz, scale), point);
      for (int k=0; k<3; k++) {
        pointT[i][j][k] = pointH[k][0];
      }
    }
  }

  // select side to show; 
      // - maximum three sides can be shown; 
      // - take a side that has lower z-value from two opposite sides
  int[] side2show = {0, 0, 0};
  for (int i=0; i<6; i+=2) {
    if (pointT[i][0][2] < pointT[i+1][0][2]) {
      side2show[i/2] = i;
    } else {
      side2show[i/2] = i+1;
    }
  }

  // draw sides
  for (int i=0; i<3; i++) {
    fill(colArray[side2show[i]]);
    draw2D(pointT[side2show[i]], angles, xyz);
  }
}