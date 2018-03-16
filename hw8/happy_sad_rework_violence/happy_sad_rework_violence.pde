int whichCity; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};
float[] HappinessRank={53,22,31,39,57,92,44,115,83,93,58,128,48,101,152,75,62,46,55,78}; //min 22, max 152, 152-9=143 and 143/13=11
float[] ViolentCrime={6.34,3.98,7.76,3.29,6.73,11,12.02,6.3,11.19,9.03,7.06,18.17,3.92,5.85,9.25,4.72,7.06,3.72,6.94,5.98}; //min 3.29, max 18.17, 3.29/3.2=.09 and 14.97/13=1.15
PImage rope,shadow;
void setup() {
  textAlign(LEFT, TOP);
  size(700, 720);
  background(255);
  shadow=loadImage("shadow.png");
  shadow.resize(100, 200);
  rope =loadImage("rope.png");
  rope.resize(200,200);
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
    text("Scaled Happiness: "+round((HappinessRank[int(mouseY/35.25)]-9)/11),300,35);
    image(loadImage("x"+round((HappinessRank[int(mouseY/35.25)]-9)/11)+".png"),300,70);
    text("Scaled Violence: "+((ViolentCrime[int(mouseY/35.25)]-3.2)/13),300,300);
    

    pushMatrix();
    if(millis() % 4000 < 1000 ){
      rotate(map(millis()%1000,0,1000,0,radians(-(((ViolentCrime[int(mouseY/35.25)]-3.2)/13)*10))));
    } else if(millis() % 4000 < 2000 ){
      rotate(map(millis()%1000,0,1000,radians(-(((ViolentCrime[int(mouseY/35.25)]-3.2)/13)*10)),0));
    } else if(millis() % 4000 < 3000 ){
      rotate(map(millis()%1000,0,1000,0,radians(((ViolentCrime[int(mouseY/35.25)]-3.2)/13)*10)));
    } else {
      rotate(map(millis()%1000,0,1000,radians(((ViolentCrime[int(mouseY/35.25)]-3.2)/13)*10),0));
    }
    
    
    translate(500,500);
    image(rope,0,0);
    popMatrix();
    
    
  
  }
  image(shadow, 500, 500);
}