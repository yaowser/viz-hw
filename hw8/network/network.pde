int whichCity; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};
int[] SocialHealth={73,72,51,77,148,106,40,83,68,121,74,137,66,99,155,90,62,100,80,118};
int[] Community={114,45,82,101,55,146,86,107,129,149,63,145,37,142,119,72,81,34,62,111};

void setup() {
  textAlign(LEFT, TOP);
  size(700, 720);
  background(255);
}

void draw() {
  fill(255);
  rect(0,0,700,720);
  fill(0);
  textSize(30);
  for (int i = 0; i<City.length; i++){
    text(City[i]+", "+State[i],2,i*35);
  }
  println(mouseX, mouseY); //x range 0 to 295; y range 0 to 705
  
  if(mouseX >0 && mouseX<295 && mouseY>0 && mouseY<700){
    text("Selected "+City[int(mouseY/35.25)],300,2);
    text("Scaled Social: "+SocialHealth[int(mouseY/35.25)]+"\nScaled Community: "+Community[int(mouseY/35.25)],300,35);
    drawCircle(500,500, 300-Community[int(mouseY/35.25)], SocialHealth[int(mouseY/35.25)]);
  }
}

void drawCircle(float x, float y, float radius, float social) {
  noFill();
  strokeWeight(1);
  stroke(random(255),random(255),random(255));
  ellipse(x, y, radius, radius);
  if (radius > social/6) {
    // Four circles! left right, up and down
    drawCircle(x + radius/2, y, radius/2, social);
    drawCircle(x - radius/2, y, radius/2, social);
    drawCircle(x, y + radius/2, radius/2, social);
    drawCircle(x, y - radius/2, radius/2, social);
  }
}
