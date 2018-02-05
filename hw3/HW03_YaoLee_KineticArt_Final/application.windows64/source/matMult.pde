float[][] matMult(float[][] matrixA, float[][] matrixB) {
  /*  Matrix Multiplication;  2018.01.24 Mooyoung Lee
      
      Reference: matrix multiplication <https://study.com/academy/lesson/multiplying-matrices-in-java.html> 
  
      input : matrixA, matrixB  -  any size matrices where column number matrixA matches with row number matrixB
      output: matrixC           -  matrix product
  */
  
  // matrix dimensions
  int rowsA = matrixA.length;
  int colsA = matrixA[0].length;
  //int rowsB = matrixB.length;     // can be used for future error handler
  int colsB = matrixB[0].length;

  // output matrix
  float[][] matrixC = new float[rowsA][colsB];
  
  // matrix multiplication
  for (int i=0; i<rowsA; i++) {
    for (int j=0; j<colsB; j++) {
      for (int k=0; k<colsA; k++) {
        matrixC[i][j]= matrixC[i][j]+ matrixA[i][k] * matrixB[k][j];
      }
    }
  }
  return matrixC;
}