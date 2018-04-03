abstract class turret
{

  PImage wraith, ghost, scienceVessel, battleCruiser;   // unit image
  PVector pos;
  float damage;
  float rateOfFire;
  color turretColour;
  float turretWidth;
  float turretHeight;
  float range;
  String priority;
  enemy target;
  boolean changeTarget;
  int timeDamage;
  int timeDraw;
  boolean drawShot;
  int preference;
  boolean clicked;
  boolean moving;
  boolean placeOk;
  int price;
  float upgradeMult;
  float upgradePrice;
  int level;
  float theta;

  turret()
  { 
    pos = new PVector(0, 0);
    timeDamage = millis();
    timeDraw = millis();
    drawShot = false;
    preference = 7;
    changeTarget = false;
    target = null;
    clicked = false;
    moving = false;
    placeOk = true;
    turretWidth = width/38;
    turretHeight = width/38;
    upgradeMult = 1;
    upgradePrice = 1000;
    level = 1;

    wraith = loadImage("sc_wraith.png"); // unit image loading
    wraith.resize(int(turretWidth*2), int(turretHeight*2)); 
    ghost = loadImage("sc_ghost.png");
    ghost.resize(int(turretWidth*2), int(turretHeight*2)); 
    scienceVessel = loadImage("sc_scienceVessel.png");
    scienceVessel.resize(int(turretWidth*2), int(turretHeight*2)); 
    battleCruiser = loadImage("sc_battleCruiser.png");
    battleCruiser.resize(int(turretWidth*2.3), int(turretHeight*2.3)); 
  }


  void place()
  {
    pos.x = mouseX;
    pos.y = mouseY;
    placeOk = true;

    boolean mouse;

    if (moving == true)
    {
      mouse = mousePressed; 
      moving = false;
    } else
    {
      mouse = !mousePressed;
    }

    if (mouse)
    {
      placing = true;
    } else if (selectedturret != null && placing == true)
    {
      if (pos.x - turretWidth/2 < menuWidth)
      {
        placeOk = false;
      }


      if (placeOk == true)
      {
        if (!activeturrets.contains(selectedturret))
        {
          activeturrets.add(selectedturret);
          money -= price;
        }

        placing = false;
        selectedturret = null;
      } else
      {
        text("Can not place here", width/2, height/2);
      }
    }
  }

  //choose a target from inRange based on focus
  void choose(ArrayList<enemy> inRange)
  {
    for (int i=0; i<inRange.size(); i++)
    {
      if (inRange.contains(target) && target != null)
      {
        changeTarget = false;
        break;
      } else
      {
        changeTarget = true;
      }
    }

    if (changeTarget == true)
    {
      switch(preferences[preference])
      {
      case "first":
        {
          target = inRange.get(0);
          break;
        }
      case "last":
        {
          target = inRange.get(inRange.size()-1);
          break;
        }
      case "strongest":
        {
          int highest = 0;

          for (int i=0; i<inRange.size(); i++)
          {
            if (inRange.get(highest).health<inRange.get(i).health)
            {
              highest = i;
            }
          }

          target = inRange.get(highest);
          break;
        }
      case "weakest":
        {
          int lowest = 0;

          for (int i=0; i<inRange.size(); i++)
          {
            if (inRange.get(lowest).health>inRange.get(i).health)
            {
              lowest = i;
            }
          }

          target = inRange.get(lowest);
          break;
        }
      case "basic":
        {
          for (int i=0; i<inRange.size(); i++)
          {
            if (inRange.get(i) instanceof EnemyBlockies)
            {
              target = inRange.get(i);
              break;
            } else
            {
              target = inRange.get(0);
            }
          }
          break;
        }
      case "heavy":
        {
          for (int i=0; i<inRange.size(); i++)
          {
            if (inRange.get(i) instanceof EnemyRay)
            {
              target = inRange.get(i);
              break;
            } else
            {
              target = inRange.get(0);
            }
          }
          break;
        }
      case "fast":
        {
          for (int i=0; i<inRange.size(); i++)
          {
            if (inRange.get(i) instanceof EnemySpider)
            {
              target = inRange.get(i);
              break;
            } else
            {
              target = inRange.get(0);
            }
          }            
          break;
        }
      case "random":
        {
          int rand = (int)random(0, inRange.size()-1);

          target = inRange.get(rand);
          break;
        }
      }
    }
  }

  void isClicked()
  {
    if (mouseX > pos.x - turretWidth/2 && mouseX < pos.x +turretWidth/2 && mouseY > pos.y - turretHeight/2 && mouseY < pos.y + turretHeight/2 && mousePressed)
    {
      clicked = true;

      for (int j=0; j<activeturrets.size(); j++)
      {
        if (activeturrets.get(j) != this)
        {
          activeturrets.get(j).clicked = false;
        }
      }
    }
  }

  void drawData()
  {
    float border = turretWidth/10;
    float boxHeight = height/3;
    float boxWidth = menuWidth - border*2;
    float boxX = border;
    float boxY = height/2;

    textSize(7);
    String d = "Damage: " + (int)damage;
    String rate = String.format("%.2f", rateOfFire);
    String r = "Fire Rate:"+ rate;
    String p = "Focus: " + preferences[preference];
    String ra = "Range: " + int(range);
    String l = "Level: " + level;
    String c = "Cost: " + (int)upgradePrice;

    if (level == 5)
    {
      c = "Cost: Maxed";
    }

    if (range > width)
    {
      ra = "Range: Unlimited";
    }
    strokeWeight(2);
    noStroke();
    noFill();
    rect(boxX, boxY, boxWidth, boxHeight);

    fill(255);
    text(d, boxX+border, boxY+textAscent()*2);
    text(r, boxX+border, boxY+textAscent()*4);
    text(p, boxX+border, boxY+textAscent()*6);
    text(ra, boxX+border, boxY+textAscent()*8);
    text(l, boxX+border, boxY+textAscent()*10);
    text(c, boxX+border, boxY+textAscent()*12);

    if (!(this instanceof AOE))
    {
      prefButtons.clear();
      int j = 0;

      for (int i=0; i<preferences.length; i++)
      {
        button b = new button();
        if (i<=1)
        {
          b = new button(preferences[i], false, (boxX+border)+((boxWidth/2)-(border*2))*j+(border*j), boxY+(boxHeight/10)*5+border, (boxWidth/2)-border*2, boxHeight/10);
          j++;
        } else if (i<=3)
        {
          if (i==2)
          {
            j=0;
          }
          b = new button(preferences[i], false, (boxX+border)+((boxWidth/2)-(border*2))*j+(border*j), boxY+(boxHeight/10)*6+border*2, (boxWidth/2)-border*2, boxHeight/10);
          j++;
        } else if (i<=5)
        {
          if (i==4)
          {
            j=0;
          }
          b = new button(preferences[i], false, ((boxX+border)+((boxWidth/2)-(border*2))*j)+(border*j), boxY+(boxHeight/10)*7+border*3, (boxWidth/2)-border*2, boxHeight/10);
          j++;
        } else if (i<=7)
        {
          if (i==6)
          {
            j=0;
          }
          b = new button(preferences[i], false, ((boxX+border)+((boxWidth/2)-(border*2))*j)+(border*j), boxY+(boxHeight/10)*8+border*4, (boxWidth/2)-border*2, boxHeight/10);
          j++;
        }
        prefButtons.add(b);
      }

      for (int i=0; i<prefButtons.size(); i++)
      {
        prefButtons.get(i).drawButton(); 
        if (prefButtons.get(i).clicked == true)
        {
          for (int k=0; k<preferences.length; k++)
          {
            if (preferences[k] == prefButtons.get(i).label)
            {
              preference = k;
            }
          }
        }
      }
    }

    button m = new button("Move", false, boxX+boxWidth*0.75-border*2, boxY, boxWidth/4, boxHeight/10);
    m.drawButton();

    if (m.clicked == true)
    {
      selectedturret = this;
      moving = true;
      place();
    } else if (placing == false)
    {
      moving = false;
    }

    button s = new button("Sell", false, boxX+boxWidth*0.75-border*2, boxY+(boxHeight/10)+border, boxWidth/4, boxHeight/10);
    s.drawButton();

    if (s.clicked == true)
    {
      sell();
    }

    button u = new button("Upgrade", false, boxX+border, boxY+(boxHeight/10)*4, (boxWidth/2)-border*2, boxHeight/10);
    u.drawButton();

    if (u.clicked == true)
    {
      upgrade();
    }
  }

  void sell()
  {
    money += price/2;
    activeturrets.remove(this);
    selectedturret = null;
  }

  void upgrade()
  {
    if (money >= upgradePrice && level < 5)
    {
      text("UPGRADE", width/2, height/2);
      upgradeMult *= 1.2;
      money -= upgradePrice;
      price *= upgradeMult;
      damage *= upgradeMult;
      rateOfFire *= upgradeMult;
      upgradePrice *= upgradeMult;
      level++;
    } else
    {
      moneyCheck = true;
    }
  }
}





class rocket extends turret
{
  PVector curr;
  PVector source;
  PVector forward;
  PVector blastLoc;
  float speed;
  boolean currSet;
  float AOE;
  boolean drawBlast;
  float pulse;
  boolean pulseCheck2;

  rocket()
  {
    super();
    damage = 100;
    rateOfFire = 0.25;
    turretColour = color(0,204,0);
    range =width/5;
    price = 450;
    speed = 6;
    currSet = true;
    AOE = 100;
    drawBlast = false;
    pulse = 0;
    theta = 0;
    pulseCheck2 = true;
    source = new PVector(0, 0);
  }

  void drawturret(boolean rot)
  {
    strokeWeight(3);
    stroke(turretColour);
    noFill();

    pushMatrix();
    translate(pos.x, pos.y);
    //theta = degrees(atan2(mouseX-pos.x,mouseY-pos.y));


    if (target != null)
    {
      theta = degrees(atan2(target.curr.x+target.source.x-pos.x, target.curr.y+target.source.y-pos.y));
    }

    //rotate((-radians(theta-90)));
    //strokeWeight(3);
    //stroke(turretColour);
    //noFill();
    //ellipse(0,0,turretWidth,turretHeight);
    //fill(0);    
    //rect(-turretWidth/4,-turretHeight/4,turretWidth,turretHeight/2);

    if (rot) {
      rotate(-radians(theta+90));
    }
    imageMode(CENTER);
    image(battleCruiser, 0, 0);

    if (pos.x > menuWidth && clicked == true)
    {
      stroke(turretColour);
      strokeWeight(1);
      noFill();
      ellipse(0, 0, range*2, range*2);

      source = new PVector(pos.x, pos.y);
    }
    popMatrix();
  }

  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(pos, range);

    if (currSet == true)
    {
      curr = new PVector(pos.x, pos.y);
      currSet = false;
    }

    if (inRange != null && drawShot == false)
    {
      super.choose(inRange);
    }

    if (!(activeEnemies.contains(target)))
    {
      target = null;
      drawShot = false;
      curr.x = source.x;
      curr.y = source.y;
    }

    if (target != null && millis() - timeDamage  >= 1000/rateOfFire && moving == false)
    {
      timeDamage = millis();
      drawShot = true;
      pulseCheck2 = true;
    }

    if (drawShot == true)
    {
      PVector dest = new PVector(target.curr.x+target.source.x, target.curr.y+target.source.y);
      fill(255, 0, 0);
      stroke(255, 0, 0);
      strokeWeight(10);
      point(dest.x, dest.y);
      forward = PVector.sub(dest, curr);
      forward.normalize();

      curr.add(PVector.mult(forward, speed)); 

      stroke(0, 255, 0);
      strokeWeight(10);
      fill(0, 255, 0);
      point(curr.x, curr.y);

      if (dist(curr.x, curr.y, dest.x, dest.y) < 10)
      {         
        blastLoc = new PVector(curr.x, curr.y);
        curr.x = source.x;
        curr.y = source.y;
        target = null;
        drawShot = false; 
        drawBlast = true;
      }
    }

    if (drawBlast == true)
    {
      ArrayList<enemy> inBlast = rangeCheck(blastLoc, AOE);

      if (sound == true)
      {
        launcherSound.play();

        if (launcherSound.position() == launcherSound.length())
        {
          launcherSound.rewind();
        }
      }

      stroke(0, 255, 0);
      strokeWeight(4);
      noFill();

      pulse = lerp(pulse, AOE*2, 0.1);

      if (pulse > (AOE*2)-1)
      {
        pulse = 0;
        drawBlast = false;
      } else if (pulse > AOE && inBlast != null)
      {
        if (pulseCheck2 == true)
        {
          for (int i=0; i<inBlast.size(); i++)
          {
            inBlast.get(i).takeDamage(damage);
          }  
          pulseCheck2 = false;
        }
      }

      ellipse(blastLoc.x, blastLoc.y, pulse, pulse);
    }
  }
}



class sniper extends turret
{
  PVector curr;
  PVector source;
  PVector forward;
  boolean currSet;
  float speed;

  sniper()
  {
    super();
    damage = 100;
    rateOfFire = 0.5;
    turretColour = color(255, 255, 0);
    range = width/3;
    price = 350;
    currSet = true;
    speed = 100;
    source = new PVector(0, 0);
  }

  void drawturret(boolean rot)
  {
    pushMatrix();
    translate(pos.x, pos.y);

    if (target != null)
    {
      theta = degrees(atan2(target.curr.x+target.source.x-pos.x, target.curr.y+target.source.y-pos.y));
    }

    //rotate(-radians(theta-90));
    //strokeWeight(3);
    //stroke(turretColour);
    //noFill();
    //ellipse(0, 0, turretWidth, turretHeight);
    //strokeWeight(5);
    //line(0, 0, (turretWidth*0.75), 0);
    
    if (rot){
    rotate(-radians(theta+90));
    }
    imageMode(CENTER);
    image(ghost, 0, 0);

    if (pos.x > menuWidth && clicked == true)
    {
      stroke(turretColour);
      strokeWeight(1);
      noFill();
      ellipse(0, 0, range*2, range*2);

      source = new PVector(pos.x, pos.y);
    } 

    popMatrix();
  }

  void fire()
  {
    if (currSet == true)
    {
      curr = new PVector(pos.x, pos.y);
      currSet = false;
    }

    ArrayList<enemy> inRange = rangeCheck(pos, range);

    if (inRange != null && drawShot == false)
    {
      super.choose(inRange);
    }

    if (!(activeEnemies.contains(target)))
    {
      target = null;
      drawShot = false;
      curr.x = source.x;
      curr.y = source.y;
    }

    if (target != null && millis() - timeDamage  >= 1000/rateOfFire && moving == false)
    {
      timeDamage = millis();
      drawShot = true;
    }

    if (drawShot == true)
    {
      if (sound == true)
      {
        sniperSound.play();

        if (sniperSound.position() == sniperSound.length())
        {
          sniperSound.rewind();
        }
      }

      PVector dest = new PVector(target.curr.x+target.source.x, target.curr.y+target.source.y);

      float theta = atan2(dest.y - curr.y, dest.x - curr.x) + HALF_PI;
      forward = new PVector(sin(theta), -cos(theta));    
      forward.normalize();
      curr.add(PVector.mult(forward, speed));

      pushMatrix();
      translate(curr.x, curr.y);

      rotate(theta);
      strokeWeight(3);
      stroke(0, 255, 0);
      line(0, -20, 0, 20);

      popMatrix();

      if (dist(curr.x, curr.y, dest.x, dest.y) < 50)
      {
        target.takeDamage(damage);  
        curr.x = source.x;
        curr.y = source.y;
        target = null;
        drawShot = false;
      }
    }
  }
}




// Area of Effect Damage

class AOE extends turret
{
  float pulse;
  boolean pulseCheck;

  AOE()
  {
    super();
    damage = 100;
    rateOfFire = 0.25;
    turretColour = color(127,0,255);
    range = width/12;
    pulse = turretWidth/2;
    price = 200;
    pulseCheck = true;
  }

  void drawturret()
  {
    //stroke(turretColour);
    //noFill();
    //strokeWeight(3);
    //ellipse(pos.x, pos.y, turretWidth, turretHeight);
    //ellipse(pos.x, pos.y, turretWidth/2, turretHeight/2);

    //rotate(-radians(theta+180));
    pushMatrix();
    translate(pos.x, pos.y);
    imageMode(CENTER);
    image(scienceVessel, 0, 0);
    popMatrix();

    //if clicked draw range
    if (pos.x > menuWidth && clicked == true)
    {
      noFill();
      stroke(turretColour);
      strokeWeight(1);
      ellipse(pos.x, pos.y, range*2, range*2);
    }
  }

  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(pos, range);

    if (inRange != null)
    {
      if (millis()-timeDamage >= 1000/rateOfFire && moving == false)
      {
        timeDamage = millis();
        drawShot = true;
        pulseCheck = true;
      }
    }

    if (drawShot == true)
    {
      if (sound == true)
      {
        AOESound.play();

        if (AOESound.position() == AOESound.length())
        {
          AOESound.rewind();
        }
      }

      stroke(turretColour);
      strokeWeight(2);
      noFill();

      pulse = lerp(pulse, range*2, 0.1);
      ellipse(pos.x, pos.y, pulse, pulse);

      if (pulse > range*2-1)
      {
        pulse = turretWidth/2;
        drawShot = false;
      } else if ( pulse > range && inRange != null)
      {
        if (pulseCheck == true)
        {
          for (int i=0; i<inRange.size(); i++)
          {
            inRange.get(i).takeDamage(damage);
          }      
          pulseCheck = false;
        }
      }
    }
  }
}





class cannon extends turret
{  
  cannon()
  {
    super();
    damage = 40;
    rateOfFire = 1;
    turretColour = color(204,0,0);
    range = width/8;
    priority = "Heavy";
    price = 100;
  }

  void drawturret(boolean rot)
  {
    pushMatrix();
    translate(pos.x, pos.y);

    //if turret has a target calculate the angle between them
    if (target != null)
    {
      theta = degrees(atan2(target.curr.x+target.source.x-pos.x, target.curr.y+target.source.y-pos.y));
    }

    //point towards target
    //rotate(-radians(theta-90));

    //stroke(turretColour);
    //noFill();
    //strokeWeight(3);
    //ellipse(0,0,turretWidth,turretHeight);
    //triangle(turretWidth/4,0,-turretWidth/4,turretHeight/4,-turretWidth/4,-turretHeight/4);  
    if (rot) {
      rotate(-radians(theta+90));
    }
    imageMode(CENTER);
    image(wraith, 0, 0);


    //if clicked draw range
    if (pos.x > menuWidth && clicked == true)
    {
      stroke(turretColour);
      noFill();
      strokeWeight(1);
      ellipse(0, 0, range*2, range*2);
    } 

    popMatrix();
  }

  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(pos, range);

    if (inRange != null )
    {
      super.choose(inRange);

      if (millis()-timeDamage >= 1000/rateOfFire && target != null && moving == false)  
      {    
        target.takeDamage(damage);
        timeDamage = millis();
        drawShot = true;
      } 

      if (drawShot == true)
      {
        if (sound == true)
        {
          laserCannonSound.play();

          if (laserCannonSound.position() == laserCannonSound.length())
          {
            laserCannonSound.rewind();
          }
        }

        pushMatrix();
        translate(target.source.x, target.source.y);
        strokeWeight(5);
        stroke(255, 0, 0);
        line(pos.x-target.source.x, pos.y-target.source.y, target.curr.x, target.curr.y);
        popMatrix();

        if (millis()-timeDraw > (1000/rateOfFire)/3)
        {
          drawShot = false;
          timeDraw = millis();
        }
      }
    } else
    {
      target = null;
    }
  }
}
