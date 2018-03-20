class DSJob {
  // this space is for organizing all class method to make the first page clean
  // if statements with city numbers and year can be listed here
  // all other dirty code can be placed here in order to not show everything on the first page.
  // however, each feature/screen need to be constructed as class function like the "Map" class.
  // this is just a suggestion


  // Field

  //Button button_single, button_married, button_2017, button_2018;
  Button button_tax;
  //Button button_stdLiving, button_commute, button_mortgate;
  Button button_wordCloud;

  // animation field
  PImage rope, shadow, dartboard, comfort, shore, bachelors, brain, tree;
  Flower[] myFlower;
  Car[] cars;
  // weather
  WeatherMap weatherMap;


  // animation/ 
  float droopx;
  float droopy;
  float ycontrol;
  float flowerx;
  float flowery;
  PImage pot;
  PImage potb;
  PImage dahlia;
  // animation/ moneybag
  PImage moneybag;
  PVector x;
  ParticleSystem ps;
  ParticleSystem ps2;
  ParticleSystem ps3;
  ParticleSystem ps4;
  ParticleSystem ps5;

  // water quality/shore
  float xur =1400;
  float y= 800;
  float c=1500;
  float speed=3;
  float speedi=4;
  float pur=1600;
  float speedo=2;
  color [] colarray = { color(176, 164, 152, 100), color(220, 200, 85, 100), color(176, 164, 152, 100), color(34, 78, 104, 100), color(110, 77, 40, 100), color(110, 77, 40, 100), color(0, 102, 153, 100), color(108, 154, 187, 100), color(172, 138, 100, 100), color(124, 97, 67, 20), color(176, 164, 152, 100), color(107, 84, 58, 100), color(63, 31, 3, 20), color(154, 178, 7, 100), color(0, 102, 153, 100), color(64, 128, 128, 100), color(154, 178, 7, 100), color(176, 164, 152, 100), color(55, 177, 125, 100), color(34, 78, 104, 100), color(34, 78, 104, 100), color(108, 154, 187, 100)};
  color [] colorray ={color(195, 195, 195, 100), color(200, 191, 231, 100), color(0, 149, 149, 100), color(181, 230, 29, 100), color(63, 72, 204, 100), color(112, 146, 190, 100), color(181, 230, 29, 100), color(255, 201, 14, 100), color(0, 149, 149, 100), color(185, 122, 87, 100), color(128, 64, 0, 100), color(128, 64, 0, 100), color(63, 72, 204, 100), color(255, 201, 14, 100), color(185, 122, 87, 100), color(195, 195, 195, 100), color(112, 146, 190, 100), color(153, 217, 234, 100), color(153, 217, 234, 100), color(200, 191, 231, 100)}; 
  float[] jgro={340, 235, 100, 145, 265, 370, 115, 295, 250, 325, 310, 160, 130, 205, 355, 220, 385, 190, 175, 280};
  // property crime
  Walker w;
  float iw, xw;
  color colors;
  PImage house;

  // financial health
  float i_f, xf;
  ArrayList<ParticleSystem> systems;


  // constructor
  DSJob() {
    //button_single = new Button("Single", 5, 365, 100, 30);
    //button_married = new Button("Married", 112, 365, 100, 30);
    //button_2017 = new Button("2017", 219, 365, 95, 30);
    //button_2018 = new Button("2018", 320, 365, 95, 30);
    button_wordCloud = new Button("Word Cloud", 980, 10, 150, 30);
    button_tax = new Button();

    //button_stdLiving = new Button("Standard of Living", 5, 400, 400, 30);
    //button_commute =new Button("Commute Time", 5, 440, 400, 30);
    //button_mortgate= new Button("Mortgage", 5, 480, 400, 30);

    //text for panel 1
    textSize(24);
    textAlign(LEFT, TOP);
    fill(255, 0, 0);
    text("1. Select a city on the map -> \n2. Click 'Word Cloud' for reviews.\n3. Select year and marrage status\n    for itemized tax information.\n4. Move mouse over text\n    for animations.", 10, 50);

    // animation field
    rope =loadImage("animation/happy_sad_rework_violence/rope.png");
    //rope.resize(350, 350);
    shadow=loadImage("animation/happy_sad_rework_violence/shadow.png");
    shadow.resize(100, 200);
    dartboard = loadImage("animation/dartboard/dartboard.png");
    dartboard.resize(340, 340);
    pot=loadImage("pot.png");
    pot.resize(100, 100);
    potb=loadImage("potback.png");
    potb.resize(100, 17);
    dahlia=loadImage("dahlia.png");
    dahlia.resize(100, 100);
    // tax animation
    moneybag=loadImage("animation/moneybag3/moneybag.jpg");
    moneybag.resize(330, 330);
    ps = new ParticleSystem(new PVector(500, 700));
    ps2 = new ParticleSystem(new PVector(500, 700));
    ps3 = new ParticleSystem(new PVector(500, 700));
    ps4 = new ParticleSystem(new PVector(500, 700));
    ps5 = new ParticleSystem(new PVector(500, 700));
    comfort = loadImage("comfort.png");
    comfort.resize(380, 380);
    // water quality/shore
    shore=loadImage("shore.jpg");
    shore.resize(500, 400);
    // Bachelor's
    bachelors = loadImage("bachelors.png");
    brain = loadImage("brain.png");
    //property crime
    house = loadImage("house.png");
    weatherMap = new WeatherMap();
    //air quality
    tree=loadImage("trees.jpg");
    tree.resize(500, 400);
  }

  //DSJob(String city, String state, int cityNum) {
  //  panel1(city, state, listing[cityNum]);
  //}


  // Methods

  // panel1: salary histogram
  void panel1(String city, String state, int cityNum) {
    fill(255);
    stroke(2);
    rect(0, 0, 420, 325);
    image(loadImage(city+".png"), 2, 88);
    fill(0);
    textSize(32);
    textAlign(LEFT, TOP);
    text("Data Scientist Salaries in\nthe "+city+", "+state+" area", 2, 0);
    text("from "+listing[cityNum]+"\nlistings", 252, 230);
  }




  void salaryAdjustPanel() {

    // title
    textSize(24);
    textAlign(LEFT, TOP);
    fill(0, 0, 255);
    text("Itemized Tax Information", 10, 330);

    // Button for income adjustments
    //button_single.buttonPressed();
    //button_married.buttonPressed();
    //button_2017.buttonPressed();
    //button_2018.buttonPressed();
    button_tax.display();


    //// word cloud panel

    // tried 'easy button': issue w/ refreshing/loop
    //if (button_tax.wordPressed() == 0) {
    //  fill(232);
    //  rect(980, 10, 150, 30);
    //} else {
    //  noFill();
    //  rect(980, 10, 150, 30);
    //}

    button_wordCloud.buttonPressed();
    noStroke();
    if (button_wordCloud.getButton()==0) {
      button_wordCloud.drawButton(color(224, 224, 224));
    } else {
      image(loadImage("wordCloud/"+map.getCity()+".png"), 420, 0);
      button_wordCloud.drawButton(color(#3333FF));
    }

    // pie Chart/ panel2
    pieChart(400, 210, 690, button_tax.taxPressed(), button_tax.married(), button_tax.taxYear());
  }

  void panel3_Quality() {
    int whichCity = map.getCityNum();
    panel3(MediumHouseholdIncome[whichCity], Population[whichCity], PopulationChange[whichCity], JobGrowth[whichCity], Bachelor[whichCity], AvgIQ[whichCity], Poverty[whichCity], ViolentCrime[whichCity], PropertyCrime[whichCity], HappinessRank[whichCity], SenseOfPurpose[whichCity], SocialHealth[whichCity], FinancialHealth[whichCity], Community[whichCity], PhysicalHealth[whichCity], PrecipitationDays[whichCity], MeanJulyTemp[whichCity], MeanJanTemp[whichCity], ConfortIndex[whichCity], AirQuality[whichCity], WaterQuality[whichCity]);
  }

  void panel4_LivingSTD() {
    int whichCity = map.getCityNum();
    if (button_tax.taxPressed() ==-1) {
      panel4(StandardOfLivingIndex[whichCity], Single2017IncomeAdjusted[whichCity], GroceryIndex[whichCity], HousingIndex[whichCity], UtilitiesIndex[whichCity], TransportationIndex[whichCity], HealthCareIndex[whichCity], GoodServicesIndex[whichCity], MediumHousing[whichCity], MediumMonthlyMortgage[whichCity], MediumMonthlyRent[whichCity], MeanGasPrice[whichCity], MeanDailyCommute[whichCity], Single2017CommuteAdjusted[whichCity], Single2017AfterMortgage[whichCity]);
    } else if (button_tax.taxPressed() ==-2) {
      // Case2: single 2018 tax
      panel4(StandardOfLivingIndex[whichCity], Single2018IncomeAdjusted[whichCity], GroceryIndex[whichCity], HousingIndex[whichCity], UtilitiesIndex[whichCity], TransportationIndex[whichCity], HealthCareIndex[whichCity], GoodServicesIndex[whichCity], MediumHousing[whichCity], MediumMonthlyMortgage[whichCity], MediumMonthlyRent[whichCity], MeanGasPrice[whichCity], MeanDailyCommute[whichCity], Single2018CommuteAdjusted[whichCity], Single2018AfterMortgage[whichCity]);
    } else if (button_tax.taxPressed() == 1) {
      //if (button_2017.pressed == 1) {
      // Case3: married 2017 tax
      panel4(StandardOfLivingIndex[whichCity], Married2017IncomeAdjusted[whichCity], GroceryIndex[whichCity], HousingIndex[whichCity], UtilitiesIndex[whichCity], TransportationIndex[whichCity], HealthCareIndex[whichCity], GoodServicesIndex[whichCity], MediumHousing[whichCity], MediumMonthlyMortgage[whichCity], MediumMonthlyRent[whichCity], MeanGasPrice[whichCity], MeanDailyCommute[whichCity], Married2017CommuteAdjusted[whichCity], Married2017AfterMortgage[whichCity]);
    } else if (button_tax.taxPressed() == 2) {
      // Case4: married 2018 tax
      panel4(StandardOfLivingIndex[whichCity], Married2018IncomeAdjusted[whichCity], GroceryIndex[whichCity], HousingIndex[whichCity], UtilitiesIndex[whichCity], TransportationIndex[whichCity], HealthCareIndex[whichCity], GoodServicesIndex[whichCity], MediumHousing[whichCity], MediumMonthlyMortgage[whichCity], MediumMonthlyRent[whichCity], MeanGasPrice[whichCity], MeanDailyCommute[whichCity], Married2018CommuteAdjusted[whichCity], Married2018AfterMortgage[whichCity]);
    }
  }


  // getter/ Salary adjustment

  float[] incomeAdj(int whichCity) {
    if (button_tax.taxPressed() ==-1) {
      float data[] =  {Salary[whichCity], Single2017IncomeKept[whichCity], Single2017IncomeAdjusted[whichCity], Single2017CommuteAdjusted[whichCity], Single2017AfterMortgage[whichCity]};
      return data;
    } else if (button_tax.taxPressed() ==-2) {
      // Case2: single 2018 tax
      float data[] =  {Salary[whichCity], Single2018IncomeKept[whichCity], Single2018IncomeAdjusted[whichCity], Single2018CommuteAdjusted[whichCity], Single2018AfterMortgage[whichCity]};
      return data;
    } else if (button_tax.taxPressed() == 1) {
      //if (button_2017.pressed == 1) {
      // Case3: married 2017 tax
      float data[] =  {Salary[whichCity], Married2017IncomeKept[whichCity], Married2017IncomeAdjusted[whichCity], Married2017CommuteAdjusted[whichCity], Married2017AfterMortgage[whichCity]};
      return data;
    } else if (button_tax.taxPressed() == 2) {
      // Case4: married 2018 tax
      float data[] =  {Salary[whichCity], Married2018IncomeKept[whichCity], Married2018IncomeAdjusted[whichCity], Married2018CommuteAdjusted[whichCity], Married2018AfterMortgage[whichCity]};
      return data;
    } else {
      return (new float[] {0, 0, 0, 0, 0});
    }
  }

  //    if (button_single.pressed == 1) {
  //      if (button_2017.pressed == 1) {
  //        // Case1: single 2017 tax
  //        float data[] =  {Salary[whichCity], Single2017IncomeKept[whichCity], Single2017IncomeAdjusted[whichCity], Single2017CommuteAdjusted[whichCity], Single2017AfterMortgage[whichCity]};
  //        return data;
  //      } else {
  //        // Case2: single 2018 tax
  //        float data[] =  {Salary[whichCity], Single2018IncomeKept[whichCity], Single2018IncomeAdjusted[whichCity], Single2018CommuteAdjusted[whichCity], Single2018AfterMortgage[whichCity]};
  //        return data;
  //      }
  //    } else {
  //      if (button_2017.pressed == 1) {
  //        // Case3: married 2017 tax
  //        float data[] =  {Salary[whichCity], Married2017IncomeKept[whichCity], Married2017IncomeAdjusted[whichCity], Married2017CommuteAdjusted[whichCity], Married2017AfterMortgage[whichCity]};
  //        return data;
  //      } else {
  //        // Case4: married 2018 tax
  //        float data[] =  {Salary[whichCity], Married2017IncomeKept[whichCity], Married2017IncomeAdjusted[whichCity], Married2017CommuteAdjusted[whichCity], Married2017AfterMortgage[whichCity]};
  //        return data;
  //      }
  //    }



  // Animation

  void animation(int whichCity) {

    noStroke();
    fill(255);
    rect(1120, 553, 500, 400);

    // happiness

    if (mouseOver(424, 840, 375, 30, color(0, 255, 0, 100))) {
      //image(loadImage("animation/happy_sad_rework_violence/x"+round(map(HappinessRankRank[whichCity],1,20,1,13))+".png"),1150, 560);
      PImage happy = loadImage("animation/happy_sad_rework_violence/x"+round(map(HappinessRankRank[whichCity], 1, 20, 1, 13))+".png");
      happy.resize(207, 200);  // scale to right-bottom panel
      image(happy, 1250, 620);
    }

    // job growth

    if (mouseOver(424, 651, 375, 30, color(0, 255, 0, 100))) {
      pushMatrix();
      translate(300, 380);
      stroke(55, 124, 4);
      strokeWeight(3);

      image(potb, 1000, 410);
      noFill();
      beginShape();
      curveVertex(1050, 450);
      curveVertex(1050, 450);
      curveVertex(1050+droopx, 700+droopy);
      curveVertex(1050-droopx, 600+droopy);
      curveVertex(1050+droopx, 500+droopy);
      curveVertex(1050-droopx, ycontrol);
      curveVertex(flowerx, flowery);
      endShape();

      flowerx=(1050-droopx);
      flowery=(400+droopy);
      ycontrol=(400+droopy);
      image(dahlia, flowerx-50, flowery-20);
      image(pot, 1000, 420);
      droopx-=.5;
      droopy-=5;
      if (ycontrol<jgro[whichCity]) {
        droopx=0;
        droopy=0;
      }

      popMatrix();
    }

    // violence

    if (mouseOver(424, 779, 375, 30, color(0, 255, 0, 100))) {

      pushMatrix();
      translate(1135, 385);
      scale(.5);
      pushMatrix();
      if (millis() % 4000 < 1000 ) {
        translate(387, 773);
        rotate(map(millis()%1000, 0, 1000, 0, radians(-(((ViolentCrime[whichCity]-3.2)/13)*10))));
      } else if (millis() % 4000 < 2000 ) {
        translate(387, 773);
        rotate(map(millis()%1000, 0, 1000, radians(-(((ViolentCrime[whichCity]-3.2)/13)*10)), 0));
      } else if (millis() % 4000 < 3000 ) {
        translate(387, 773);
        rotate(map(millis()%1000, 0, 1000, 0, radians(((ViolentCrime[whichCity]-3.2)/13)*10)));
      } else {
        translate(387, 773);
        rotate(map(millis()%1000, 0, 1000, radians(((ViolentCrime[whichCity]-3.2)/13)*10), 0));
      }
      image(rope, -417, -373);
      popMatrix();

      image(shadow, 380, 800);
      noFill();
      stroke(255);
      strokeWeight(100);
      rect(0, 400, rope.width, 580);
      strokeWeight(1);
      fill(255);
      noStroke();

      popMatrix();
    }

    // sense of purpose
    if (mouseOver(424, 872, 375, 30, color(0, 255, 0, 100))) {
      image(dartboard, 1200, 560);
      for (int i = 1; i<6; i++) {
        image(loadImage("animation/dartboard/dart"+i+".png"), 1320+random(-1.5*SenseOfPurpose[whichCity], 1.5*SenseOfPurpose[whichCity]), 580+random(-1.5*SenseOfPurpose[whichCity], 1.5*SenseOfPurpose[whichCity]));
      }
    }

    // physical health
    if (mouseOver(800, 650, 375, 30, color(0, 255, 0, 100))) {
      myFlower=new Flower[round(9-PhysicalHealth[whichCity]/20)];
      for (int i=0; i<myFlower.length; i++) {
        myFlower[i]=new Flower(i*40+1150, 200, 8, 223, random(0, 135), 152, PhysicalHealth[whichCity]);
      }
      for (int i=0; i<myFlower.length; i++) {
        myFlower[i].display();
        myFlower[i].move();
      }
    }

    // comfort index
    if (mouseOver(800, 775, 375, 30, color(0, 255, 0, 100))) {
      image(comfort, 1150, 520);
    }

    // Tax
    if (mouseOver(0, 326, 420, 580, color(255, 0))) {
      pushMatrix();
      translate(930, 56);
      image(moneybag, 250, 500);
      fill(0);
      ps.addParticle();
      ps.run();
      popMatrix();
    }

    // water
    if (mouseOver(800, 839, 375, 30, color(0, 255, 0, 100))) {
      pushMatrix();
      image(shore, 1120, 553);
      scale(.4);
      translate(2400, 1300);
      noStroke();
      fill(colarray[whichCity]);
      ellipse(c, y, 1200, 330);
      fill(0, 128, 192, 100);
      ellipse(1400, 800, 1200, 330);
      ellipse(1600, 800, 1200, 330);


      fill(0, 0, 255, 40);
      ellipse(1400, 800, 1200, 330);
      fill(46, 117, 255, 20);

      ellipse(1400, 800, 1000, 330);
      fill(colorray[whichCity]);
      ellipse(c, y, 1000, 330);
      c=c+speedi;
      if (c>1700) {         
        speedi=-speedi;
      }
      if (c<1398) {
        speedi = -speedi;
      }
      ellipse(pur, y, 1200, 330);
      fill(0, 121, 118, 20);
      ellipse(pur, y, 1050, 300);
      pur=pur+speedo;
      if (pur>1800) {         
        speedo=-speedo;
      }
      if (pur<1398) {
        speedo = -speedo;
      }
      fill(51, 204, 255, 20);
      ellipse(xur, y, 800, 200);
      fill(0, 0, 204, 20);
      ellipse(1400, 800, 600, 200);
      fill(46, 117, 255, 20);
      ellipse(xur, y, 1100, 300);
      xur=xur+speed;
      if (xur>1540) {         
        speed=-speed;
      }
      if (xur<1399) {
        speed = -speed;
      }    
      popMatrix();
    }


    //    //  // Commute
    //    float cummute = dsJob.incomeAdj(whichCity)[3];
    //    float cummuteSize = map(cummute, 0, 150000, 0, 204);
    //    if (mouseOver(1431, 515-int(cummuteSize), 74, int(cummuteSize)+7, color(255, 0, 0))) {
    //      graf2(cummuteSize/10);
    //    }



    // bachelor/IQ
    if (mouseOver(424, 713, 375, 60, color(0, 255, 0, 100))) {
      imageMode(CENTER);
      image(brain, 1353, 800, map(AvgIQRank[whichCity], 1, 20, 100, 240), map(AvgIQRank[whichCity], 1, 20, 100, 240));
      image(bachelors, 1353, 680, map(BachelorRank[whichCity], 1, 20, 200, 340), map(BachelorRank[whichCity], 1, 20, 200, 340));
      imageMode(CORNER);
    }


    // social health
    if (mouseOver(800, 587, 375, 60, color(0, 255, 0, 100))) {
      drawCircle(1390, 720, map(CommunityRank[whichCity], 1, 20, 20, 200), map(SocialHealthRank[whichCity], 1, 20, 20, 200));
    }

    //PropertyCrimeRank
    //MediumMonthlyMortgageRank

    // property Crime
    if (mouseOver(424, 808, 375, 30, color(0, 255, 0, 100))) {
      imageMode(CENTER);
      image(house, 1390, 720, map(MediumMonthlyMortgageRank[whichCity], 1, 20, 80, 300), map(MediumMonthlyMortgageRank[whichCity], 1, 20, 80, 300));
      imageMode(CORNER);
      noFill();
      if (PropertyCrimeRank[whichCity]==iw) {
        graf(xw, whichCity);
        xw++;
      } else {
        xw=0;
      }
      iw=PropertyCrimeRank[whichCity];
    }      



    // financial health
    if (mouseOver(800, 555, 375, 30, color(0, 255, 0, 100))) {
      pushMatrix();
      translate(1000, 500);
      image(loadImage("moneybag.jpg"), 200, 70);
      if (FinancialHealth[whichCity]==i_f) {
        graf3(xf, whichCity);
        xf++;
      } else {
        xf=0;
      }
      i_f=FinancialHealth[whichCity];
      popMatrix();
    }

    // precipitatio temp
    if (mouseOver(800, 680, 375, 30, color(0, 255, 0, 100))) {
      weatherMap.display(2);
    }

    // July temp
    if (mouseOver(800, 710, 375, 30, color(0, 255, 0, 100))) {
      weatherMap.display(0);
    }

    // Jan temp
    if (mouseOver(800, 740, 375, 30, color(0, 255, 0, 100))) {
      weatherMap.display(1);
    }
    // air quality
    if (mouseOver(800, 808, 375, 30, color(0, 255, 0, 100))) {
      //air
      if (mouseOver(800, 807, 375, 30, color(0, 255, 0, 100))) {
        image(tree, 1120, 553);
        pushMatrix();
        scale(.4);
        translate(2000, 1045);
        fill(colax[whichCity]);
        rectMode(CENTER);
        rect(c, y, 1200, 900, 300);

        c=c+speedi;
        if (c>1700) {         
          speedi=-speedi;
        }
        if (c<1398) {
          speedi = -speedi;
        }

        rect(pur, y, 1050, 900, 500);
        pur=pur+speedo;
        if (pur>1800) {         
          speedo=-speedo;
        }
        if (pur<1398) {
          speedo = -speedo;
        }
        rect(xur, y, 800, 900, 300);
        xur=xur+speed;
        if (xur>1540) {         
          speed=-speed;
        }
        if (xur<1399) {
          speed = -speed;
        } 
        rectMode(CORNER);
        popMatrix();
      }
    }


    // ******************    put animation above this line   *************
  }


  void graf2(float i) {
    if (i==0) {
      cars = new Car[int(i)];
      for (int k= 0; k<cars.length; k++) {
        cars[k] = new Car();
      }
    }
    for (int j =0; j < int(i); j++) {
      cars[j].display();
      cars[j].drive();
    }
  }

  void graf(double i, int whichCity) {
    if (i==0) {
      w = new Walker();
      colors = color(random(255), random(255), random(255));
    }
    // Run the walker object
    i++;
    if (i<PropertyCrimeRank[whichCity]) {
      w.step();
    }
    w.render(colors);
  }

  void graf3(double i, int whichCity) {
    if (i==0) {
      systems = new ArrayList<ParticleSystem>();
      for (int k = 0; k < 6- round(FinancialHealth[whichCity]/30); k++) {
        systems.add(new ParticleSystem(new PVector(444-k*40, 314)));
      }
    }
    for (ParticleSystem ps : systems) {
      //for(int i=0;i<round(FinancialHealth[int(mouseY/35.25)]/15);i++){
      ps.addParticle();
      ps.run();
    }
  }
}