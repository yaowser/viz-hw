int whichCity; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};
float[] Bachelor={0.325,0.436,0.548,0.402,0.457,0.167,0.554,0.355,0.483,0.365,0.464,0.33,0.492,0.362,0.338,0.47,0.407,0.477,0.31,0.604};
float[] AvgIQ={96.68,116.68,156.69,156.69,146.7,159.96,130.05,56.68,98.35,111.67,176.68,96.65,148.36,120.02,88.3,125.02,114.97,140.01,102,141.69};
PImage bachelors,brain;
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
    text("Scaled Bachelors: "+Bachelor[int(mouseY/35.25)]+"\nScaled IQ: "+AvgIQ[int(mouseY/35.25)],300,35);
    bachelors = loadImage("bachelors.png");
    brain = loadImage("brain.png");
    imageMode(CENTER);
    image(brain,500,600,brain.width*AvgIQ[int(mouseY/35.25)]/500,brain.height*AvgIQ[int(mouseY/35.25)]/500);
    image(bachelors,500,500,bachelors.width*Bachelor[int(mouseY/35.25)]/0.5,bachelors.height*Bachelor[int(mouseY/35.25)]/0.5);
    imageMode(CORNER);
  }
}
