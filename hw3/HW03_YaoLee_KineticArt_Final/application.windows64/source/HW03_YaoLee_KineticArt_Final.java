import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class HW03_YaoLee_KineticArt_Final extends PApplet {

/* MSDS6390 HW3 Kinetic Sculpture

Date     :  1/29/2018
Designer :  Yao Yao, Mooyoung Lee;
Title    :  New Year Clock

Reference:
 - processing.org/reference 
 - Zinnia Kinetic Sculpture by Clayton Boyer <https://youtu.be/--O9eyKIubY>
 - count up and down https://www.daniweb.com/programming/software-development/threads/352535/how-do-i-create-a-loop-that-counts-back-and-forth
 - particle system and clock from Ira Greenberg
 - "Wave" Sculpture by Santiago Calatrava at SMU in Dallas
*/



SoundFile file;
//replace the sample.mp3 with your audio file name here
String audioName = "John Ottoman - Tricks of the Trade.mp3";
String audioName2 = "The Cool Notes - Soul Lang Syne.mp3";
String path;

// global variables
int f = 0;                                   // frame counter
float omega, cnt = 0;                         // variable speed
int width = 1000, height = 1000;
float x_oscil = width/2, y_oscil = height/2; // x, y position of Oscillation Piece
float scale_oscil = 1;                       // scale of Oscillation Piece
float theta_A_oscil = 0;                     // angular position of Oscillation part A
float theta_B_oscil = 0;                     // angular position of Oscillation part B
boolean goUp = true;                         // speed
int yes,yes2,yes3,yes4;                     //color
Boolean play = false;                         //is it new years?
PFont font;
float x, y, r = 100;                         //clock vars
float textH = 15;                             //clock text
float rot,rot2;                               //rotation
ArrayList<ParticleSystem> systems;
float r1,g1,b1,r2,g2,b2;                     //color randomizer
float colNo = 0;                             // a memory for the waveMeadows function
float p = 0, q = 0, s = 1;                   // size and location parameters
String clockText = "Countdown Clock";         // clock text

public void keyPressed() { //manual
  if (key == CODED) {
    if (keyCode == UP) { 
      p -= PI/18 ; // rotate about x-axis
    } else if (keyCode == DOWN) {
      p += PI/18;  // rotate about x-axis
    } else if (keyCode == RIGHT) { //position
      q -= PI/18;  // rotate about y-axis
    } else if (keyCode == LEFT) {
      q += PI/18;  // rotate about y-axis
    } else if (keyCode == ALT) {
      s ++;    // scale up
    } else if (keyCode == CONTROL) {
      s --;    // scale down
    }
    println("p: " + p + ", q: " + q + ", s: " + s);
  }
}

// setup
public void settings() {           
  int iWidth = width;
  int iHeight = height;
  size(iWidth, iHeight);
}

public void playMusic(String audioName){
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.play();
}

public void setup(){
  systems = new ArrayList<ParticleSystem>();
  noCursor();
  playMusic(audioName);
}

public void mousePressed() {
  systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
  if (mouseButton == LEFT) {
    if (play == false) {
      file.stop();
      playMusic(audioName2);
      play = true;
      clockText = "Happy New Year!";
    }
  } else if (mouseButton == RIGHT) {
    if (play == true) {
      file.stop();
      playMusic(audioName);
      play = false;
    }
  }
}

int[] waveOffset = {80, 50, 920, 950, 80};
public void draw(){
  background(yes2);
  
  // frame
  for (int i = 0; i<4; i++){
  pushMatrix();
  translate(waveOffset[i], waveOffset[i+1]);
  rotate(PI/2*(1-i));
  waveMeadows(p, q, s);
  popMatrix();
  }
 
  pushMatrix();
  translate(x_oscil, y_oscil);
  scale(scale_oscil*1.3f);
  oscillation(theta_A_oscil, yes);
  scale(-1, 1);
  oscillation(theta_B_oscil, yes);
  popMatrix();
  
  //double changing speed
  theta_A_oscil += PI/360*omega;
  theta_B_oscil += PI/180*omega;
  
  if(f%90 == 0) {
    if (goUp) { cnt++; }
    else { cnt--; }
    omega = cnt;
    r1 = random(255);
    g1 = random(255);
    b1 = random(255);
    r2 = random(255);
    g2 = random(255);
    b2 = random(255);
    yes = color(r1,g1,b1);
    yes2 = color(255-r1,255-g1,255-b1);
    yes3 = color(r2,g2,b2);
    yes4 = color(255-r2,255-g2,255-b2);
    println("Spin Rate: " + omega);
    if (cnt==7) { goUp = false; }
    if (cnt==1) { goUp = true; }
  }
  f++; //color changer and speed counter
  pushMatrix();
  translate(mouseX, mouseY);
  scale(scale_oscil*1);
  clock(yes4, clockText);
  mouseClock(yes3);
  scale(-1, 1);
  mouseClock(yes3);
  popMatrix();
  
  for (ParticleSystem ps : systems) {
  ps.run();
  ps.addParticle();
  }
  if (systems.isEmpty()) {
    fill(255);
    textAlign(CENTER);
    text("Click for Sparklers and Music; All Arrows, Alt, Ctrl for Wave Effects", width/2-190/2, height/2-90/2, 190, 80);
  } else {
    fill(255);
    textAlign(CENTER);
    text("Click for Sparklers; All Arrows, Alt, Ctrl for Wave Effects", width/2-170/2, height/2-90/2, 170, 80);
  }
}
// A simple Particle class code from Ira Greenberg

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05f);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0f;
  }

  public void run() {
    update();
    display();
  }

  // Method to update position
  public void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0f;
  }

  // Method to display
  public void display() {
    noStroke();
    fill(PApplet.parseInt(random(255)), PApplet.parseInt(random(255)),PApplet.parseInt(random(255)));
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  public boolean isDead() {
    return (lifespan < 0.0f);
  }
}
// An ArrayList is used to manage the list of Particles code from Ira Greenberg

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList<Particle>();   // Initialize the arraylist
    origin = v.copy();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
    }
  }


  public void run() {
    // Cycle through the ArrayList backwards, because we are deleting while iterating
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  public void addParticle() {
    Particle p = new Particle(origin);
    particles.add(p);
  }

  public void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  public boolean dead() {
    return particles.isEmpty();
  }
}
/* Analog Clock
Ira Greenberg, October 9, 2006 */

public void clock(int Col, String clockText){
noFill();
  float px, py, angle = -55;
  pushMatrix();
  stroke(Col);
  fill(260,260,260);
  strokeWeight(4);
  x=0;
  y=0;
  ellipse(x, y, r*2, r*2);
  fill(0,0,0);
  text(clockText, -45, -25, 90, 80);
  strokeWeight(4);
  textSize(16);
  for (int i=1; i<13; i++){
    px = x+cos(radians(angle))*(r*.8f);
    py = y+sin(radians(angle))*(r*.8f);
    fill(0);
    // need to subtract 1/2 text width/height
    // to align center
    
    float textW = textWidth(str(i));
    text(i, px-textW/2, py+textH/2);
    angle+=360/12;
  }
  /*Subtract 90 degs. from each trig function, since 12
  is at top of clock (not at 0 postion on unit circle).
  Other numeric value is calculated by 360/number of units.*/
  //hour hand
  
  
  noFill();
  strokeWeight(4);
  
  float h = hour();
  float hourHandX = x+cos(radians(30*h-90))*(r*.5f);
  float hourHandY = y+sin(radians(30*h-90))*(r*.5f);
  line(x, y, hourHandX, hourHandY);
  //minute hand
  strokeWeight(2);
  
  float m = minute();
  float minuteHandX = x+cos(radians(6*m-90))*(r*.7f);
  float minuteHandY = y+sin(radians(6*m-90))*(r*.7f);
  line(x, y, minuteHandX, minuteHandY);
  //second hand
  strokeWeight(2);
  
  float s = second();
  float secondHandX = x+cos(radians(6*s-90))*(r*.9f);
  float secondHandY = y+sin(radians(6*s-90))*(r*.9f);
  line(x, y, secondHandX, secondHandY);
  popMatrix();
}
public void draw2D(float[][] points, float[] angles, float[] xyz) {
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

  if ((sideA > 0.01f) && (sideB > 0.01f)) {
    beginShape();
    for (int i = 0; i < rows; i++) {
      vertex(pointT[i][0], pointT[i][1]);
    }
    endShape(CLOSE);
  }
}
public float[][] matMult(float[][] matrixA, float[][] matrixB) {
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
public float[][] matXform3(float[] a, float[] xyz, float[] scale) {
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
public void mouseClock(int Col){
  stroke(Col);
  strokeWeight(2);
  noFill();
    for (int i = 0; i<12; i++) {
    pushMatrix();
    rotate(PI/6*i + rot2);
    arc(100, 0, 100, 100, 1, 4.13f);
    arc(0, -70, 280, 280, 2, 3);
    popMatrix();
  }
  rot2 += PI/180;
}
public void oscillation(float theta, int Col){
/*  Oscillation Kinetic Art
    2018.01.24 Mooyoung Lee

    input: theta -  initial piece rotation angle
           Col   -  color for fill/stroke
*/
  // center circle
  fill(Col);
  ellipse(0, 0, 50, 50);

  // 12 legs
  noFill();
  strokeWeight(10);
  stroke(Col);

  for (int i = 0; i<12; i++) {
    pushMatrix();
    rotate(PI/6*i + theta);
    arc(115, 0, 235, 260, 3.2f, 4.13f);
    line(50, -110, -24, -175);
    arc(70, -70, 280, 280, 3.98f, 5.5f);
    popMatrix();
  }
}
public void squareBar2(float[] angles, float[] xyz, float[] scale, int[] colArray) {
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
public void waveMeadows(float p, float q, float s) {
 // Master assembly file for the WAVE at SMU Meadows Museum; 2018.01.28 Mooyoung Lee

  noStroke();

  float[] anglesInit = {p, q, 0};          // initial angle value; bar rotation
  float[] angles = {p, q, 0};              // angle array inside of draw for-loop
  anglesInit[0] = 0.106f*sin(60/PI*frameCount);
  float[] xyz = {0, 0, 0};
  float[] scale = {s, s, s};

  // bar wave (original piece = 123 bars)
  for (int i=0; i<160; i++) {
    //angles[0] = barAngle[angleNo];
    //angles[0] = anglesInit[0] + 0.106*sin(60/PI*i);
    angles[0] = 0.106f*sin(60/PI*(frameCount+i))+p;

    colNo = abs(255*sin(60/PI*(frameCount+i)));
    int c1 = color(colNo, 0, 0);
    int c2 = color(colNo, colNo, 0);
    int c3 = color(0, colNo, 0);
    int c4 = color(0, colNo, colNo);
    int c5 = color(0, 0, colNo);
    int c6 = color(colNo, 0, colNo);
    int[] colArray = {c1, c2, c3, c4, c5, c6};

    squareBar2(angles, xyz, scale, colArray);
    xyz[0] += 5*s/2;
  };
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "HW03_YaoLee_KineticArt_Final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
