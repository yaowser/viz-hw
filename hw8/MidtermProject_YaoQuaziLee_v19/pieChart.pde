// panel2: tax pieChart
void pieChart(float diameter, int x, int y, int taxPressed, int married, int year) {
  color[] pieColor = {color(#FF0000), color(#FF8000), color(#FFFF00), color(#3333FF), color(#00FF00), color(#FF33FF), color(#00FFFF)};
  int whichCity = map.getCityNum();
  float data[] = new float[9];
  String[] taxType = {"FederalTax", "FICA", "StateTax", "LocalTax", "SalesTax", "FuelTax", "Property", "Income Kept"};

  if (taxPressed ==-1) {
    float data0[] = {Single2017FederalTax[whichCity], Single2017FICA[whichCity], Single2017StateTax[whichCity], Single2017LocalTax[whichCity], SingleSalesTax[whichCity], SingleFuelTax[whichCity], SinglePropertyTax[whichCity], Single2017IncomeToTax[whichCity], Single2017IncomeKept[whichCity]};
    for (int i=0; i<data.length; i++) {
      data[i] = data0[i];
    }
  } else if (taxPressed ==-2) {
    // Case2: single 2018 tax
    float data0[] = {Single2018FederalTax[whichCity], Single2018FICA[whichCity], Single2018StateTax[whichCity], Single2018LocalTax[whichCity], SingleSalesTax[whichCity], SingleFuelTax[whichCity], SinglePropertyTax[whichCity], Single2018IncomeToTax[whichCity], Single2018IncomeKept[whichCity]};
    for (int i=0; i<data.length; i++) {
      data[i] = data0[i];
    }
  } else if (taxPressed == 1) {
    //if (button_2017.pressed == 1) {
    // Case3: married 2017 tax
    float data0[] = {Married2017FederalTax[whichCity], Married2017FICA[whichCity], Married2017StateTax[whichCity], Married2017LocalTax[whichCity], MarriedSalesTax[whichCity], MarriedFuelTax[whichCity], MarriedPropertyTax[whichCity], Married2017IncomeToTax[whichCity], Married2017IncomeKept[whichCity]};
    for (int i=0; i<data.length; i++) {
      data[i] = data0[i];
    }
  } else if (taxPressed == 2) {
    // Case4: married 2018 tax
    float data0[] = {Married2018FederalTax[whichCity], Married2018FICA[whichCity], Married2018StateTax[whichCity], Married2018LocalTax[whichCity], MarriedSalesTax[whichCity], MarriedFuelTax[whichCity], MarriedPropertyTax[whichCity], Married2018IncomeToTax[whichCity], Married2018IncomeKept[whichCity]};
    for (int i=0; i<data.length; i++) {
      data[i] = data0[i];
    }
  }

  // convert tax amount into degrees of pieChart angle
  float[] data2 = new float[7];
  for (int i = 0; i<7; i++) {
    data2[i] = data[i]/Salary[whichCity]*2*PI;
    //println(data[i]);
  }

  // clear background
  noStroke();
  fill(255);
  rect(0, 475, 419, 425);
  // base circle draw
  fill(#CCFF99);
  ellipse ( x, y, diameter, diameter);
  // angle calculation
  float lastAngle = -PI/2;
  float[] anglePie = new float[7];
  for (int i = 0; i < 7; i++) {
    fill(pieColor[i]);
    arc(x, y, diameter, diameter, lastAngle, lastAngle+data2[i]);
    lastAngle += data2[i];
    anglePie[i] = lastAngle;
  }

  // tax text
  // tax percent & after tax
  noStroke();
  fill(255);
  rect(260, 410, 100, 70);
  textSize(24);
  textAlign(LEFT, TOP);
  fill(0);
  text("Total Tax Percent:\nIncome After Tax:", 2, 410);
  fill(255, 127, 0);
  text(round(data[7]/Salary[whichCity]*100)+"%", 260, 410);
  fill(0, 202, 0);
  text("$"+data[8], 260, 447);



  //void mouseOverPie(x, y) {

  // mouseOverPie
  ////String[] taxType = {"FederalTax", "FICA", "StateTax", "LocalTax", "SalesTax", "FuelTax", "Property", "Income Kept"};
  //float distCenter = dist(mouseX, mouseY, float(x), float(y));
  //textAlign(LEFT, TOP);
  //fill(50);
  //if (distCenter < diameter/2) {
  //  for (int i = 0; i<8; i++) {
  //    //float mouseRad = acos((mouseX - x)/distCenter);
  //    //println(mouseRad);
  //    float mouseRad = atan2((mouseY - y), (mouseX - x))+PI/2;
  //    if (i==0) {
  //      if (mouseRad > -PI/2  && mouseRad < anglePie[i]) {
  //        text(taxType[i]+" = \n$ "+data[i], mouseX, mouseY);
  //      }
  //    } else if (i>0 && i<7) {
  //      if (mouseRad> anglePie[i-0]  && mouseRad < anglePie[i]) {
  //        text(taxType[i]+" = \n$ "+data2[i], mouseX, mouseY);
  //      }
  //    } else if (i==7) {
  //      if (mouseRad> anglePie[i-1]  && mouseRad<1.5*PI) {
  //        text(taxType[i]+" = \n$ "+ data[8], mouseX, mouseY);
  //      }
  //    }
  //  }
  //}
  //}
//{color(#FF0000), color(#FF8000), color(#FFFF00), color(#3333FF), color(#00FF00), color(#FF33FF), color(#00FFFF)};
fill(0);
  color c = get(mouseX, mouseY);
  //println("fill(" + int(red(c)) + "," + int(green(c)) + "," + int(blue(c)) + ");");
  if (mouseX >5 && mouseX<500 && mouseY>415 && mouseY<895) { // limit to only pie graph size
    if (c == color(#CCFF99)) { 
      if (married == -1 && year == 1) {
        text("Income Kept: $"+Single2017IncomeKept[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == -1 && year == 2) {
        text("Income Kept: $"+Single2018IncomeKept[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1 && year == 1) {
        text("Income Kept: $"+Married2017IncomeKept[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1 && year == 2) {
        text("Income Kept: $"+Married2018IncomeKept[whichCity], mouseX - 170, mouseY, 200, 200);
      }
    } else if (c == color(#FF0000)) {
      if (married == -1 && year == 1) {
        text("Federal Tax: $"+Single2017FederalTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == -1 && year == 2) {
        text("Federal Tax: $"+Single2018FederalTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1 && year == 1) {
        text("Federal Tax: $"+Married2017FederalTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1 && year == 2) {
        text("Federal Tax: $"+Married2018FederalTax[whichCity], mouseX - 170, mouseY, 200, 200);
      }
    } else if (c == color(#FF8000)) {
      if (married == -1 && year == 1) {
        text("Fed Insurance Contrib: $"+Single2017FICA[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == -1 && year == 2) {
        text("Fed Insurance Contrib: $"+Single2018FICA[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1 && year == 1) {
        text("Fed Insurance Contrib: $"+Married2017FICA[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1 && year == 2) {
        text("Fed Insurance Contrib: $"+Married2018FICA[whichCity], mouseX - 170, mouseY, 200, 200);
      }
    } else if (c == color(#FFFF00)) {
      if (married == -1 && year == 1) {
        text("State Tax: \n$"+Single2017StateTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == -1 && year == 2) {
        text("State Tax: \n$"+Single2018StateTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1 && year == 1) {
        text("State Tax: \n$"+Married2017StateTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1 && year == 2) {
        text("State Tax: \n$"+Married2018StateTax[whichCity], mouseX - 170, mouseY, 200, 200);
      }
    } else if (c == color(#3333FF)) {
      if (married == -1 && year == 1) {
        text("Local Tax: $"+Single2017LocalTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == -1 && year == 2) {
        text("Local Tax: $"+Single2018LocalTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1 && year == 1) {
        text("Local Tax: $"+Married2017LocalTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1 && year == 2) {
        text("Local Tax: $"+Married2018LocalTax[whichCity], mouseX - 170, mouseY, 200, 200);
      }
    } else if (c == color(#00FF00)) {
      if (married == -1) {
        text("Sales Tax: $"+SingleSalesTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1) {
        text("Sales Tax: $"+MarriedSalesTax[whichCity], mouseX - 170, mouseY, 200, 200);
      }
    } else if (c == color(#FF33FF)) {
      if (married == -1) {
        text("Fuel Tax: $"+SingleFuelTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1) {
        text("Fuel Tax: $"+MarriedFuelTax[whichCity], mouseX - 170, mouseY, 200, 200);
      }
    } else if (c == color(#00FFFF)) {
      if (married == -1) {
        text("Property Tax: $"+SinglePropertyTax[whichCity], mouseX - 170, mouseY, 200, 200);
      } else if (married == 1) {
        text("Property Tax: $"+MarriedPropertyTax[whichCity], mouseX - 170, mouseY, 200, 200);
      }
    }
  }
  //if (mouseY >400 && mouseX>0 && mouseX<400) {
  //  text("fill(" + int(red(c)) + "," + int(green(c)) + "," + int(blue(c)) + ");", mouseX, mouseY);
  //}
  
  

}
