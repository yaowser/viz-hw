import wordcram.*;
import wordcram.text.*;
WordCram wordCram;
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington DC","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
int whichCity=19;
void setup()
{  
  size(730,553);
  background(255);
  colorMode(HSB);
  initWordCram();
}
void draw() {
  if (wordCram.hasMore()) {
    wordCram.drawNext();
  }
  fill(255);
}
void initWordCram() {
  wordCram = new WordCram(this)
      .fromTextFile(City[whichCity]+".txt") //change this and rerun percity
      .sizedByWeight(10, 90)
      .withColors(color(0, 250, 200), color(30), color(170, 230, 200));
}
void mousePressed(){
  saveFrame(City[whichCity]+".png");
  println(City[whichCity]);
}
