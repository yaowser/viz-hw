int whichCity; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};
int[] SenseOfPurpose={42,54,110,82,114,166,62,128,92,112,154,142,81,152,156,136,108,45,23,139}; //min 22, max 152, 152-9=143 and 143/13=11

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
    text("Scaled Purpose: "+1.5*SenseOfPurpose[int(mouseY/35.25)],300,35);
    image(loadImage("dartboard.png"),300,70);
    for(int i = 1; i<6; i++) {
        image(loadImage("dart"+i+".png"),517+random(-1.5*SenseOfPurpose[int(mouseY/35.25)],1.5*SenseOfPurpose[int(mouseY/35.25)]),152+random(-1.5*SenseOfPurpose[int(mouseY/35.25)],1.5*SenseOfPurpose[int(mouseY/35.25)]));
    }
  }
}
