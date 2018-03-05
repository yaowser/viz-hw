abstract class tower
{
   PVector pos;
   float damage;
   float rateOfFire;
   color towerColour;
   float towerWidth;
   float towerHeight;
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
   
   tower()
   {
     pos = new PVector(0,0);
     timeDamage = millis();
     timeDraw = millis();
     drawShot = false;
     preference = 7;
     changeTarget = false;
     target = null;
     clicked = false;
     moving = false;
     placeOk = true;
     towerWidth = width/38;
     towerHeight = width/38;
     upgradeMult = 1;
     upgradePrice = 1000;
     level = 1;
   }
   
   
  void place()
  {
    pos.x = mouseX;
    pos.y = mouseY;
    placeOk = true;
     
    boolean mouse;
     
    if(moving == true)
    {
      mouse = mousePressed; 
      moving = false;
    }
    else
    {
      mouse = !mousePressed; 
    }
     
    if(mouse)
    {
      placing = true;
    }
    else if(selectedTower != null && placing == true)
    {
      if(pos.x - towerWidth/2 < menuWidth)
      {
        placeOk = false;
      }

       
     if(placeOk == true)
     {
       if(!activeTowers.contains(selectedTower))
       {
         activeTowers.add(selectedTower);
         money -= price; 
       }

       placing = false;
       selectedTower = null;
       
     }
     else
     {
       text("Can not place here",width/2,height/2); 
     }
    }   
  }
   
  //choose a target from inRange based on focus
  void choose(ArrayList<enemy> inRange)
   {
     for(int i=0;i<inRange.size();i++)
     {
       if(inRange.contains(target) && target != null)
       {
         changeTarget = false;
         break;
       }
       else
       {
         changeTarget = true;
       }
     }
     
     if(changeTarget == true)
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
            
            for(int i=0;i<inRange.size();i++)
            {
              if(inRange.get(highest).health<inRange.get(i).health)
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
            
            for(int i=0;i<inRange.size();i++)
            {
              if(inRange.get(lowest).health>inRange.get(i).health)
              {
                lowest = i;
              }
            }
            
            target = inRange.get(lowest);
            break;
          }
          case "basic":
          {
            for(int i=0;i<inRange.size();i++)
            {
              if(inRange.get(i) instanceof basic)
              {
                target = inRange.get(i);
                break;
              }
              else
              {
                target = inRange.get(0); 
              }
            }
            break;
          }
          case "heavy":
          {
            for(int i=0;i<inRange.size();i++)
            {
              if(inRange.get(i) instanceof heavy)
              {
                target = inRange.get(i);
                break;
              }
              else
              {
                target = inRange.get(0); 
              }
            }
            break;
          }
          case "fast":
          {
            for(int i=0;i<inRange.size();i++)
            {
              if(inRange.get(i) instanceof fast)
              {
                target = inRange.get(i);
                break;
              }
              else
              {
                target = inRange.get(0); 
              }
            }            
            break;
          }
          case "random":
          {
            int rand = (int)random(0,inRange.size()-1);
            
            target = inRange.get(rand);
            break;
          }
       }
     } 
   }
   
   void isClicked()
   {
     if(mouseX > pos.x - towerWidth/2 && mouseX < pos.x +towerWidth/2 && mouseY > pos.y - towerHeight/2 && mouseY < pos.y + towerHeight/2 && mousePressed)
     {
       clicked = true;

       for(int j=0;j<activeTowers.size();j++)
       {
         if(activeTowers.get(j) != this)
         {
           activeTowers.get(j).clicked = false;
         }
       }
     }
   }
   
   void drawData()
   {
     float border = towerWidth/10;
     float boxHeight = height/3;
     float boxWidth = menuWidth - border*2;
     float boxX = border;
     float boxY = height/2;
     
     textSize(7);
     String d = "Damage: " + (int)damage;
     String rate = String.format("%.2f",rateOfFire);
     String r = "Fire Rate:"+ rate;
     String p = "Focus: " + preferences[preference];
     String ra = "Range: " + int(range);
     String l = "Level: " + level;
     String c = "Cost: " + (int)upgradePrice;
     
     if(level == 5)
     {
       c = "Cost: Maxed";
     }
     
     if(range > width)
     {
       ra = "Range: Unlimited";
     }
     strokeWeight(2);
     noStroke();
     noFill();
     rect(boxX,boxY,boxWidth,boxHeight);
     
     fill(255);
     text(d,boxX+border,boxY+textAscent()*2);
     text(r,boxX+border,boxY+textAscent()*4);
     text(p,boxX+border,boxY+textAscent()*6);
     text(ra,boxX+border,boxY+textAscent()*8);
     text(l,boxX+border,boxY+textAscent()*10);
     text(c,boxX+border,boxY+textAscent()*12);
     
     if(!(this instanceof AOE))
     {
       prefButtons.clear();
       int j = 0;
       
       for(int i=0;i<preferences.length;i++)
       {
         button b = new button();
         if(i<=1)
         {
           b = new button(preferences[i],false,(boxX+border)+((boxWidth/2)-(border*2))*j+(border*j),boxY+(boxHeight/10)*5+border,(boxWidth/2)-border*2,boxHeight/10);
           j++;
         }
         else if(i<=3)
         {
           if(i==2)
           {
             j=0;
           }
           b = new button(preferences[i],false,(boxX+border)+((boxWidth/2)-(border*2))*j+(border*j),boxY+(boxHeight/10)*6+border*2,(boxWidth/2)-border*2,boxHeight/10);
           j++;
         }
         else if(i<=5)
         {
           if(i==4)
           {
             j=0;
           }
           b = new button(preferences[i],false,((boxX+border)+((boxWidth/2)-(border*2))*j)+(border*j),boxY+(boxHeight/10)*7+border*3,(boxWidth/2)-border*2,boxHeight/10);
           j++;
         }
         else if(i<=7)
         {
           if(i==6)
           {
             j=0;
           }
           b = new button(preferences[i],false,((boxX+border)+((boxWidth/2)-(border*2))*j)+(border*j),boxY+(boxHeight/10)*8+border*4,(boxWidth/2)-border*2,boxHeight/10);
           j++;
         }
         prefButtons.add(b);
       }
       
     for(int i=0;i<prefButtons.size();i++)
     {
       prefButtons.get(i).drawButton(); 
       if(prefButtons.get(i).clicked == true)
       {
          for(int k=0;k<preferences.length;k++)
          {
             if(preferences[k] == prefButtons.get(i).label)
             {
                preference = k; 
             }
          }
       }
     }
   }

   button m = new button("Move",false,boxX+boxWidth*0.75-border*2,boxY,boxWidth/4,boxHeight/10);
   m.drawButton();
   
   if(m.clicked == true)
   {
     selectedTower = this;
     moving = true;
     place();
   }
   else if(placing == false)
   {
     moving = false;
   }
   
   button s = new button("Sell",false,boxX+boxWidth*0.75-border*2,boxY+(boxHeight/10)+border,boxWidth/4,boxHeight/10);
   s.drawButton();
   
   if(s.clicked == true)
   {
     sell(); 
   }
   
   button u = new button("Upgrade",false,boxX+border,boxY+(boxHeight/10)*4,(boxWidth/2)-border*2,boxHeight/10);
   u.drawButton();
     
   if(u.clicked == true)
   {
     upgrade();
   }

  }
   
  void sell()
  {
    money += price/2;
    activeTowers.remove(this);
    selectedTower = null;
  }
  
  void upgrade()
  {
    if(money >= upgradePrice && level < 5)
    {
      text("UPGRADE",width/2,height/2);
      upgradeMult *= 1.2;
      money -= upgradePrice;
      price *= upgradeMult;
      damage *= upgradeMult;
      rateOfFire *= upgradeMult;
      upgradePrice *= upgradeMult;
      level++;
    }
    else
    {
      moneyCheck = true; 
    }
  }
}



     
     