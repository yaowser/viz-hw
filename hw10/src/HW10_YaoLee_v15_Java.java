import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import ddf.minim.signals.*; 
import ddf.minim.spi.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class HW10_YaoLee_v15_Java extends PApplet {

//Assignment 10: Final 3D Java Visualization
//Using Processing as an embedded library in Java, create a 3D visualization of a data source of your choosing.
//Music Playlist Player
// Reference: minim usage (Stephen McGirr  C14730095  7/12/2015)

// Mouse left:          Move to new position
// Mouse right:         Toggle loop 
// Keyboard Inputs
// Up/Down arrows:      Sphere band rotate about x-axis
// Left/Right arrows:   Block band rotate about y-axis
// Left Alt:            Change views
// Spacebar:            Toggle pause
// Shift:               Previous Song
// Ctrl:                Next Song

// Global variables
//import processing.core.*;

// music
int w;
int c;
float amplitude;
Minim minim;
FFT fft;
AudioPlayer song;
AudioMetaData meta;
String[] cool = {"Hans Zimmer - Leaving Wallbrook - On the Road.mp3","Beethoven - 7th Symphony - 2nd movement.mp3","Isaac Hayes - Hung Up On My Baby.mp3","The Three Tenors - La Traviata.mp3","Keith Mansfield - Love de Luxe.mp3","Visioneers - Ike's Mood I.mp3","Andrea Bocelli - Con Te Partiro.mp3"};

// Sphere/Block bands;
ArrayList<SphereBands> sbs = new ArrayList(1);
BlockBands bbs;
int binSize;

ShootingStar star;

// Keyboard Interaction
float p = 0, q = 0, s = 1;   // size and location parameters 
int count = 0, pause = -1;
Boolean loop = false;
public void keyPressed() { 
  if (key == ' ') { //manual play/pause control
    pause *= -1;
    if(song.isPlaying()) {
      song.pause();
    }
    else if(song.position() == song.length()) {
      song.rewind();
      song.play();
    }
    else {
      song.play();
    }
  }
  if (key == CODED) {
    if (keyCode == UP) { 
      p -= PI/8 ; // rotate about x-axis
    } else if (keyCode == DOWN) {
      p += PI/8;  // rotate about x-axis
    } else if (keyCode == RIGHT) { //position
      q -= PI/8;  // rotate about y-axis
    } else if (keyCode == LEFT) {
      q += PI/8;  // rotate about y-axis
    } else if (keyCode == ALT) {
      s *= -1;  // change view
    } else if (keyCode == SHIFT) {
      song.pause();
      count--; // previous song
      if (count < 0) {
        count = cool.length - 1;
      }
      playThis(cool[count], this);
    } else if (keyCode == CONTROL) {
      song.pause();
      count++; // next song
      if (count > cool.length - 1) {
        count = 0;
      }
      playThis(cool[count], this);
    }
  }
}

public void playThis(String cool, PApplet p) {
  //Initialize mimim object
  minim = new Minim(this);
  // specify 2048 for the length of the sample buffers
  song = minim.loadFile(cool, 2048);
  meta = song.getMetaData();
  song.play();

  /*Initialization FFT object
   get length of audio buffers ,   get the sample rate of audio*/
  fft = new FFT(song.bufferSize(), song.sampleRate());

  //Use log average to space the frequencies 
  /* logAverages() will group frequency bands by octave and 
   allows you to specify the size of the smallest octave to use (in Hz) and 
   also how many bands to split each octave into. */
  fft.logAverages(60, 4);

  // SphereBands object number matches w/ fft.avgSize
  for ( int i = 0; i<fft.avgSize(); i++) {
    sbs.add(new SphereBands(p));
  }
  bbs = new BlockBands(fft.avgSize(), this);
  
  star = new ShootingStar(this);
}

public void setup() {
  
  surface.setResizable(true);

  // music
  playThis(cool[count], this);
 
  frameRate(60);
}

public void draw() {
  background(0);
  textAlign(CENTER, CENTER);
  
  // Lights
  directionalLight(255, 255, 255, 1, 1, -1);
  //directionalLight(0, 0, amplitude*1000, -1, 0, 0);  // light change w/ amplitude
  //directionalLight(255-amplitude*1000, 0, 0, 1, 0, 0);  // light change w/ amplitude
  //lights();
  directionalLight(amplitude*1000, amplitude*1000, amplitude*1000, -1, 0, 0); 
  
  // Music
  if(!song.isPlaying() && pause == -1) { //autoplay to next song if not paused
    if (loop == false) { // otherwise loop
      count++;
      if (count > cool.length - 1) {
        count = 0;
      }
    }
    playThis(cool[count], this);
  } 
  
  // Background shooting stars
  star.display(this);
  
  // Frequency Visualization
  fft.forward(song.mix);

  binSize = fft.avgSize();
  
  //iterate through the entire array of bands
  for (int i = 0; i<binSize; i++) { 
    c=i;
    amplitude =fft.getAvg(i);
    
    // 3D visualization
    if (s == 1) {
      //void display(float z, float gravity, float xRotate) {
      sbs.get(i).display(this, i*height/100+100, amplitude/5,  p);
    } else {
      //display(float amplitude, float yRotate, int binSize, int i)
      bbs.display(this, amplitude*10, q, binSize, i);
    }
  }
  
  // Music status bar
  playBar();
}

public void mousePressed() {
  if (mouseButton == LEFT) {
    // choose a position to cue to based on where the user clicked.
    // the length() method returns the length of recording in milliseconds.
    int position = PApplet.parseInt(map(mouseX, 0, width, 0, song.length()));
    song.cue(position);
    
    //star.update(); // check updated screen size
  } else if (mouseButton == RIGHT) {
    if (loop == true){
      loop = false;
    } else {
      loop = true;
    }
  }
}

public void playBar() {
  float posx = map(song.position(), 0, song.length(), 0, width);
  noStroke();
  fill(0xffFF9F00);
  rect(0,height-25,posx,25);
  fill(0xff0093AF);
  rect(posx,height-25,width,25);
  strokeWeight(4); //playhead
  stroke(0,0,255);
  line(posx, height-25, posx, height);
  fill(0);
  textSize(20);
  text(cool[count], width/2, height-15);
  text(song.position(), width-45, height-15);
  text("Loop: "+loop, 55, height-15);
}
  public void settings() {  size(1200, 820, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "HW10_YaoLee_v15_Java" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
