int married; //-1 single, 1 married
int year; //1 2017, 2 2018
int selection = -1; // 1 selected, -1 unselected

void setup() {
  textAlign(LEFT, TOP);
  size(700, 720);
  background(255);
}

void draw() {
  fill(255);
  rect(0,0,700,720);
  
  //make generic buttons
  textSize(30);
  for(int i=0;i<5;i++){
    rect(11+120*i,11,120,50);
  }
  
  //married block, make sure to include fill and nofill
  fill(232);
  if(married == 1){
    rect(131,11,120,50);
  } else if(married == -1){
    rect(11,11,120,50);
  }
  noFill();
  
  //year block, make sure to include fill and nofill
  fill(232);
  if(year == 1){
    rect(251,11,120,50);
  } else if(year == 2){
    rect(371,11,120,50);
  }
  noFill();
  
  //w cloud block,m ake sure to include fill and nofill
  fill(232);
  if(selection == 1){
    rect(490,11,120,50);
  }
  noFill();
  
  //text overlay
  fill(0);
  text(" Single  Married   2017    2018   W.Cloud",20,20);
}
  
void mousePressed(){
  if(mouseY >11 && mouseY<51){
    if(mouseX>11 && mouseX<131){
      println("single");
      married=-1;
    } else if (mouseX>131 && mouseX<251){
      println("married");
      married=1;
    } else if (mouseX>251 && mouseX<371){
      println("2017");
      year=1;
    } else if (mouseX>371 && mouseX<490){
      println("2018");
      year=2;
    } else if (mouseX>490 && mouseX<611){
      println("WordCloud");
      selection = selection*-1;
    }
  }
}
