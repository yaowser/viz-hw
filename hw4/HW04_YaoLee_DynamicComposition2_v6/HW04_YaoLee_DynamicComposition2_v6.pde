// Weather Map with Airline Data; 2018.02.05 Mooyoung Lee, Yao Yao //<>//
// Reference: 
//          2DS Lecture, SMU Dr. Ira Greenberg
//          https://processing.org/
// http://natureofcode.com
// Via Reynolds: http://www.red3d.com/cwr/steer/FlowFollow.html
// Using this variable to decide whether to draw all the stuff
//correlation between temperature and rainfall
//correlation between weather and airplane delays


// Lee's Gobal Variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

int slide = 0;  // Change slide from airport map to wind animation map    ///  <--- Working on it !!!!!!!!!!!!!!!!!!! using some keys; SEE THE LAST FUNCTION ON THE BOTTOM

int weather = 5; // 0 = Sun, 1 = snow, 2 = rain, 3 = cloud, 4 = cloud+thunder, 5 = cloud+sun, 6 = windy

int particleCount = 20;
float particleCountCurrent = 0;
float birthRate = 0.1;
float[] x = new float[particleCount];
float[] y = new float[particleCount];
float[] x2 = new float[particleCount];
float[] y2 = new float[particleCount];
int[] sideCount = new int[particleCount];
float[] radius= new float[particleCount]; 
float[] speedX= new float[particleCount];
float[] speedY= new float[particleCount];
float[] gravity = new float[particleCount];
float[] termimalSpd = new float[particleCount];
boolean debug = false;
// Flowfield object
FlowField flowfield;
// An ArrayList of vehicles
ArrayList<Vehicle> vehicles;


// screen limit for rain/snow
int xmin = 0; 
int xmax = 300;
int ymin = 0;
int ymax = 300;

// tree
float thetaTree = PI/6;

// Map/Airport Location on the image
float airportLoc[][] = {{1311, 408}, 
  {400, 818}, 
  {732, 547}, 
  {1818, 414}, 
  {1049, 1064}, 
  {994, 903}, 
  {1488, 819}, 
  {1629, 728}, 
  {1843, 421}, 
  {40, 551}, 
  {1722, 1100}, // miami
  {1712, 537}, 
  {146, 751}, 
  {1114, 311}, 
  {1900, 307}, 
  {171, 75}, 
  {1477, 399}
}; 

String airport[] = {"Chicago (ORD)", "Phoenix (PHX)", "Denver (DEN)", "Newark (EWR)", "Houston (IAH)", "Dallas (DFW)", "Atlanta (ATL)", 
  "Charlotte, (CLT)", "Queens (JFK)", "San Francisco (SFO)", "Miami (MIA)", "Dulles (IAD)", "Los Angeles (LAX)", "Minnesota (MSP)", 
  "Boston (BOS)", "Seattle (SEA)", "Detroit (DWT)"};

int temp[] = new int[airport.length];
int climateNo[] = new int[airport.length];
int cancel[][] = new int[airport.length][3];  // {ontime, delay, cancel} percentage



//Removed: "Queens (LGA)",{1832, 406},
float distMouse[] = new float[airport.length];

//setup
PImage img, imgAirport, imgAirport2;
float aspectRatio;
int width2 = width;
PFont f;
int imgLength, imgHeight;

// draw
int imgX = 50; // location of map image
int imgY = 0;
int txtX = 50;  // location of Bar text
float mouseRadius = 50;  // max distance to show detailed info; between mouse and airport
int airX, airY;  // temp values for airport locations
float smallest;
int tempCity = temp[0];
String nameCity = airport[0];
float distMouse2 =0;
int weather0 = 0;    // previous weather number
float barY;          // bar chart location
float barScale = 8;  // total bar length

// Yao's Global Variables:  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PFont titleFont;  // Times-Roman-40.vlw
PFont axisFont;   // Times-Roman-14.vlw
Table trend;                 // trend = "Temp vs Rain"
int wide = 1000;           // Width of window
int high = 600;            // Height of window
float border = 75;         // Size of border
float lb = border;         // Left border
float rb = wide - border;  // Right border
float bb = high - border;  // Bottom border
float tb = border;         // Top borders
float gw = rb - lb;        // Grid width
float gh = bb - tb;        // Grid height
String statString = "Data from 1990 to 2017";
float minX = 0;
float maxX = 80;
float minY = 0.00;
float maxY = 5;
float z = 1;               // Zoom factor for scaling
float tx = wide/2;         // Used for panning on x
float ty = high/2;         // Used for panning on y



void setup() {

  // Lee's setup
  size(1600, 800);
  background(255);
  img = loadImage("usMap3.jpg");
  aspectRatio = img.width/img.height;
  imgLength = img.width;
  imgHeight = img.height;
  f = createFont("Arial", 8, true);

  imgAirport = loadImage("airport_icon.png");
  imgAirport.resize(50, 0);
  imgAirport2 = loadImage("airport_icon.png");
  imgAirport2.resize(75, 0);

  // Temperature, climateNumber array
  for (int i=0; i<airport.length; i++) {
    temp[i] = int(random(25, 70));
    climateNo[i] = i%7;
    // (ontime, delay, cacle) data generating
    if (climateNo[i] == 1) {
      cancel[i][2] = int(random(30, 50));
      cancel[i][1] = int(random(10, 50));
      cancel[i][0] = 100 - cancel[i][2]-cancel[i][1];
    } else if (climateNo[i] == 2) {
      cancel[i][2] = int(random(10, 50));
      cancel[i][1] = int(random(30, 50));
      cancel[i][0] = 100 - cancel[i][2]-cancel[i][1];
    } else if (climateNo[i] == 4) {
      cancel[i][2] = int(random(10, 40));
      cancel[i][1] = int(random(10, 50));
      cancel[i][0] = 100 - cancel[i][2]-cancel[i][1];
    } else if (climateNo[i] == 6) {
      cancel[i][2] = int(random(0, 30));
      cancel[i][1] = int(random(10, 40));
      cancel[i][0] = 100 - cancel[i][2]-cancel[i][1];
    } else {
      cancel[i][2] = int(random(0, 5));
      cancel[i][1] = int(random(0, 10));
      cancel[i][0] = 100 - cancel[i][2]-cancel[i][1];
    }
  }

  //frameRate(30);
  surface.setResizable(true);

  for (int i=0; i< particleCount; i++) {
    x[i] = random(0.65*width+125, 0.65*width+300-125);
    y[i] = ymin+75;

    sideCount[i] = 8;//int(random(3, 10));
    speedX[i] = random(-2, 2);
    speedY[i] = random(-3, 1);
    radius[i] = random(1, 5);
    gravity[i] = .03;
    termimalSpd[i] = radius[i]*1;

    x2[i] = random(0.65*width+100, 0.65*width+300-100);
    y2[i] = random(ymin+100, ymax-100);
  }

  // Yao's setup
  cursor(CROSS);
  titleFont = loadFont("Times-Roman-40.vlw");
  axisFont = loadFont("Times-Roman-14.vlw");
  trend = new Table("bb.tsv");
    // Make a new flow field with "resolution" of 16
  flowfield = new FlowField(16);
  vehicles = new ArrayList<Vehicle>();
  // Make a whole bunch of vehicles with random maxspeed and maxforce values
}


void draw() { 
  fill(255);
  noStroke();
  rect(0,0,1200,1000);
  // Lee's drawinng  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  // US map; auto rescale as window size changes
  width2 = int(0.6*width);
  img.resize(width2, 0);
  image(img, imgX, imgY);

  xmin = int(0.65*width);
  xmax = xmin + 300;



  // airpot location
  for (int j = 0; j < airportLoc.length; j++) {
    airX = int(airportLoc[j][0]*width2/imgLength+imgX/2);
    airY = int(airportLoc[j][1]*width2/imgLength+imgY/2);
    image(imgAirport, airX, airY);

    // distance between mouse cursor and airport
    //distMouse[j] = sqrt(sq(airX+imgX/2-mouseX)+sq(airY+imgY/2-mouseX));
    //println(distMouse[j]);
    //println(airX+imgX/2);

    // distance between mouse cursor and airport; trial 2
    distMouse2 = abs(airX+imgX/2-mouseX)+abs(airY+imgY/2-mouseY);
    if (distMouse2 < mouseRadius) {
      weather = climateNo[j];    // should be replaced with weather array. e.g. climateNumber[i]
      tempCity = temp[j];
      nameCity = airport[j];
      //println(distMouse2);

      image(imgAirport2, airX-imgX/4, airY-imgY/3-10);
      fill(255);
      noStroke();
      rect(0, 0, imgX, height);  // delete things on the left edge
      rect(txtX, barY, 900, 150); // delete previous text for cancel bar



      // Airline cancel bar
      noStroke();
      barY = int(0.8*height);  // need to change to reflect the new window size...later
      fill(0, 255, 0);
      rect(txtX, barY, cancel[j][0]*barScale, 50);
      fill(255, 128, 0);
      rect(txtX+cancel[j][0]*barScale, barY, cancel[j][1]*barScale, 50);
      fill(255, 0, 0);
      rect(txtX+(cancel[j][0]+cancel[j][1])*barScale, barY, cancel[j][2]*barScale, 50);

      pushMatrix();
      translate(300, -10);
      // text about calcel     
      fill(125);
      textFont(f, 25);
      text("Flight Information", -50, barY-10);// Title
      textFont(f, 40);
      fill(0, 255, 0);
      text("On=Time : " + cancel[j][0]+" %", txtX, barY+90);
      fill(255, 128, 0);
      text("Delay : " + cancel[j][1]+" %", txtX+250, barY+90);
      fill(255, 0, 0);
      text("Cancel : " + cancel[j][2]+" %", txtX+530, barY+90);
      popMatrix();
    }
    //noStroke();
    //fill(255);
    //rect(imgX, barY, 100, 50);
  }
  //smallest = min(distMouse);
  //if (smallest < mouseRadius) {
  //  for (int i = 0; i < distMouse.length; i++) {
  //    if (distMouse[i] == smallest) {
  //      weather = climateNo[i];    
  //      tempCity = temp[i];
  //      nameCity = airport[i];
  //    }
  //  }
  //}


  // Detail Information Window
  fill(0);
  rect(xmin, ymin, 0.98*width-xmin, ymax-ymin);
  textFont(f, 65);
  fill(255);
  text(tempCity +"°F", xmin+constrain(250*width/1600, 300, 500)+150, 100);
  textFont(f, 25);
  text(nameCity, xmin+constrain(250*width/1600, 250, 500)+200, 200);

  // Weather animation


  if (weather == 0) { // Sunny day
    pushMatrix();
    translate(xmin+150, ymin+150);
    //scale(0.5);
    sun();
    popMatrix();
  }
  if (weather == 1) { // Snow from clouds
    if (weather0 !=1) {
      for (int i=0; i< particleCount; i++) { 
        speedX[i] = random(-2, 2);
      }
    }
    for (int i=0; i< particleCountCurrent; i++) { 
      polygon(x[i], y[i], sideCount[i], radius[i], 2, color(255, 200)) ;
      x[i] += speedX[i] + random(-1, 1);  // w/ jitter effect
      speedY[i] += gravity[i];
      speedY[i] = constrain(speedY[i], 0, termimalSpd[i]);
      y[i] += speedY[i];
      checkCollisions(i);
      pushMatrix();
      translate(xmin+80, ymin+20);
      scale(0.5);
      cloud(0);
      popMatrix();
    }
  } else if (weather == 2) { // Rain from clouds
    if (weather0 !=2) {
      for (int i=0; i< particleCount; i++) { 
        speedX[i] = random(-2, 2);
      }
    }

    for (int i=0; i< particleCountCurrent; i++) { 
      stroke(255);
      strokeWeight(radius[i]/2);
      line(x[i], y[i], x[i]+speedX[i], y[i]+speedY[i]*2) ;
      x[i] += speedX[i];// + random(-1, 1);  // w/ jitter effect
      speedY[i] += gravity[i];
      speedY[i] = constrain(speedY[i]*5, 0, termimalSpd[i]*3);
      y[i] += speedY[i];
      checkCollisions(i);
      pushMatrix();
      translate(xmin+80, ymin+20);
      scale(0.5);
      cloud(0);
      popMatrix();
    }
  }
  if (weather == 3) { // Cloud
    pushMatrix();
    translate(xmin+80, ymin+80);
    scale(0.5);
    cloud(0);
    popMatrix();
  } else if (weather == 4) {  // Cloud w/ thunder
    pushMatrix();
    translate(xmin+80, ymin+80);
    scale(0.5);
    cloud(1);
    popMatrix();
  } else if (weather ==5) { // Cloud w/ Sun
    pushMatrix();
    translate(xmin+80, ymin+80);
    scale(0.5);
    cloud(2);
    popMatrix();
  }


  if (weather ==6) { // Windy day
    if (weather0 !=6) {
      for (int i=0; i< particleCount; i++) { 
        speedY[i] = random(-3, 1);
        ;
      }
    }
    // Shaking tree
    windyTree(xmin, ymin, thetaTree); 
    thetaTree += sin(frameCount/PI/10)/200;

    //flying objects
    for (int i=0; i< particleCountCurrent; i++) { 
      polygon(x2[i], y2[i], sideCount[i], radius[i], 2, color(255, 120)) ;
      speedX[i] += gravity[i];
      speedX[i] = constrain(speedX[i], 0, termimalSpd[i]);
      x2[i] += speedX[i];
      y2[i] += speedY[i]/3+ random(-1, 1);  // w/ jitter effect
      checkCollisions2(i);
    }
    if (particleCountCurrent < particleCount/20 - birthRate) {
      particleCountCurrent += birthRate;
    }
  }
  if (weather ==1) {
    if (particleCountCurrent < particleCount - birthRate) {
      particleCountCurrent += birthRate;
    }
  } else if ( weather == 2) {
    if (particleCountCurrent < particleCount - birthRate) {
      particleCountCurrent += birthRate;
    }
  }
  weather0 = weather;

  // Yao's drawing  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


  mainTitle("Trend in Rainfall (in) and Temperature (°F)");
  xAxis("Temperature (°F)", lb, bb, rb);
  yAxis("Rainfall (in)", lb, bb, tb);

  tx = 1250;  // Lee's edit
  ty = 600;

  stroke(0);

  pushMatrix();
  translate(tx, ty);
  scale(z);
  stroke(46, 110, 216);
  strokeWeight(3);
  int n = 4367;  // Got this manually from csv file

  for (int i = 0; i < n; i++) {
    // Avg runs per game in col. 2
    float x = map(trend.getFloat(i, 2), minX, maxX, -z*gw/2, z*gw/2);
    // Win % in col. 1
    float y = map(trend.getFloat(i, 1), minY, maxY, z*gh/2, -z*gh/2);
    point(x, y);

    // Hover over data point for team names & stats
    float mx = map(mouseX-400, lb, rb, -(gw/2)/z - (tx - width/2)/z, (gw/2)/z - (tx - width/2)/z);
    float my = map(mouseY-100, tb, bb, -(gh/2)/z - (ty - height/2)/z, (gh/2)/z - (ty - height/2)/z);
    if (dist(mx, my, x, y) < 5) {
      statString = trend.getString(i, 0) + ": Temperature (°F): " + 
        nf(trend.getFloat(i, 2), 0, 2) + " / Rainfall (in): " + 
        nf(trend.getFloat(i, 1), 0, 3);
    }
  }
  popMatrix();

  println(mouseX, mouseY);
  if (debug) flowfield.display();
  // Tell all the vehicles to follow the flow field
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
      }
}


// small functions:

void checkCollisions(int i) {
  if (x[i] > xmax) {
    x[i] = xmin;
  } else if (x[i] < xmin) {
    x[i] = xmax;
  }
  if (y[i] > ymax) {
    y[i] = ymin+75;
    x[i] = random(xmin+125, xmax-125);
  }
}
void checkCollisions2(int i) {
  if (x2[i] > xmax) {
    x2[i] = xmin+100+random(0, 50);
    y2[i] = ymin+100+random(-30, 0);
  } 
  if (y[i] > ymax) {
    y2[i] = ymin;
  } else if (y[i] < ymin) {
    y2[i] = ymax;
  }
}

void mainTitle (String titleText) {
  fill(255);
  noStroke();
  rect(1020, 300, 800, 800);
  textAlign(CENTER, CENTER);
  textFont(titleFont);
  fill(0);
  textSize(32); 
  text(titleText, 1300, 350);
  textFont(axisFont);
  fill(0);
  textSize(24); 
  text(statString, 1300, 420);
}

void xAxis (String axisTitle, float xl, float y, float xr) {
  stroke(0);
  strokeWeight(2);
  line(1015, 825, 1600, 825);

  textFont(axisFont);
  fill(0);
  textAlign(CENTER, CENTER);
  text(axisTitle, 1330, 850);
  String instructions = "Mouse over for data points / use up and down arrows to zoom\nDrag mouse to generate new rainfall / spacebar to toggle flow line";
  fill(0);
  text(instructions, width/2, height - 25);
}

void yAxis (String axisTitle, float x, float yb, float yt) {
  stroke(0);
  strokeWeight(2);
  line(1015, 400, 1015, 825);

  textFont(axisFont);
  fill(0);
  textAlign(RIGHT, CENTER);
  text(axisTitle, 1000, 660);
}

void keyPressed() {
  if ((key == CODED) && (keyCode == UP))    // Zoom in
    z += .1;
  if ((key == CODED) && (keyCode == DOWN))  // Zoom out
    z -= .1;
  if (key == ' ') {                         // Press spacebar to...
    z = 1;                                  // reset zoom
    tx = wide/2;                            // reset translation on x
    ty = high/2;                            // reset translation on y
    statString = "Data from 1990 to 2017";    // reset text
  }
  if (key == ' ') {
    debug = !debug;
  }
}

void mouseDragged() {
  tx = tx + (mouseX - pmouseX);
  ty = ty + (mouseY - pmouseY);
  vehicles.add(new Vehicle(new PVector(mouseX, mouseY), 3, 0.3));
}