void draw(){
  background(255);
  buttons();
  
  translate(600, -400);
  image(moneybag, 200, 400);
  fill(0);
  ellipse(500, 700, 50, 100);
  
if(mouseX >55 && mouseX<205 && mouseY>240 && mouseY<290)
  {
  ps.addParticle();
  ps.run();
  }
else if(mouseX >55 && mouseX<205 && mouseY>300 && mouseY<350)
  {
  ps2.addParticle();
  ps2.run();
  }
   else if(mouseX >250 && mouseX<400 && mouseY>0 && mouseY<50)
  {
  ps3.addParticle();
  ps3.run();

  }
  else if(mouseX >250 && mouseX<400 && mouseY>60 && mouseY<110)
  {
  ps4.addParticle();
  ps4.run();
  }
  else if(mouseX >250 && mouseX<400 && mouseY>120 && mouseY<170)
  {
  ps5.addParticle();
  ps5.run();
 
  }

}
  