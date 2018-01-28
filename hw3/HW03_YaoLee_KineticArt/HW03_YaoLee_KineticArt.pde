/* MSDS6390 HW3 Kinetic Sculpture

Date     :  1/29/2018
Designer :  Yao Yao, Mooyoung Lee;
Title    :  New Year Clock

Reference:
 - processing.org/reference 
 - Zinnia Kinetic Sculpture by Clayton Boyer <https://youtu.be/--O9eyKIubY>
 - count up and down https://www.daniweb.com/programming/software-development/threads/352535/how-do-i-create-a-loop-that-counts-back-and-forth

*/

import processing.sound.*;

SoundFile file;
//replace the sample.mp3 with your audio file name here
String audioName = "Aaliyah - We Need A Resolution Instrumental.mp3";
String path;

// global variables
int f = 0; // frame counter
float omega, cnt = 0; // variable speed
float width = 1000, height = 1000;
float x_oscil = width/2, y_oscil = height/2; // x, y position of Oscillation Piece
float scale_oscil = 1;              // scale of Oscillation Piece
float theta_A_oscil = 0;              // angular position of Oscillation part A
float theta_B_oscil = 0;              // angular position of Oscillation part B
boolean goUp = true;
color yes,yes2,yes3;

PFont font;
float x, y, r = 100;
float textH = 15;
float rot,rot2;
ArrayList<ParticleSystem> systems;

// setup

void settings() {           
  //img = loadImage("1.jpg");
  //int iWidth = img.width;
  //int iHeight = img.height;
  int iWidth = 1000;
  int iHeight = 1000;
  size(iWidth, iHeight);
}

void setup(){
  systems = new ArrayList<ParticleSystem>();
  noCursor();
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.play();
}

void mousePressed() {
  systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
}

void draw(){
  background(255);

  pushMatrix();
  translate(x_oscil, y_oscil);
  scale(scale_oscil);
  oscillation(theta_A_oscil, yes);
  scale(-1, 1);
  oscillation(theta_B_oscil, yes);
  popMatrix();
  
  //double changing speed
  theta_A_oscil += PI/360*omega;
  theta_B_oscil += PI/180*omega;
  
  f++; //color changer and speed counter
  if(f !=0 && f%90 == 0) {
    if (goUp) { cnt++; }
    else { cnt--; }
    omega = cnt/2;
    yes = color(random(255),random(255),random(255));
    yes2 = color(random(255),random(255),random(255));
    yes3 = color(random(255),random(255),random(255));
    println("Spin Rate: " + omega);
    if (cnt==7) { goUp = false; }
    if (cnt==1) { goUp = true; }
  }
  
  pushMatrix();
  translate(mouseX, mouseY);
  scale(scale_oscil*1.6);
  clock(yes3);
  mouseClock(yes2);
  scale(-1, 1);
  mouseClock(yes2);
  popMatrix();
  
  for (ParticleSystem ps : systems) {
  ps.run();
  ps.addParticle();
  }
  if (systems.isEmpty()) {
    fill(10);
    textAlign(CENTER);
    text("Click Mouse", width/2, height/2);
  }
}