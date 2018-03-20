class Flower{
  float petalX;
  float petalY;
  float flowerX;
  float flowerY;
  int numPetals;
  float n;
  float wave;
  float r;
  float g;
  float b;
  float x1;
  float x2;
   float x3;
  Flower(float _flowerX, float _flowerY,int _numPetals,float _r, float _g, float _b, float _x3){
    flowerX=_flowerX+45;
    flowerY=_flowerY+400;
    numPetals=_numPetals;
   
    x1=2;
    x2=-2;
 
     r=_r;
     g=_g;
     b=_b;
      x3=_x3*1.5;
    }
  void display(){
pushMatrix();
  translate(flowerX, flowerY+x3);
  strokeWeight(5);
  stroke(125, 132, 46);
  translate(n, 0);
  strokeWeight(1);
  noStroke();

  for (float rot = 0; rot < 2*PI; rot += 2*PI/ numPetals) {
    rotate(rot);
    stroke(125, 138, 46);
    fill(255, 255, 157);
    ellipse(-5, -5, 5, 5);
    fill(r,g,b);
    beginShape();
    vertex(5, 5);
    bezierVertex(5, 5, 50, 20, 30, 30);
    bezierVertex(30, 30, 20, 60, 5, 5);
    endShape();
  }
  popMatrix();
 }
 void move(){
   wave=wave+0.003;
   n=noise(wave)*40;
   pushMatrix();
  translate(flowerX, flowerY+x3);
 line(2, 10, 2, 720);
 line(2, 10, 2, 720);
   popMatrix();
}
}
