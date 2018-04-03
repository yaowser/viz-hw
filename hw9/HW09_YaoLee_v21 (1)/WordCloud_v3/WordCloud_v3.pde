//had to separate files because wordcloud can't render in P2D and Pshader in the game requires P2D...incompatibility with each other
//sentiment analysis of similar game reviews in the app store for turret games
//source https://wordcram.wordpress.com/

import java.awt.Shape;
import java.awt.geom.Area;
import wordcram.*;
import wordcram.text.*;
import java.awt.geom.Rectangle2D;
import processing.sound.*;
WordCram wordCram;
int next;

SoundFile file;
//replace the sample.mp3 with your audio file name here
String audioName = "Hercules Takes Off.mp3";
String audioName2 = "Heero's Time of Decision.mp3";
String path;
Boolean play = false;

void playMusic(String audioName){
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  //file.play();
}

void setup()
{  
  textAlign(CENTER, CENTER);
  //fullScreen();
  size(1200, 800);
  PImage image = loadImage("resistantAlly.gif");
  Shape imageShape = new ImageShaper().shape(image, #000000);
  ShapeBasedPlacer BasedPlacer = new ShapeBasedPlacer(imageShape);
  background(0);
  colorMode(HSB);
  initWordCram(BasedPlacer);
  textSize(30);
  fill(255);
  text("Click to Continue",600,780);
}

void draw() {
  if (play == false){
    //playMusic(audioName);
    play = true;
  }
  if (next == 1){
    if (wordCram.hasMore()) {
      if (next == 1){
        wordCram.drawNext();
      } 
    }
  } else {
  }
  fill(255);
  noStroke();
  fill(0);
  textSize(30);
  println(mouseX, mouseY); //x range 0 to 295; y range 0 to 705
}

void initWordCram(ShapeBasedPlacer BasedPlacer) {
  wordCram = new WordCram(this)
      .fromTextFile("data.txt") //change this and rerun percity
      .withPlacer(BasedPlacer)
      .withNudger(BasedPlacer)
      .sizedByWeight(10, 90)
      .withColors(color(#0080FF), color(#FFC0CB), color(#FDEE00));
}

void keyPressed() {
    next = 1;
    //file.stop();
    //playMusic(audioName2);
}
