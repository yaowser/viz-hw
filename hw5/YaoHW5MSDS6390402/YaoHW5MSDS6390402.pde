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
int a,b,c = 255;
boolean enabled = true;

ParticleSystem ps;

PImage[] imgs;

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
  PVector up = new PVector(0,-0.2);
  ps.applyForce(up);
  
  ps.run();
  for (int i = 0; i < 6; i++) {
    ps.addParticle(mouseX,mouseY);
  }
  popMatrix();
}
 
void mousePressed() {
  enabled = !enabled;
  if (!enabled == true) {
    resetShader();
    blendMode(SCREEN );
  }
}