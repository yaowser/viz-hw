import java.awt.Shape;
import java.awt.geom.Area;
import wordcram.*;
import wordcram.text.*;
import java.awt.geom.Rectangle2D;
WordCram wordCram;

int whichCity; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};
int mapYes = 1;

void setup()
{  
  textAlign(LEFT, TOP);
  size(1200, 700);
  PImage image = loadImage("space.gif");
  Shape imageShape = new ImageShaper().shape(image, #000000);
  ShapeBasedPlacer BasedPlacer = new ShapeBasedPlacer(imageShape);
  background(255);
  colorMode(HSB);
  initWordCram(BasedPlacer);
}


void draw() {
  if (wordCram.hasMore()) {
    wordCram.drawNext();
  }
  fill(255);
  noStroke();
  rect(0,0,265,700);
  rect(265,0,800,100);
  fill(0);
  textSize(30);
  for (int i = 0; i<City.length; i++){
    text(City[i]+", "+State[i],2,i*35);
  }
  println(mouseX, mouseY); //x range 0 to 295; y range 0 to 705
  
  if(mouseX >0 && mouseX<295 && mouseY>0 && mouseY<700){
    text("Selected "+City[int(mouseY/35.25)],300,2);
  }
}

void initWordCram(ShapeBasedPlacer BasedPlacer) {
  wordCram = new WordCram(this)
      .fromTextFile("Los Angeles.txt") //change this and rerun percity
      .withPlacer(BasedPlacer)
      .withNudger(BasedPlacer)
      .sizedByWeight(10, 90)
      .withColors(color(0, 250, 200), color(30), color(170, 230, 200));
}
