int whichCity; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};
float[] PropertyCrime={23.59,20.82,61.38,24.27,35.29,44,45.16,22.95,54.99,29.46,23.16,63.16,30.63,15.18,55.1,52.34,32.24,37.71,34.4,55.22};
int[] MediumMonthlyMortgage={2464,2330,3217,2776,1583,1548,2336,1485,1744,1847,2243,1198,1432,2541,1239,1787,1093,1765,1490,2315};

Walker w;
float i,x;
color colors;
PImage house;

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
    text("Scaled PropertyCrime: "+PropertyCrime[int(mouseY/35.25)]+"\nScaled Mortgage: "+MediumMonthlyMortgage[int(mouseY/35.25)],300,35);
    house = loadImage("house.png");
    imageMode(CENTER);
    image(house,500,500,house.width*300/MediumMonthlyMortgage[int(mouseY/35.25)],house.height*300/MediumMonthlyMortgage[int(mouseY/35.25)]);
    imageMode(CORNER);
    noFill();
    if (PropertyCrime[int(mouseY/35.25)]==i){
      graf(x);
      x++;
    } else {
      x=0;
    }
    i=PropertyCrime[int(mouseY/35.25)];
  }
}

void graf(double i){
  if(i==0) {
      w = new Walker();
      colors = color(random(255),random(255),random(255));
    }
    // Run the walker object
    i++;
    if(i<PropertyCrime[int(mouseY/35.25)]){
      w.step();
    }
    w.render(colors); 
}
