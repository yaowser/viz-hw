void screenControl()
{  
  switch(screenIndex)
  {
    case 0://Splash Screen
    {
      if(keyPressed && key == 32)
      {
        //skip animation
        screenIndex = 1;  
      }
      else if(splashOp >=0 && splashOp <255 && splashCheck == false)
      {
        splashOp += 2;
      }
      else if(splashOp > 2)
      {
        splashCheck = true;
        splashOp -= 2;
      }
      else if(splashOp >= 0)
      {
       splashOp -= 2; 
      }
      else
      {
       screenIndex = 1;//go to menu 
      }
      
      drawSplash();
      break;
    }
    case 1://Menu Screen
    {
      menuControl();//in this tab around line 140
      break;
    }
    case 2://Game Screen
    {
      //in this tab around line 200
      if(gameControl() == true)
      {
        screenIndex = 3;
      }
      break;
    }
    case 3://Game over
    {
      //if game is over check if part of high scores
      if(scoreCheck == true)
      {
        Table t3 = loadTable("data/highscores.csv","header");

        int lowest = 0;
            
        //find lowest in table
        for(int i=0;i<t3.getRowCount();i++)
        {
          TableRow row2 = t3.getRow(lowest);
          int s2 = row2.getInt("Score");
          
          TableRow row  = t3.getRow(i);
          int s = row.getInt("Score");

          if(s2>s)
          {
            lowest = i; 
          }
       }
      
       TableRow row = t3.getRow(lowest);
      
       if(row.getInt("Score") < score)
       {
         row.setString("Name",Name);
         row.setInt("Round",currentRound+1);
         row.setInt("Score",score);
         row.setString("Diff",difficulty);
         row.setString("Map",selectedMap);

       }
       
       saveTable(t3,"data/highscores.csv");

       scoreCheck = false;
      }
      
      //in main tab
      drawGameOver();

      if(r.clicked == true)
      {
        resetGame();
        screenIndex = 2; 
      }
      
      if(m.clicked == true)
      {
        resetGame();
        screenIndex = 1; 
      }
      break;
    }
  }
}

//used to reset all elements of the game
void resetGame()
{
  activeturrets.clear();
  activeEnemies.clear();
  enemies.clear();
  basics.clear();
  fasts.clear();
  heavys.clear();
  selectedturret = null;
  limit = 20;
  money = 1000;
  score = 0;
  currentRound = 0;
  roundInitialised = false;
  roundStarted = false;
  roundEnded = false;
  placing = false;
  qCheck = false;
  scoreCheck = true;
  regOver = false;
  overtime = false;
  overtimeMult = 0;
  overtimeRound = 0;
  conCheck = false;
  menuIndex = 4;
  k=0;
  
  for(int i=0;i<menuOptions.size();i++)
  {
    menuOptions.get(i).clicked = false;
    menuOptions.get(i).hover = false;
  }
}

void menuControl()
{
  textFont(gameFont,50);
  //in main tab
  drawMainMenu();
  
  switch(menuIndex)
  {
    case 0://Play - game options
    {
      //in main tab
      drawPlay();
      
      //change difficulty multiplier
      switch(difficulty)
      {
        case "Easy":
        {
          diffMult = 0.5;
          break;
        }
        case "Normal":
        {
          diffMult = 1;
          break;
        }
        case "Hard":
        {
          diffMult = 1.5;
          break;
        } 
      }
            
      //If Player clicks go, start game
      if(g.clicked)
      {
        screenIndex = 2; 
      }
      break;
    }
    case 1://High Scores 
    {
      //in main tab
      drawHigh();
      break;
    }
    case 2://Options
    {
      //in main tab
      drawOptions();
      break;
    }
    case 3://quit
    {
      exit();
    }
    case 4://Title
    {
      //in main tab
      drawTitle();
    }
  }
}

boolean gameControl()
{
  if(limit == 0)
  {
    return true;
  }
  
  if(roundInitialised == false)
  {
    roundData();
    roundInitialised = true;
  }
  
  //in main tab
  drawMap();
  drawActiveturrets();
  
  if(roundStarted == true && roundInitialised == true && roundEnded == false)
  {
    drawEnemies();
    //in this tab
    removeDeadEnemy();
    turretFire();
  }
  
  //in main tab
  drawturretMenu();
  
  //in this tab
  turretData();
  
  turretPlace();
  roundControl();
  return false;
}

void removeDeadEnemy()
{
  for(int i=0;i<activeEnemies.size();i++)
  {
    enemy e = activeEnemies.get(i);
    
    if(e.deadCheck() == true)
    {
      activeEnemies.remove(i); 
      enemyTotal--;
    }
  }
}

void turretFire()
{
  //have all active turrets fire
  for(int i=0;i<activeturrets.size();i++)
  {
    turret t = activeturrets.get(i); 
    
    if(t instanceof cannon)
    {
      cannon c = (cannon)t;
      c.fire(); 
    }
    else if(t instanceof AOE)
    {
      AOE a = (AOE)t;
      a.fire();
    }
    else if(t instanceof sniper)
    {
      sniper s = (sniper)t;
      s.fire();
    }
    else if(t instanceof rocket)
    {
      rocket r = (rocket)t;
      r.fire();
    }
  }
}

//drawing individual turrets data
void turretData()
{
  for(int i=0;i<activeturrets.size();i++)
  {
    activeturrets.get(i).isClicked(); 
   
    if(activeturrets.get(i).clicked == true)
    {
      activeturrets.get(i).drawData();
    } 
  }
}

//for checking which enemies are in range and return an arraylist containing them
ArrayList<enemy> rangeCheck(PVector pos, float range)
{
  ArrayList <enemy> inRange = new ArrayList<enemy>();
  for(int i=0;i<activeEnemies.size();i++)
  {
    enemy e = activeEnemies.get(i);
    float distance = dist(pos.x-e.source.x,pos.y-e.source.y,e.curr.x,e.curr.y);
   
    if(distance <= range)
    {
       inRange.add(e);
    }
  }
  
  if(inRange.size() > 0)
  {
    return inRange;
  }
  else
  {
    return null;
  }
}

void roundControl()//to Major Tom
{
  drawRoundUI();
  if(s.clicked == true)
  {
    roundStarted = true;
    roundEnded = false;
  }
  
  if(q.clicked == true || qCheck == true)
  {
    drawQCheck();
    
    if(yes.clicked == true)
    {
      resetGame();
      screenIndex = 1;
    }
    else if(no.clicked == true)
    {
      qCheck = false;
    }
    else
    {
      qCheck = true;
    }
  }
  
  if(enemyTotal == 0 || conCheck == true)
  {
    roundEnded = true; 
    roundStarted = false;
    
    for(int i=0;i<activeturrets.size();i++)
    {
      turret t = activeturrets.get(i);
      
      if(t instanceof AOE)
      {
        AOE a = (AOE)t;
        a.pulseCheck = false; 
        a.drawShot = false;
        a.pulse = a.turretWidth/2;
      }
      else if(t instanceof rocket)
      {
        rocket r = (rocket)t;
        r.pulseCheck2 = false;
        r.drawShot = false;
        r.pulse = 0;
        r.drawBlast = false;
      }
    }
    
    enemies.clear();
    activeEnemies.clear();
    k=0;
    
    if(regOver == true)
    {
      drawConCheck(); 
    
      if(con.clicked == true)
      {
        overtime = true; 
        overtimeMult = 1;
        regOver = false;
        conCheck = false;
      }
      
      if(fin.clicked == true)
      {
        resetGame();
        screenIndex = 1;
      }
    }
    
    if(conCheck == false)
    {
      if(overtime == true)
      {
        overtimeRound++; 
      }
      else if(currentRound+1 == 21)
      {
        regOver = true;   
        conCheck = true;
      }
      else if(currentRound+1 < 20)
      {
        currentRound++;   
      }
      
      money+=300;
      score+=500;
    }
    roundData();
  }
}

void turretPlace()
{
  for(int i=0;i<turretMenu.size();i++)
  {
    PVector pos = turretMenu.get(i).pos;
    float tWidth = turretMenu.get(i).turretWidth;
    float tHeight = turretMenu.get(i).turretHeight;
    
    if(mouseX > pos.x - tWidth/2 && mouseX < pos.x + tWidth/2 && mouseY > pos.y - tHeight/2 && mouseY < pos.y+tHeight/2 && mousePressed)
    {
      if(turretMenu.get(i) instanceof cannon && money >= turretMenu.get(i).price)
      {
        selectedturret = new cannon();
        placing = true;
        break;
      }
      else if(turretMenu.get(i) instanceof AOE && money >= turretMenu.get(i).price)
      {
        selectedturret = new AOE();
        placing = true;
        break;
      }
      else if(turretMenu.get(i) instanceof sniper && money >= turretMenu.get(i).price)
      {
        selectedturret = new sniper();
        placing = true;
        break;
      }
      else if(turretMenu.get(i) instanceof rocket && money >= turretMenu.get(i).price)
      {
        selectedturret = new rocket();
        placing = true;
        break;
      }
      else
      {
        moneyCheck = true; 
      }
    }
  }
    
  if(placing == true && selectedturret != null)
  {
      selectedturret.place();
      drawSelectedturret();
  }
}
