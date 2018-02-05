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

import processing.sound.*;

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
color yes,yes2,yes3,yes4;                     //color
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

void keyPressed() { //manual
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
void settings() {           
  int iWidth = width;
  int iHeight = height;
  size(iWidth, iHeight);
}

void playMusic(String audioName){
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.play();
}

void setup(){
  systems = new ArrayList<ParticleSystem>();
  noCursor();
  playMusic(audioName);
}

void mousePressed() {
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
void draw(){
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
  scale(scale_oscil*1.3);
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