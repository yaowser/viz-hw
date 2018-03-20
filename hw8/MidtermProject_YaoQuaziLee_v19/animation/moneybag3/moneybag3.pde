void setup(){
  background(255);
  size(1600,500);
  
  moneybag=loadImage("moneybag.jpg");
  moneybag.resize(400,400);
  ps = new ParticleSystem(new PVector(500, 700));
  ps2 = new ParticleSystem(new PVector(500, 700));
  ps3 = new ParticleSystem(new PVector(500, 700));
  ps4 = new ParticleSystem(new PVector(500, 700));
  ps5 = new ParticleSystem(new PVector(500, 700));

}