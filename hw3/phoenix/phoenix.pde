PFont f;

float[] ship = {
  0,0,
  2,0,
  2,1,
  1,1,
  1,2,
  2,2,
  2,1,
  3,1,
  3,0,
  5,0,
  5,1,
  6,1,
  6,2,
  7,2,
  7,1,
  6,1,
  6,0,
  8,0,
  8,6,
  6,6,
  6,5,
  7,5,
  7,4,
  6,4,
  6,5,
  5,5,
  2,5,
  2,4,
  1,4,
  1,5,
  2,5,
  2,6,
  0,6
};

float[] enemyFire = {
  0,0,
  2,0,
  2,2,
  0,2
};

float[] enemyFireDiag = {
  0,0,
  1,0,
  1,1,
  2,1,
  2,0,
  3,0,
  3,1,
  2,1,
  2,2,
  3,2,
  3,3,
  2,3,
  2,2,
  1,2,
  1,3,
  0,3,
  0,2,
  1,2,
  1,1,
  0,1
};

float[] bounceMine = {
  0,0,
  1,0,
  1,1,
  2,1,
  2,0,
  3,0,
  3,1,
  4,1,
  4,0,
  5,0,
  5,1,
  4,1,
  4,2,
  5,2,
  5,3,
  4,3,
  4,4,
  5,4,
  5,5,
  4,5,
  4,4,
  3,4,
  3,5,
  2,5,
  2,4,
  1,4,
  1,5,
  0,5,
  0,4,
  1,4,
  1,3,
  0,3,
  0,2,
  1,2,
  1,1,
  0,1
};

float[] podfire = {
  1,0,
  3,0,
  3,1,
  4,1,
  4,3,
  3,3,
  3,4,
  4,4,
  4,6,
  0,6,
  0,4,
  1,4,
  1,3,
  0,3,
  0,1,
  1,1
};

float[] enemy = {
  1,1,
  1,0,
  2,0,
  2,3,
  3,3,
  3,2,
  5,2,
  5,3,
  6,3,
  6,0,
  7,0,
  7,1,
  8,1,
  8,7,
  7,7,
  7,8,
  6,8,
  6,5,
  5,5,
  5,6,
  3,6,
  3,5,
  2,5,
  2,8,
  1,8,
  1,7,
  0,7,
  0,1
};

float[] boss = {
  0,0,
  1,0,
  1,1,
  2,1,
  2,2,
  3,2,
  3,3,
  13,3,
  13,2,
  14,2,
  14,1,
  15,1,
  15,0,
  16,0,
  16,9,
  15,9,
  15,10,
  14,10,
  14,11,
  13,11,
  13,12,
  3,12,
  3,11,
  2,11,
  2,10,
  1,10,
  1,9,
  0,9,
};

float[] bossEye1 = {
  0,0,
  3,0,
  3,1,
  4,1,
  4,2,
  5,2,
  5,6,
  2,6,
  2,5,
  1,5,
  1,4,
  0,4
};

float[] bossEye2 = {
  5,0,
  2,0,
  2,1,
  1,1,
  1,2,
  0,2,
  0,6,
  3,6,
  3,5,
  4,5,
  4,4,
  5,4
};

float[] money = {
  0,1,
  5,1,
  5,2,
  1,2,
  1,3,
  5,3,
  5,6,
  0,6,
  0,5,
  4,5,
  4,4,
  0,4,
};

float[] moneyLine = {
  0,0,
  1,0,
  1,7,
  0,7
};

float[] damagedShip = {
  1,0,
  1,3,
  0,3,
  0,5,
  1,5,
  1,6,
  2,6,
  2,5,
  5,5,
  5,4,
  6,4,
  6,1,
  7,1,
  7,5,
  6,5,
  6,6,
  7,6,
  7,5,
  8,5,
  8,1,
  7,1,
  7,0,
  6,0,
  6,1,
  5,1,
  5,0,
  3,0,
  3,3,
  4,3,
  4,0,
  5,0,
  5,4,
  2,4,
  2,5,
  1,5,
  1,3,
  2,3,
  2,0  
};

float[] explosion = {
1.625,5.5,
1.625,5.5,
0,4.333333333,
1.75,3.166666667,
0.5,0.5,
2.75,2.833333333,
2.5,0.166666667,
3.875,2.666666667,
4,0,
5,2.833333333,
6.5,0.5,
5.75,3.833333333,
7.125,3.5,
6,5.166666667,
7.375,8.166666667,
5,5,
5.25,9,
3.875,5,
3.125,8.666666667,
2.75,4.666666667,
1,8.5,
1.625,5.5,
1.625,5.5
};

float[] explosionInner = {
0,1.5,
0,1.5,
1,2.5,
0.75,0.166666667,
1.5,1.833333333,
1.875,0,
2,1.666666667,
2.75,0.5,
2.375,2.166666667,
3.5,1.5,
2.375,2.666666667,
3.5,2.5,
2.375,3.333333333,
3,4.166666667,
1.875,3.5,
2,4.833333333,
1.5,3.5,
0.5,4.833333333,
1.25,3,
0.125,3.5,
0.625,2.666666667,
0.625,2.666666667,
0,0
};


void setup() {
  size(480,330);
}

void draw() {
  
  

  fill(40);
  noStroke();
  beginShape();
  for (int i = 0; i<enemyFire2.length; i +=2){
    vertex(enemyFire2[i]*5, enemyFire2[i+1]*5);
  }
  endShape(CLOSE);
}


  //fill(40);
  //noStroke();
  //beginShape();
  //for (int i = 0; i<boss.length; i +=2){
  //  vertex(boss[i]*5, boss[i+1]*5+5);
  //}
  //endShape(CLOSE);
  
  //fill(250);
  //noStroke();
  //beginShape();
  //for (int i = 0; i<bosseye1.length; i +=2){
  //  vertex(bosseye1[i]*5+2*5, bosseye1[i+1]*5+5*5);
  //}
  //endShape(CLOSE);
  
  //beginShape();
  //for (int i = 0; i<bosseye2.length; i +=2){
  //  vertex(bosseye2[i]*5+9*5, bosseye2[i+1]*5+5*5);
  //}
  //endShape(CLOSE);


  //fill(40);
  //noStroke();
  //beginShape();
  //for (int i = 0; i<money.length; i +=2){
  //  vertex(money[i]*5, money[i+1]*5+5);
  //}
  //endShape(CLOSE);
  
  //noStroke();
  //beginShape();
  //for (int i = 0; i<moneyline.length; i +=2){
  //  vertex(moneyline[i]*5+2*5, moneyline[i+1]*5+5);
  //}
  //endShape(CLOSE);
  
  
  //  fill(40);
  //noStroke();
  //beginShape();
  //for (int i = 0; i<explosion.length; i +=2){
  //  vertex(explosion[i]*5+2*5, explosion[i+1]*5+2*5);
  //}
  //endShape(CLOSE);
  
  //  fill(250);
  //noStroke();
  //beginShape();
  //for (int i = 0; i<explosionInner.length; i +=2){
  //  vertex(explosionInner[i]*5+4*5, explosionInner[i+1]*5+3.5*5);
  //}
  //endShape(CLOSE);

//enemy fire orthogonal reflection

//landscape sides random scrolling