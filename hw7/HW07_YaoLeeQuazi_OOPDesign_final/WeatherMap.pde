class WeatherMap {

  // Instance variables

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





  // Constructor

  WeatherMap() {
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
  }





  // Functions

  void display() {

    fill(255);
    noStroke();
    rect(0, 0, 1200, 1000);
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
       
        //PLANE//
        for (int i=0; i<aero.length; i++){
          aero[i].ascend();
          aero[i].display();
        }
        
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
  }



  void cloud(int extraObj) {
    // Cloud; 2/4/2018 Mooyoung Lee
    // Function: draw cloud animation; extra objects can be shown if follow conditions are met.  
    //extraObj 1 = thunder, 2 = sun

    float shiftRate = frameCount/PI/10;
    noStroke();
    // cloud #1
    pushMatrix();
    translate(0, 20*sin(shiftRate));
    //fill(63, 96, 139);
    fill(16, 53, 97);
    ellipse(145, 45, 100, 100);
    ellipse(195, 85, 100, 100);
    ellipse(255, 125, 100, 100);
    ellipse(100, 85, 100, 100);
    ellipse(190, 140, 120, 120);
    ellipse(105, 140, 100, 120);
    ellipse(50, 125, 100, 100);
    popMatrix();

    // cloud #2
    pushMatrix();
    translate(-30*sin(shiftRate+50), 20*sin(shiftRate+50));
    fill(160, 160, 160);
    ellipse(170, 80, 90, 90);
    ellipse(210, 105, 85, 85);
    ellipse(240, 140, 90, 90);
    ellipse(190, 145, 100, 100);
    ellipse(125, 140, 120, 120);
    ellipse(65, 140, 90, 90);
    ellipse(105, 110, 100, 100);
    popMatrix();

    if (extraObj == 1) {
      //thunder 1
      pushMatrix();
      scale(1.5);
      translate(30, 60*sin(shiftRate));
      fill(255, 128, 0);
      beginShape();
      vertex(95, 115);
      vertex(120, 115);
      vertex(107, 147);
      vertex(130, 147);
      vertex(105, 190);
      vertex(112, 155);
      vertex(89, 155);
      endShape(CLOSE);
      popMatrix();
      //thunder 2
      pushMatrix();
      scale(1.5);
      translate(-30, 70*sin(shiftRate+150));
      fill(255, 128, 0);
      beginShape();
      vertex(95, 115);
      vertex(120, 115);
      vertex(107, 147);
      vertex(130, 147);
      vertex(105, 190);
      vertex(112, 155);
      vertex(89, 155);
      endShape(CLOSE);
      popMatrix();
    } else if (extraObj == 2) {
      pushMatrix();
      //scale(2);
      translate(30, 60);
      sun();
      popMatrix();
    }

    //cloud #3
    pushMatrix();
    noStroke();
    translate(30, 20*sin(shiftRate+150)+5);
    fill(16, 53, 97);
    ellipse(90, 60, 80, 70);
    ellipse(135, 85, 80, 70);
    ellipse(60, 90, 80, 70);
    ellipse(35, 120, 80, 80);
    ellipse(75, 125, 70, 80);
    ellipse(125, 130, 100, 75);
    ellipse(175, 120, 50, 60);
    popMatrix();
  }



  void polygon(float x, float y, int sides, float radius, float strokeWt, color strokeCol) {
    // Draw polygon with given number of side and radius
    // 1/21/2018 Mooyoung Lee
    // Reference: Ira Greenberg; SMU 2DS MSDS6390 CH3

    float theta = 0;
    float x2, y2;
    //strokeWeight(strokeWt);
    //stroke(strokeCol);
    //noFill();
    fill(strokeCol);
    noStroke();

    beginShape();
    for (int i = 0; i<sides; i++) {
      x2 = x + cos(theta + TWO_PI/sides*i)*radius;
      y2 = y + sin(theta + TWO_PI/sides*i)*radius;
      vertex(x2, y2);
    }
    endShape(CLOSE);
  }



  void sun() {
    // Sun; 2/4/2018 Mooyoung Lee
    // Function: draw Sun animation

    float var1 = 25*sin(frameCount/PI/10);
    float var2 = 10*cos(frameCount/PI/10);

    //translate(var1, var2);

    float r = 50;   // radius of Sun
    float alpha = PI/6;
    float triHgt = r*cos(alpha/2); // r*cos(theta), height shift
    float triWidth = r*sin(alpha/2);
    float[][] points = {{-triWidth, triHgt, 0}, 
      {triWidth, triHgt, 0}, 
      {0, triHgt, 0}};

    pushMatrix();
    translate(var1, var2);
    // Flame of the Sun
    for (int k=0; k<12; k++) {

      // Flame height
      fill(255, 128, 0);
      if (k%2 == 1) {
        points[2][1] = var1+triHgt*2;
      } else {
        points[2][1] = var2+triHgt*2;
      }
      noStroke();
      pushMatrix();
      rotate(alpha*k);
      triangle(points[0][0], points[0][1], points[1][0], points[1][1], points[2][0], points[2][1]);  // draw triangle
      popMatrix();

      stroke(255, 165, 0);
      strokeWeight(3);
      fill(255, 255, 0);
      ellipse(0, 0, r*2, r*2);
    }
    popMatrix();
  }




  void windyTree(int x, int y, float theta) {
    // Windy Day; 2/4/2018 Mooyoung Lee
    // Function: draw a tree that is shaking by wind
    // Reference: Resursive Tree <https://processing.org/examples/tree.html>

    stroke(255);
    pushMatrix();
    translate(150+x, 150+y);  // translate to a desired location
    scale(.8);
    line(0, 0, 0, 120);

    strokeWeight(2);
    branch(80, theta);
    popMatrix();
  }

  void branch(float h, float theta) {
    // Each branch will be 2/3rds the size of the previous one
    h *= 0.66;


    // All recursive functions must have an exit condition!!!!
    // Here, ours is when the length of the branch is 2 pixels or less
    if (h > 2) {

      pushMatrix();    // Save the current state of transformation (i.e. where are we now)
      rotate(theta*1.2);   // Rotate by theta
      line(0, 0, 0, -h);  // Draw the branch
      translate(0, -h); // Move to the end of the branch
      branch(h, theta);       // Ok, now call myself to draw two new branches!!
      popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

      // Repeat the same thing, only branch off to the "left" this time!
      pushMatrix();
      rotate(-theta*.6);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h, theta);
      popMatrix();
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
}