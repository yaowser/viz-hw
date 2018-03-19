int whichCity; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};
int[] PhysicalHealth={18,13,16,15,24,55,27,101,58,52,31,96,61,41,160,79,80,60,73,65};
Flower[] myFlower;
float x;
float y;


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
    text("Scaled Health: "+round(9-PhysicalHealth[int(mouseY/35.25)]/20),300,35);
    myFlower=new Flower[round(9-PhysicalHealth[int(mouseY/35.25)]/20)];
    for (int i=0; i<myFlower.length; i++) {
      myFlower[i]=new Flower(i*40+300, 0, 8, 223, random(0, 135), 152, PhysicalHealth[int(mouseY/35.25)]);
    }
    for (int i=0; i<myFlower.length; i++) {
      myFlower[i].display();
      myFlower[i].move();
    }
  }
}
