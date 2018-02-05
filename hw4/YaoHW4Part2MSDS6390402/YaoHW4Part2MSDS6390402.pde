// HW4 Part 1: importing data and narrative; 2018.02.04 Yao Yao Mooyoung Lee
// Reference: 
//          2DS Lecture, SMU Dr. Ira Greenberg
//          https://processing.org/
// http://natureofcode.com
// Via Reynolds: http://www.red3d.com/cwr/steer/FlowFollow.html
// Using this variable to decide whether to draw all the stuff
boolean debug = false;

PImage img;

// Flowfield object
FlowField flowfield;
// An ArrayList of vehicles
ArrayList<Vehicle> vehicles;

void setup() {
  size(803, 400);
  img = loadImage("usMap2.jpg");
  // Make a new flow field with "resolution" of 16
  flowfield = new FlowField(16);
  vehicles = new ArrayList<Vehicle>();
  // Make a whole bunch of vehicles with random maxspeed and maxforce values
}

void draw() {
  background(255);
  image(img, 0, 0);
  // Display the flowfield in "debug" mode
  if (debug) flowfield.display();
  // Tell all the vehicles to follow the flow field
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }

  // Instructions
  fill(0);
  text("Spacebar to toggle flow lines.\nPress mouse to generate new rainfall.", 10, height-20);
}


void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

void mouseDragged() {
  vehicles.add(new Vehicle(new PVector(mouseX, mouseY), 3, 0.3));
}