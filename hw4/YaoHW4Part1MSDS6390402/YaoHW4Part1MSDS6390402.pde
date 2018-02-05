/*
// HW4 Part 1: importing data and narrative; 2018.02.04 Yao Yao Mooyoung Lee
// Reference: 
//          2DS Lecture, SMU Dr. Ira Greenberg
//          https://processing.org/
1990 to 2017: how much it rains in Seattle vs Temperature trend graph. Imports dataset from Kaggle dataset competition: abridged version
https://www.kaggle.com/rtatman/did-it-rain-in-seattle-19482017/data
used code from chart graph Ex11_01 in learn java book
*/

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
  size(1000, 600);
  smooth();
  cursor(CROSS);
  titleFont = loadFont("Times-Roman-40.vlw");
  axisFont = loadFont("Times-Roman-14.vlw");
  trend = new Table("bb.tsv");
}

void draw() {
  background(255);
  scatter("trend");
  frame(border, 255);
  mainTitle("Trend in Rainfall (in) and Temperature (°F) for Seattle");
  xAxis("Temperature (°F)", lb, bb, rb);
  yAxis("Rainfall (in)", lb, bb, tb);
}

void scatter(String tableObject) {
  pushMatrix();
  translate(tx, ty);
  scale(z);
  stroke(46,110,216);
  strokeWeight(3);
  int n = 4367;  // Got this manually from csv file
    
  for (int i = 0; i < n; i++) {
    // Avg runs per game in col. 2
    float x = map(trend.getFloat(i, 2), minX, maxX, -z*gw/2, z*gw/2);
    // Win % in col. 1
    float y = map(trend.getFloat(i, 1), minY, maxY, z*gh/2, -z*gh/2);
    point(x, y);
    
    // Hover over data point for team names & stats
    float mx = map(mouseX, lb, rb, -(gw/2)/z - (tx - width/2)/z, (gw/2)/z - (tx - width/2)/z);
    float my = map(mouseY, tb, bb, -(gh/2)/z - (ty - height/2)/z, (gh/2)/z - (ty - height/2)/z);
    if (dist(mx, my, x, y) < 5) {
        statString = trend.getString(i, 0) + ": Temperature (°F): " + 
                     nf(trend.getFloat(i, 2), 0, 2) + " / Rainfall (in): " + 
                     nf(trend.getFloat(i, 1), 0, 3);
    }
  }
  popMatrix();
}

void frame (float border, color frameColor) {
  noStroke();
  fill(frameColor);
  rect(0, 0, width, border);    // Top mask
  rect(0, bb, width, border);   // Bottom mask
  rect(0, 0, border, height);   // Left mask
  rect(rb, 0, border, height);  // Right mask
}

void mainTitle (String titleText) {
  textAlign(CENTER, CENTER);
  textFont(titleFont);
  fill(0);
  text(titleText, width/2, 25);
  textFont(axisFont);
  fill(0);
  text(statString, width/2, 60);
}

void xAxis (String axisTitle, float xl, float y, float xr) {
  stroke(0);
  strokeWeight(2);
  line(xl, y, xr, y);

  textFont(axisFont);
  fill(0);
  textAlign(CENTER, CENTER);
  text(axisTitle, width/2, bb + 20);

  String instructions = "Mouse over point for data, drag to pan / use up and down arrows to zoom, press spacebar to reset";
  fill(0);
  text(instructions, width/2, height - 25);
}

void yAxis (String axisTitle, float x, float yb, float yt) {
  stroke(0);
  strokeWeight(2);
  line(x, yb, x, yt);

  textFont(axisFont);
  fill(0);
  textAlign(RIGHT, CENTER);
  text(axisTitle, lb - 10, height/2);
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
}

void mouseDragged() {
  tx = tx + (mouseX - pmouseX);
  ty = ty + (mouseY - pmouseY);
}