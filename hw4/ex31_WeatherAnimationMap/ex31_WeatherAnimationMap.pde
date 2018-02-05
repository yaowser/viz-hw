// Weather Map with Airline Data; 2018.02.04 Mooyoung Lee
// Reference: 
//          2DS Lecture, SMU Dr. Ira Greenberg
//          https://processing.org/

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
  {1722, 1187}, 
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

//Removed: "Queens (LGA)",{1832, 406},
float distMouse[] = new float[airport.length];

//setup
PImage img, imgAirport;
float aspectRatio;
int width2 = width;
PFont f;
int imgLength;

void setup() {
  size(1600, 800);
  background(255);
  img = loadImage("usMap.jpg");
  aspectRatio = img.width/img.height;
  imgLength = img.width;
  f = createFont("Arial", 8, true);

  imgAirport = loadImage("airport_icon.png");
  imgAirport.resize(50, 0);

  // Temperature, climateNumber array
  for (int i=0; i<airport.length; i++) {
    temp[i] = int(random(25, 70));
    climateNo[i] = i%6;
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
}

int imgX = 50; // location of map image
int imgY = 50;
float mouseRadius = 40;  // max distance to show detailed info; between mouse and airport
int airX, airY;  // temp values for airport locations
float smallest;
int tempCity = temp[0];
String nameCity = airport[0];

void draw() { 

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
    distMouse[j] = sqrt(sq(airX+imgX/2-mouseX)+sq(airY+imgY/2-mouseX));
    println(distMouse[j]);
  }
  smallest = min(distMouse);
  if (smallest < mouseRadius) {
    for (int i = 0; i < distMouse.length; i++) {
      if (distMouse[i] == smallest) {
        weather = climateNo[i];    // should be replaced with weather array. e.g. climateNumber[i]
        tempCity = temp[i];
        nameCity = airport[i];
      }
    }
  }

  //// debug mouse cursor vs. image location...
  //ellipse(airX+imgX/2, airY+imgY/2, 50, 50);
  //ellipse(mouseX, mouseY, 30, 30);



  // Detail Information Window
  fill(0);
  rect(xmin, ymin, 0.98*width-xmin, ymax-ymin);
  textFont(f, 80);
  fill(255);
  //text(tempCity + char(176) +"F", xmin+constrain(250*width/1600, 250, 500), 100);
    text(tempCity +"F", xmin+constrain(250*width/1600, 300, 500), 100);
  //text("Cloudy", xmin+constrain(250*width/1600, 250, 500), 200);
  textFont(f, 40);
  text(nameCity, xmin+constrain(250*width/1600, 250, 500), 200);
  //text("75",100,100);


  // Weather animation
  if (weather == 0) {
    pushMatrix();
    translate(xmin+150, ymin+150);
    //scale(0.5);
    sun();
    popMatrix();
  }
  if (weather == 1) { // Snow from clouds
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
  if (weather == 3) {
    pushMatrix();
    translate(xmin+80, ymin+80);
    scale(0.5);
    cloud(0);
    popMatrix();
  } else if (weather == 4) {
    pushMatrix();
    translate(xmin+80, ymin+80);
    scale(0.5);
    cloud(1);
    popMatrix();
  } else if (weather ==5) {
    pushMatrix();
    translate(xmin+80, ymin+80);
    scale(0.5);
    cloud(2);
    popMatrix();
  } else if (weather ==6) {
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
}
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