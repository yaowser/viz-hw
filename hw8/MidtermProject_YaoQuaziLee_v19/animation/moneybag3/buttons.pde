void buttons()

{

  noStroke();
//Buttons

fill(41,163,203);
rect(55,240, 150, 50, 20);
rect(55,300, 150, 50, 20);

rect(250,0, 150, 50, 20);
rect(250,60, 150, 50, 20);
rect(250,120, 150, 50, 20);
rect(250,180, 150, 50, 20);
rect(250,240, 150, 50, 20);
rect(250,300, 150, 50, 20);

rect(410,0, 150, 50, 20);
rect(410,60, 150, 50, 20);
rect(410,120, 150, 50, 20);
rect(410,180, 150, 50, 20);
rect(410,240, 150, 50, 20);
rect(410,300, 150, 50, 20);

rect(570,0, 150, 50, 20);
rect(570,60, 150, 50, 20);
rect(570,120, 150, 50, 20);
rect(570,180, 150, 50, 20);
rect(570,240, 150, 50, 20);
rect(570,300, 150, 50, 20);


  PFont f;
  f = createFont("Ubuntu", int(0.04 * min(800, 700)), true);
  textFont(f);
  textAlign(LEFT);
  smooth();
  fill(255);
  text("Atlanta",60, 275); 
  text("Austin",60, 335);
  
  text("Boston",255, 35); 
  text("Chicago",255, 95);  
  text("Cincinnati",255, 155);  
  text("Dallas",255, 215);
  text("Denver",255, 275);  
  text("Hartford",255, 335); 
  
  text("LA",415, 35); 
  text("New York",415, 95);  
  text("Pittsburgh",415, 155);  
  text("Portland",415, 215);  
  text("Raleigh",415, 275);  
  text("San Diego",415, 335); 
  
  text("San. Fran.",575, 35); 
  text("San Jose",575, 95);  
  text("Seattle",575, 155);  
  text("St. Louis",575, 215); 
  text("Tampa",575, 275);   
  text("Wash. DC",575, 335); 

  
}