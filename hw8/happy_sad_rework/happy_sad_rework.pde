int whichCity; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};
float[] HappinessRank={53,22,31,39,57,92,44,115,83,93,58,128,48,101,152,75,62,46,55,78}; //min 22, max 152, 152-9=143 and 143/13=11
float[] ConfortIndex={87,85,84,82,72,45,58,83,66,46,50,50,63,60,50,79,52,68,65,79};

PImage pillow;
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
  
  pillow = loadImage("pillow.png");
  pillow.resize(100,100);
  if(mouseX >0 && mouseX<295 && mouseY>0 && mouseY<700){
    text("Selected "+City[int(mouseY/35.25)],300,2);
    text("Scaled Happiness: "+round((HappinessRank[int(mouseY/35.25)]-9)/11)+"\nScaled Confort: "+round((ConfortIndex[int(mouseY/35.25)]-42)/7),300,35);
    
    for(int i=0;i<round((ConfortIndex[int(mouseY/35.25)]-42)/7);i++){
      for(int j = 0;j<round((ConfortIndex[int(mouseY/35.25)]-42)/7);j++){
        image(pillow,600-0.7*j*pillow.width,500-0.6*i*pillow.height);
      }
    }
    image(loadImage("x"+round((HappinessRank[int(mouseY/35.25)]-9)/11)+".png"),400,300);

    
  }
}
