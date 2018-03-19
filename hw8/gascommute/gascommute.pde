int whichCity; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};
float[] MeanGasPrice={3.436,3.392,3.469,3.373,2.324,2.599,2.763,2.459,2.438,2.738,2.591,2.311,2.433,2.687,2.544,2.958,2.81,2.248,2.281,3.107};
float[] MeanDailyCommute={61,47,64.8,57,50.2,45.8,59.8,47.2,51.6,68.8,60.6,48.2,45.4,80.6,45.2,51.2,47,47.6,52.6,53.8};
float i,x;
Car[] cars;

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
    text("Scaled DailyCommute: "+MeanDailyCommute[int(mouseY/35.25)]+"\nScaled GasPrice: "+round(8-(MeanGasPrice[int(mouseY/35.25)]-2)*5),300,35);
    

    if (MeanGasPrice[int(mouseY/35.25)]==i){
      graf2(x);
      x++;
    } else {
      x=0;
    }
    i=MeanGasPrice[int(mouseY/35.25)];
  }
}

void graf2(double i){
    if (i==0){
       cars = new Car[int(MeanDailyCommute[int(mouseY/35.25)])];
       for (int k= 0; k<cars.length;k++) {
        cars[k] = new Car();
       }
    }
    for (int j =0;j < int(MeanDailyCommute[int(mouseY/35.25)]);j++) {
    cars[j].display();
    cars[j].drive();
  }
}
