// Weather Map with Airline Data; 2018.02.05 Mooyoung Lee, Yao Yao //<>//
// Reference: 
//          2DS Lecture, SMU Dr. Ira Greenberg
//          https://processing.org/
// http://natureofcode.com
// Via Reynolds: http://www.red3d.com/cwr/steer/FlowFollow.html
// Using this variable to decide whether to draw all the stuff
//correlation between temperature and rainfall
//correlation between weather and airplane delays


WeatherMap weatherMap;

// Yao's Global Variables:  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PImage imgf;
boolean debug = false;
// Flowfield object
FlowField flowfield;
// An ArrayList of vehicles
ArrayList<Vehicle> vehicles;

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

  weatherMap = new WeatherMap();

  // Yao's setup
  imgf = loadImage("usMap3.jpg");
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
  weatherMap.display();

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