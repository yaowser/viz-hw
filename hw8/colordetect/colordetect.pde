int whichCity =11; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};

int[] Single2017FederalTax={22079, 20418, 27654, 27296, 16944, 18172, 18290, 15991, 16809, 17810, 20161, 18045, 16322, 20686, 16104, 21378, 15864, 17717, 17352, 25381};
int[] Single2017FICA={9239, 8739, 9956, 9935, 7667, 8043, 8079, 7375, 7626, 7932, 8604, 8004, 7476, 9044, 7410, 9161, 7336, 7903, 7792, 9788};
int[] Single2017StateTax={7806, 7198, 9848, 9717, 4409, 5058, 6359, 0, 5329, 4777, 5256, 4948, 4646, 6507, 2640, 9289, 2791, 0, 0, 0};
int[] Single2017LocalTax={0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1046, 0, 3722, 2013, 0, 909, 0, 0, 0};

int[] SingleSalesTax={2414, 2041, 2765, 2737, 1854, 1530, 1366, 1667, 1590, 2207, 1607, 2053, 1519, 2276, 1561, 0, 1568, 2099, 2071, 3056};
int[] SingleFuelTax={255, 272, 155, 280, 165, 206, 91, 277, 235, 150, 101, 153, 275, 21, 187, 211, 246, 167, 158, 229};
int[] SinglePropertyTax={1921, 1910, 1665, 1927, 1603, 5359, 1389, 2658, 2663, 5341, 2095, 2636, 2170, 2192, 4475, 2736, 5203, 4675, 5161, 2469};

int[] Single2018FederalTax={19195, 17626, 24464, 24126, 14263, 15441, 15557, 13409, 14133, 15094, 17202, 15319, 13700, 18584, 13509, 18950, 13298, 15005, 14654, 21676};
int[] Single2018FICA={9239, 8739, 10030, 10010, 7667, 8043, 8079, 7375, 7626, 7932, 8604, 8004, 7476, 9044, 7410, 9161, 7336, 7903, 7792, 9862};
int[] Single2018StateTax={7747, 7139, 9789, 9658, 4409, 5048, 6315, 0, 5322, 4775, 5252, 4934, 4637, 6486, 2620, 9280, 2791, 0, 0, 0};
int[] Single2018LocalTax={0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1046, 0, 3714, 2013, 0, 909, 0, 0, 0};

int[] Married2017FederalTax={15221, 13587, 20710, 20357, 10231, 11311, 11431, 9659, 10150, 10949, 13145, 11183, 9857, 14584, 9727, 14966, 9583, 10856, 10491, 17806};
int[] Married2017FICA={9239, 8739, 9956, 9935, 7667, 8043, 8079, 7375, 7626, 7932, 8604, 8004, 7476, 9044, 7410, 9161, 7336, 7903, 7792, 9788};
int[] Married2017StateTax={4846, 4293, 6888, 6757, 4409, 4607, 5941, 0, 5199, 4670, 5032, 4144, 4192, 5602, 2570, 8839, 2791, 0, 0, 0};
int[] Married2017LocalTax={0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1046, 0, 3336, 2013, 0, 909, 0, 0, 0};

int[] MarriedSalesTax={2724, 2313, 3068, 3040, 2042, 1693, 1513, 1822, 1757, 2432, 1765, 2286, 1682, 2505, 1718, 0, 1722, 2297, 2269, 3310};
int[] MarriedFuelTax={511, 544, 310, 559, 329, 413, 183, 555, 470, 300, 201, 307, 551, 43, 374, 422, 493, 334, 315, 459};
int[] MarriedPropertyTax={1921, 1910, 1665, 1927, 1603, 5359, 1389, 2658, 2663, 5341, 2095, 2636, 2170, 2192, 4475, 2736, 5203, 4675, 5161, 2469};

int[] Married2018FederalTax={12069, 10631, 16899, 16589, 8166, 8755, 8813, 7708, 8101, 8581, 10242, 8694, 7867, 11509, 7762, 11845, 7647, 8537, 8361, 14344};
int[] Married2018FICA={9239, 8739, 10030, 10010, 7667, 8043, 8079, 7375, 7626, 7932, 8604, 8004, 7476, 9044, 7410, 9161, 7336, 7903, 7792, 9862};
int[] Married2018StateTax={4728, 4204, 6769, 6638, 4409, 4599, 5888, 0, 5189, 4665, 5023, 4198, 4174, 5568, 2549, 8821, 2791, 0, 0, 0};
int[] Married2018LocalTax={0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1046, 0, 3320, 2013, 0, 909, 0, 0, 0};

int[] Single2017IncomeKept={77060, 73658, 90686, 89425, 67579, 66765, 70039, 68440, 65428, 65468, 74644, 67738, 65323, 73777, 62470, 76979, 61983, 70752, 69319, 90189};
int[] Married2017IncomeKept={86312, 82850, 100132, 98742, 73940, 73707, 77077, 74339, 71815, 72061, 81626, 75017, 71803, 80919, 68573, 83630, 67863, 77248, 75825, 97280};
int[] Single2018IncomeKept={80003, 76509, 93861, 92579, 70260, 69506, 72816, 71022, 68111, 68186, 77607, 70478, 67954, 75908, 65085, 79416, 64549, 73464, 72017, 93820};
int[] Married2018IncomeKept={89582, 85895, 103988, 102554, 76005, 76271, 79748, 76290, 73874, 74434, 84538, 77452, 73811, 84044, 70559, 86769, 69799, 79567, 77955, 100668};

int married = -1; //-1 single, 1 married
int year = 1; //1 2017, 2 2018

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
  
  println(mouseX, mouseY); //x range 0 to 295; y range 0 to 705
  image(loadImage("1.png"),0,0);
  color c = get(mouseX, mouseY);
  println("fill(" + int(red(c)) + "," + int(green(c)) + "," + int(blue(c)) + ");");
  if(mouseX >0 && mouseX<400 && mouseY>0 && mouseY<400){ // limit to only pie graph size
    if(c == color(204,255,153)){ // light green
      if(married == -1 && year == 1) {
         text("Income Kept: $"+Single2017IncomeKept[whichCity],mouseX,mouseY,200,200);
      } else if(married == -1 && year == 2) {
         text("Income Kept: $"+Single2018IncomeKept[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1 && year == 1) {
         text("Income Kept: $"+Married2017IncomeKept[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1 && year == 2) {
         text("Income Kept: $"+Married2018IncomeKept[whichCity],mouseX,mouseY,200,200);
      }
    } else if(c == color(255,0,0)){
      if(married == -1 && year == 1) {
         text("Federal Tax: $"+Single2017FederalTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == -1 && year == 2) {
         text("Federal Tax: $"+Single2018FederalTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1 && year == 1) {
         text("Federal Tax: $"+Married2017FederalTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1 && year == 2) {
         text("Federal Tax: $"+Married2018FederalTax[whichCity],mouseX,mouseY,200,200);
      }
    } else if(c == color(255,128,0)){
      if(married == -1 && year == 1) {
         text("Fed Insurance Contrib: $"+Single2017FICA[whichCity],mouseX,mouseY,200,200);
      } else if(married == -1 && year == 2) {
         text("Fed Insurance Contrib: $"+Single2018FICA[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1 && year == 1) {
         text("Fed Insurance Contrib: $"+Married2017FICA[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1 && year == 2) {
         text("Fed Insurance Contrib: $"+Married2018FICA[whichCity],mouseX,mouseY,200,200);
      }
    } else if(c == color(255,255,0)){
      if(married == -1 && year == 1) {
         text("State Tax: $"+Single2017StateTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == -1 && year == 2) {
         text("State Tax: $"+Single2018StateTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1 && year == 1) {
         text("State Tax: $"+Married2017StateTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1 && year == 2) {
         text("State Tax: $"+Married2018StateTax[whichCity],mouseX,mouseY,200,200);
      }
    } else if(c == color(128,255,0)){
      if(married == -1 && year == 1) {
         text("Local Tax: $"+Single2017LocalTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == -1 && year == 2) {
         text("Local Tax: $"+Single2018LocalTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1 && year == 1) {
         text("Local Tax: $"+Married2017LocalTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1 && year == 2) {
         text("Local Tax: $"+Married2018LocalTax[whichCity],mouseX,mouseY,200,200);
      }
    } else if(c == color(0,255,0)){
      if(married == -1) {
         text("Sales Tax: $"+SingleSalesTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1) {
         text("Sales Tax: $"+MarriedSalesTax[whichCity],mouseX,mouseY,200,200);
      }
    } else if(c == color(0,255,128)){
      if(married == -1) {
         text("Fuel Tax: $"+SingleFuelTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1) {
         text("Fuel Tax: $"+MarriedFuelTax[whichCity],mouseX,mouseY,200,200);
      }
    } else if(c == color(0,255,255)){
      if(married == -1) {
         text("Property Tax: $"+SinglePropertyTax[whichCity],mouseX,mouseY,200,200);
      } else if(married == 1) {
         text("Property Tax: $"+MarriedPropertyTax[whichCity],mouseX,mouseY,200,200);
      }
    }
  }
  if(mouseY >400 && mouseX>0 && mouseX<400){
    text("fill(" + int(red(c)) + "," + int(green(c)) + "," + int(blue(c)) + ");",mouseX,mouseY);
  }
    
}
