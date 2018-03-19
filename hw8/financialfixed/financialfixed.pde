int whichCity; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};
int[] FinancialHealth={95,50,13,12,96,35,22,136,150,92,37,79,65,123,80,78,24,64,86,40};
float i,x;
ArrayList<ParticleSystem> systems;

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
    text("Scaled Health: "+(6-round(FinancialHealth[int(mouseY/35.25)]/30)),300,35);
    image(loadImage("moneybag.jpg"),200,70);
    
    if (FinancialHealth[int(mouseY/35.25)]==i){
      graf3(x);
      x++;
    } else {
      x=0;
    }
    i=FinancialHealth[int(mouseY/35.25)];
  }
}

void graf3(double i){
  if (i==0){
    systems = new ArrayList<ParticleSystem>();
    for (int k = 0; k < 6- round(FinancialHealth[int(mouseY/35.25)]/30); k++) {
      systems.add(new ParticleSystem(new PVector(444-k*40, 314)));
    }
  }
  for (ParticleSystem ps : systems) {
  //for(int i=0;i<round(FinancialHealth[int(mouseY/35.25)]/15);i++){
    ps.addParticle();
    ps.run();
  }
}
