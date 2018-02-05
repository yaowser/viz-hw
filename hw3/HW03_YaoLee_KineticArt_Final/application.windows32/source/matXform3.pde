float[][] matXform3(float[] a, float[] xyz, float[] scale) {
  /*  Matrix Transformation;  2018.01.25 Mooyoung Lee
   Reference: Transformation matrix equation <http://www.songho.ca/opengl/gl_anglestoaxes.html>
   
   function : Generate a transformation matrix for
   1. rotate a point alpha radians about an axis and
   2. translate along x, y, and z-axis by xyz
   input : a      -  an array of rotation angles in radian about the x, y, and z-axis, {float alpha, float beta, float gamma}
           xyz    -  an array to translate a point along x, y, and z-axis, {float dx, float dy, float dz}
           scale  -  an array to scale along x, y, and z-axis; magnification values
   output: matX   -  a (3x4) transformation matrix
   */
  float[][] matX = {{scale[0]*cos(a[2])*cos(a[1]), scale[0]*(-sin(a[2])*cos(a[0])+cos(a[2])*sin(a[1])*sin(a[0])), scale[0]*(sin(a[2])*sin(a[0])+cos(a[2])*sin(a[1])*cos(a[0])), xyz[0]}, 
    {scale[1]*sin(a[2])*cos(a[1]), scale[1]*(cos(a[2])*cos(a[0])+sin(a[2])*sin(a[1])*sin(a[0])), scale[1]*(-cos(a[2])*sin(a[0])+sin(a[2])*sin(a[1])*cos(a[0])), xyz[1]}, 
    {-sin(a[1])*scale[2], cos(a[1])*sin(a[0])*scale[2], cos(a[1])*cos(a[0])*scale[2], xyz[2]}};
  return matX;
}