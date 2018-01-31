int paddleX;
int paddleY;
int paddleHeight = 6*5;
int paddleWidth = 8*5;
float[] ship = {
  0,0,
  2,0,
  2,1,
  1,1,
  1,2,
  2,2,
  2,1,
  3,1,
  3,0,
  5,0,
  5,1,
  6,1,
  6,2,
  7,2,
  7,1,
  6,1,
  6,0,
  8,0,
  8,6,
  6,6,
  6,5,
  7,5,
  7,4,
  6,4,
  6,5,
  5,5,
  2,5,
  2,4,
  1,4,
  1,5,
  2,5,
  2,6,
  0,6
};

float ballX;
float ballY;
float ballSpeedX = random(3, 5);
float ballSpeedY = random(-2, 2);

ArrayList<ParticleSystem> systems;

void setup() {
  size(600, 600);
  systems = new ArrayList<ParticleSystem>();
  noCursor();
}

void mousePressed() {
  systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
}


void draw() {
  background(250);
  // Update paddle
  paddleY = mouseY - paddleHeight/2;
  paddleY = constrain(paddleY, 0, height-paddleHeight);
  paddleX = mouseX - paddleWidth/2;
  paddleX = constrain(paddleX, 0, width-paddleWidth);   

  // Draw paddle
  fill(102);
  noStroke();
  beginShape();
  for (int i = 0; i<ship.length; i +=2){
    vertex(ship[i]*5+paddleX, ship[i+1]*5+paddleY);
  }
  endShape(CLOSE);
  
  fill(255);
  noStroke();
  beginShape();
  for (int i = 0; i<ship.length; i +=2){
    vertex(ship[i]*5+ballX, ship[i+1]*5+ballY);
  }
  endShape(CLOSE);
  //ellipse(ballX, ballY, ballDiameter, ballDiameter);

  // Update ball location
  for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
  }
  if (systems.isEmpty()) {
    fill(10);
    textAlign(CENTER);
    text("Click Mouse", width/2, height/2);
  }
  
}