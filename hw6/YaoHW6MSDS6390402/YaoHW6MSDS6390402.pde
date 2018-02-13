// create a twitter streaming feed object instance
// set up hashtags we are interested in, global variables
String keywords[] = {"winter", "olympics"};
int count1, count2, which1, which2;

//use PImage[] img1, img2; ...check HW5 @mooyoung<<<<<<<<<<<<<<<<<<<--------------
PImage img1, img2;

///@mooyoung use processing.sound to add the olympics song in the background
float x1 = 0, x2 = 500;
float y1 = 0, y2 = 0;
String out1 = "", out2 = "";

PFont f;

import wordcram.*;
import wordcram.text.*;

WordCram wordCram;

// connect and open a streaming object
ConfigurationBuilder connection = connect();
TwitterStream twitter = new TwitterStreamFactory(connection.build()).getInstance();

void setup()
{  
  // add listener and array of filters to track key hashtags
  twitter.addListener(listener);
  twitter.filter(new FilterQuery().track(keywords));
  prepareOnExitHandler();
  size(1600, 900);
  background(255);
  f = createFont("Arial", 14, true);
  colorMode(HSB);
  initWordCram();
}

void draw()
{
  if (wordCram.hasMore()) {
    wordCram.drawNext();
  }
  fill(255); // refresh screen only for twitter
  noStroke();
  rect(0,0,1600,222);
  if (img1 != null) 
  {
    img1.resize(50, 50);
    image(img1, x1, y1);
  }
  if (img2 != null)
  {
    img2.resize(50, 50);
    image(img2, width/2, y2);
  }
  fill(0); // you can mess with the colors so it's different for both key words and counts
  textSize(30);
  text(out1, which1, 0, 750, 222);
  text(out2, which2, 0, 750, 222);
  textSize(25);
  text(count1 + "", 0, 80);
  text(count2 + "", 800, 80);
  
  
  ///mooyoung's code to draw ("winter" from img1s) and (the olympics symbol from img2s)

  
  //start at height = 667 to 900
  
    ///....note you can resize back the img1 and img2 original size
   ///check hw5...you may want to set an array of images so that the images are saved
   
   ///PImage[] imgs; <- this makes it so that it goes and loop through the images save each one
  //for (int i = 0; i < count2 - 1; i++) {
  //  img1[count1];   ...etc
  //}
  //for (int i = 0; i < count2 - 1; i++) {
  //  img2[count2];   ...etc
  //}
  
}

//http://wordcram.org/javadoc/ the colors are random
void initWordCram() {
  wordCram = new WordCram(this)
      .fromTextFile("winterolympics.txt")
      .sizedByWeight(10, 90)
      .withColors(color(0, 250, 200), color(30), color(170, 230, 200));
}

void mousePressed() {
  println(mouseX,mouseY);
}