/**
 Active blending plus particle system made from image "particles"
 Move the mouse to reveal the image through the dynamic mask.
 Click to reset 
 */
PShader edges;  
PShader maskShader;
PImage srcImage;
PGraphics maskImage;
PImage src;
PImage dest;
int a, b, c = 255;
boolean enabled = true;

ParticleSystem ps;

PImage[] imgs;

// Mooyoung's Global variables  ****************************************************
//Reference: https://processing.org/tutorials/sound/
import processing.sound.*;

// Declare the processing sound variables 
SoundFile sample;
Amplitude rms;

// Declare a scaling factor
float scale = 1;

// Declare a smooth factor
float smoothFactor = 0.25;

// Used for smoothing
float sum;

void setup() {
  size(1000, 750, P2D);
  srcImage = loadImage("2017-12-28 16.32.08.jpg");
  maskImage = createGraphics(srcImage.width, srcImage.height, P2D);
  maskImage.noSmooth();
  maskShader = loadShader("mask.glsl");
  maskShader.set("mask", maskImage);
  src = loadImage("2017-12-28 16.33.40.jpg");
  dest = loadImage("2017-12-28 16.32.28.jpg");
  textureWrap(REPEAT);
  edges = loadShader("edges.glsl");

  imgs = new PImage[6];
  imgs[0] = loadImage("img1.jpg");
  imgs[1] = loadImage("img2.jpg");
  imgs[2] = loadImage("img3.jpg");
  imgs[3] = loadImage("img4.jpg");
  imgs[4] = loadImage("img5.jpg");
  imgs[5] = loadImage("img6.jpg");
  ps = new ParticleSystem(imgs, new PVector(width/2, 50));

  // Mooyoung's Setup ****************************************************
  //Load and play a soundfile and loop it
  sample = new SoundFile(this, "TheJRSoundDesign_-_Emotional_Inspirational_Piano.mp3");
  sample.loop();

  // Create and patch the rms tracker
  rms = new Amplitude(this);
  rms.input(sample);
}

void draw() { 
  imageMode(CORNER);
  blend(src, 0, 0, src.width, src.height, 0, 0, dest.width, dest.height, NORMAL);
  pushMatrix();
  maskImage.beginDraw();
  maskImage.background(0);
  if (mouseX != 0 && mouseY != 0) {  
    maskImage.noStroke();
    maskImage.fill(255, 0, 0, 200);
    maskImage.ellipse(mouseX, mouseY, 500, 500);
  }
  maskImage.endDraw();
  shader(maskShader);    
  if (enabled == true) {
    shader(edges);
  }
  popMatrix();
  image(srcImage, 0, 0, width, height);

  blendMode(DIFFERENCE);
  pushMatrix();
  PVector up = new PVector(0, -0.2);
  ps.applyForce(up);

  ps.run();
  for (int i = 0; i < 6; i++) {
    ps.addParticle(mouseX, mouseY);
  }
  popMatrix();

  // Mooyoung's Draw ****************************************************
  // Smooth the rms data by smoothing factor
  sum += (rms.analyze() - sum) * smoothFactor;  
  float rmsScaled = sum * scale;
  println(rmsScaled);
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    color c = pixels[i];
    float total = red(c)+green(c)+blue(c);
    //println(total);
    if (total > 650 && rmsScaled>.30) { // darkest colored pixels
      pixels[i] = color(153, 0, 0);
    }else     if (total > 650 && rmsScaled>.25) { // darkest colored pixels
      pixels[i] = color(255, 128, 0);
    }else     if (total > 650 && rmsScaled>.20) { // darkest colored pixels
      pixels[i] = color(255, 255, 51);
    }else     if (total > 650 && rmsScaled>.15) { // darkest colored pixels
      pixels[i] = color(153, 255, 51);
    }else     if (total > 650 && rmsScaled>.10) { // darkest colored pixels
      pixels[i] = color(0, 255, 0);
    }
  }
  updatePixels();
}

void mousePressed() {
  enabled = !enabled;
  if (!enabled == true) {
    resetShader();
    blendMode(SCREEN );
  }
}