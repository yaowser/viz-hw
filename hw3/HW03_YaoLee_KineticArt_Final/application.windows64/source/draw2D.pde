void draw2D(float[][] points, float[] angles, float[] xyz) {
  /*  Draw a projection onto xy-plane using a 3D polygon ;  2018.01.24 Mooyoung Lee
   
   function : 2D projection
   1. receive vertices in xyz and transform with axis rotation and translation
   2. draw projected image on the xy-plane
   input : points -  m x 3 matrix; m = 4 or higher, 3 = {x, y, z} value
           axis   -  rotation axis (1 = x-axis, 2 = y-axis, 3 = z-axis)
           alpha  -  rotation amount in radian about the axis
           xyz    -  an array to translate a point along x, y, and z-axis, {float dx, float dy, float dz}
   output: void   -  draw a polygon image on xy-plane
   */

  int rows = points.length;  // number of points
  float[][] point = new float[4][1];     // input point holder
  float[][] pointH = new float[3][1];    // transformed point holder
  float[][] pointT = new float[rows][3]; // transformed points
  float[] scale = {1,1,1};
  
  for (int i = 0; i<rows; i++) {
    point = new float[][]{{points[i][0]}, {points[i][1]}, {points[i][2]}, {1}};
    pointH = matMult(matXform3(angles, xyz, scale), point);
    for (int j=0; j<3; j++) {
      pointT[i][j] = pointH[j][0];
    }
  }

  // side length check; draw only when the sides are greater than 0.01 pixel
  float sideA = dist(pointT[0][0], pointT[0][1], pointT[1][0], pointT[1][1]);
  float sideB = dist(pointT[1][0], pointT[1][1], pointT[2][0], pointT[2][1]);

  if ((sideA > 0.01) && (sideB > 0.01)) {
    beginShape();
    for (int i = 0; i < rows; i++) {
      vertex(pointT[i][0], pointT[i][1]);
    }
    endShape(CLOSE);
  }
}