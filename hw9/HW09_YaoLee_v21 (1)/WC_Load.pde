import java.awt.Shape;
import java.awt.geom.Area;
import wordcram.*;
import wordcram.text.*;
import java.awt.geom.Rectangle2D;
import processing.sound.*;
import processing.core.PApplet;



class LoadingPage {

  PApplet p = new PApplet(); 
  WordCram wordCram;
  int next;

  SoundFile file;
  //replace the sample.mp3 with your audio file name here
  String audioName = "Hercules Takes Off.mp3";
  String audioName2 = "Heero's Time of Decision.mp3";
  String path;
  Boolean play = false;


  // constructor
  LoadingPage() {
  }

  LoadingPage(PApplet p) {
    this.p = p;

   
    PImage image = loadImage("resistantAlly.gif");
    Shape imageShape = new ImageShaper().shape(image, #000000);
    ShapeBasedPlacer BasedPlacer = new ShapeBasedPlacer(imageShape);
    background(0);
    colorMode(HSB);
    initWordCram(BasedPlacer);
  }

  void playMusic(String audioName) {
    path = sketchPath(audioName);
    file = new SoundFile(p, path);
    //file.play();
  }

  void display(int next) {

    if (play == false) {
      playMusic(audioName);
      play = true;
    }
    if (next == 1) {
      if (wordCram.hasMore()) {
        if (next == 1) {
          wordCram.drawNext();
          
          fill(0);
          rect(width-450, 30, 450, 40);
        }
      }
    } else {
      textSize(30);
      fill(255);
       textAlign(LEFT, TOP);
      text("Press Any Button to Continue", width-450, 30);
    }
    fill(255);
    noStroke();
    fill(0);
    textSize(30);
    //println(mouseX, mouseY); //x range 0 to 295; y range 0 to 705
  }

  void initWordCram(ShapeBasedPlacer BasedPlacer) {
    wordCram = new WordCram(p)
      .fromTextFile("data.txt") //change this and rerun percity
      .withPlacer(BasedPlacer)
      .withNudger(BasedPlacer)
      .sizedByWeight(10, 90)
      .withColors(color(#0080FF), color(#FFC0CB), color(#FDEE00));
  }
}
