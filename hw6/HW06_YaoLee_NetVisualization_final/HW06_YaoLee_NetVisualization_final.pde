// create a twitter streaming feed object instance
// tweeter icon filled letter
// snow speed change by the amplitude of background music

// Reference: 
// Coding Challenge #50.1: Animated Circle Packing - Part 1 <https://www.youtube.com/watch?v=QHEQuoIKgNE>
// Ira Greenberg 2DS lecture/ particle
// http://wordcram.org/javadoc/ the colors are random


// set up hashtags we are interested in, global variables
String keywords[] = {"winter", "olympics"};
int count1, count2, which1, which2;

PImage img1, img2, img1x, img2x;

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


// Mooyoung's global variables ***************************************************
ArrayList<PVector> spots, spots2;  // spots to show icons
ArrayList<PImage> imgs, imgs2;  // list of icons
PImage imgWinter, imgOlympic;  // text images
int spd = 1; // icon image print speed

import processing.sound.*;     // Background Olympic music
SoundFile sample;              // Declare the processing sound variables 
Amplitude rms;                 // sound rms input to change snow color
float scale = 200;               // Declare a scaling factor
float smoothFactor = 0.25;     // Declare a smooth factor
float sum;                     // Used for smoothing

int particleCount = 150;
float particleCountCurrent = 0;
float birthRate = 0.1;
float[] p = new float[particleCount];
float[] q = new float[particleCount];
float[] p2 = new float[particleCount];
float[] q2 = new float[particleCount];
int[] sideCount = new int[particleCount];
float[] radius= new float[particleCount]; 
float[] speedX= new float[particleCount];
float[] speedY= new float[particleCount];
float[] gravity = new float[particleCount];
float[] termimalSpd = new float[particleCount];
// screen limit for snow
int xmin = 0; 
int xmax = 1600;
int ymin = 0;
int ymax = 300;


void setup()
{  
  // add listener and array of filters to track key hashtags
  twitter.addListener(listener);
  twitter.filter(new FilterQuery().track(keywords));
  prepareOnExitHandler();
  size(1600, 1200);
  background(255);
  f = createFont("Arial", 14, true);
  colorMode(HSB);
  initWordCram();

  // Mooyoung's setup
  // Find pixels that has text
  spots = new ArrayList<PVector>();
  spots2 = new ArrayList<PVector>();
  imgWinter = loadImage("winter.png");
  imgWinter.loadPixels();
  for (int x = 0; x< imgWinter.width; x++) {
    for (int y = 0; y< imgWinter.height; y++) {
      int index = x + y * imgWinter.width;
      color c = imgWinter.pixels[index];
      float b = brightness(c);
      if (b < 254) {
        spots.add(new PVector(x, y));
      }
    }
  }
  imgOlympic = loadImage("olympic.png");
  imgOlympic.loadPixels();
  for (int x = 0; x< imgOlympic.width; x++) {
    for (int y = 0; y< imgOlympic.height; y++) {
      int index = x + y * imgOlympic.width;
      color c = imgOlympic.pixels[index];
      float b = brightness(c);
      if (b < 254) {
        spots2.add(new PVector(x, y));
      }
    }
  }
  imgs = new ArrayList<PImage>();
  imgs2 = new ArrayList<PImage>();

  sample = new SoundFile(this, "2018OlympicOpening.mp3");
  sample.loop();

  // Create and patch the rms tracker
  rms = new Amplitude(this);
  rms.input(sample);

  //snow
  for (int i=0; i< particleCount; i++) {
    p[i] = random(xmin, xmax);
    q[i] = ymin;

    sideCount[i] = 8;//int(random(3, 10));
    speedX[i] = random(-2, 2);
    speedY[i] = random(-3, 1);
    radius[i] = random(1, 10);
    gravity[i] = .01;
    termimalSpd[i] = radius[i]*.2;

    p2[i] = random(xmin, xmax);
    q2[i] = ymin;//random(ymin+100, ymax-100);
  }
}

void draw()
{
  if (wordCram.hasMore()) {
    wordCram.drawNext();
  }
  fill(255); // refresh screen only for twitter
  noStroke();
  rect(0, 0, 1600, ymax+10);
  if (img1x != null) 
  {
    image(img1x, x1, y1);
  }
  if (img2x != null)
  {
    image(img2x, width/2, y2);
  }
  fill(0); // you can mess with the colors so it's different for both key words and counts
  textSize(30);
  text(out1, which1, 0, 750, 222);
  text(out2, which2, 0, 750, 222);
  textSize(25);
  text(count1 + "", 0, 80);
  text(count2 + "", 800, 80);

  // Winter letter
  if (frameCount%spd ==0) {
    int r = int(random(0, spots.size()));
    PVector spot = spots.get(r);
    float x = spot.x;
    float y = spot.y;
    if (img1 != null) 
    {
      pushMatrix();
      translate(-10, height-400);
      image(img1, x, y);
      popMatrix();
    }

    // Olympic circles
    int r2 = int(random(0, spots2.size()));
    PVector spot2 = spots2.get(r2);
    float x2 = spot2.x;
    float y2 = spot2.y;
    if (img2 != null) 
    {
      pushMatrix();
      translate(785, height-410);
      image(img2, x2, y2);
      popMatrix();
    }

    // music
    sum += (rms.analyze() - sum) * smoothFactor;  
    float rmsScaled = (sum * scale-3)*2;
    //println(rmsScaled);

    // snow
    for (int i=0; i< particleCountCurrent; i++) { 
      fill(#FF00FF, 100);
      noStroke();
      ellipse(p[i], q[i], radius[i], radius[i]);
      p[i] += speedX[i] + rmsScaled;  //  snow speedX follow the music RMS
      speedY[i] += gravity[i];
      speedY[i] = constrain(speedY[i], 0, termimalSpd[i]);
      q[i] += speedY[i];
      checkCollisions(i);
    }
    if (particleCountCurrent < particleCount - birthRate) {
      particleCountCurrent += birthRate;
    }
  }
}

//http://wordcram.org/javadoc/ the colors are random
void initWordCram() {
  wordCram = new WordCram(this)
    .fromTextFile("winterolympics.txt")
    .sizedByWeight(10, 80)
    .withColors(color(0, 250, 200), color(30), color(170, 230, 200));
}

void checkCollisions(int i) {
  if (p[i] > xmax) {
    p[i] = xmin;
  } else if (p[i] < xmin) {
    p[i] = xmax;
  }
  if (q[i] > ymax) {
    q[i] = ymin;
    p[i] = random(xmin+125, xmax-125);
  }
}