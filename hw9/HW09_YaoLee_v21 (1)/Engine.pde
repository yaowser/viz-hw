// Turret Game Engine

class Engine {

  PApplet pa = new PApplet();

  Engine(PApplet pa) {
    this.pa = pa;
    //in dataInitialisation tab
    dataInit();

    imageMode(CENTER);

    noStroke();

    nebula = loadShader("nebula.glsl");
    nebula.set("resolution", float(width), float(height));

    //video used used for portals on map
    eventHorizon.loop();
  }

  void display() {
    background(0);
    nebula.set("time", millis() / 500.0);  
    shader(nebula); 
    rect(0, 0, width, height);
    resetShader();
    //in controlFunctions tab
    screenControl();
  }
}



//for playing video
void movieEvent(Movie m)  
{
  m.read();
}

//draw splash screen
void drawSplash()
{
  textFont(splashFont, 40);

  String splashVal = "Press Space to Continue";
  float splashX = ((width/2)-(textWidth(splashVal)/2));
  float splashY = ((height/2)+(textAscent()/2)); 

  fill(255, 255, 255, splashOp);
  text(splashVal, splashX, splashY);
}

//draw main menu
void drawMainMenu()
{
  for (int i=0; i<menuOptions.size(); i++)
  {
    menuOptions.get(i).mouseDet();
    menuOptions.get(i).drawOption();

    if (menuOptions.get(i).clicked == true)
    {
      menuIndex = i; 
      selectedMenu = menuOptions.get(i);
    }

    if (menuOptions.get(i).hover == true)
    {
      titleCheck = true;
    }
  }

  textSize(15);

  //take user input for name for highscores
  String type = "Insert Name: ";
  fill(255);
  text(type, (width/2)-textWidth(type), height-100);
  text(Name, (width/2)-textWidth(Name)/2, height-100);

  if (keyPressed)
  {
    if (key == 8) 
    {
      if (Name.length() > 0) 
      {
        Name = Name.substring(0, Name.length()-1);
      }
    } else if (key == 127)
    {
      Name = "";
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && Name.length() < 4) 
    {
      Name = Name + key;
    }
    delay(100);
  }
}

//draw the main menu play option
void drawPlay()
{
  //in this tab around line 300
  drawMenuBox();

  float border = menuBoxWidth/20;
  float bottom = 0;  
  goWidth = menuBoxWidth/6;
  goHeight = menuBoxHeight/7;

  goX = startX + menuBoxWidth - goWidth/2;
  goY = menuBoxY + menuBoxHeight - goHeight-border;

  ArrayList<button> mapChoice = new ArrayList<button>();
  fill(255);

  //drawing mini version of map and selecting
  for (int i=0; i<maps.size(); i++)
  {
    button b = new button(maps.get(i).name, false, menuLineX+startX+border, menuBoxY+(goHeight*i)+border+(border*i), goWidth, goHeight);
    mapChoice.add(b);

    if (i == maps.size()-1)
    {
      bottom = menuBoxY+(goHeight*i)+border+(border*i);
    }

    if (selectedMap == maps.get(i).name)
    {
      for (int j=0; j<maps.get(i).points.size()-1; j++)
      {
        float x1 = map(map(maps.get(i).points.get(j).x, menuWidth+100, width-100, 0, 20), 0, 20, menuLineX+startX+goWidth*2, menuLineX+menuBoxWidth+startX-border);
        float y1 = map(map(maps.get(i).points.get(j).y, 100, height-156, 0, 20), 0, 20, menuBoxY+border, menuBoxHeight);
        float x2 = map(map(maps.get(i).points.get(j+1).x, menuWidth+100, width-100, 0, 20), 0, 20, menuLineX+startX+goWidth*2, menuLineX+menuBoxWidth+startX-border);
        float y2 = map(map(maps.get(i).points.get(j+1).y, 100, height-156, 0, 20), 0, 20, menuBoxY+border, menuBoxHeight);

        line(x1, y1, x2, y2);
      }
    }
  }

  for (int i=0; i<mapChoice.size(); i++)
  {
    mapChoice.get(i).drawButton(); 

    if (mapChoice.get(i).clicked == true)
    {
      selectedMap = mapChoice.get(i).label;
    }
  }

  //selecting difficulty
  String[] diff = {"Easy", "Normal", "Hard"};
  for (int i=0; i<diff.length; i++)
  {
    button b = new button(diff[i], false, menuLineX+startX+((border/2)*(i+3))+goWidth*(i+1), bottom, goWidth, goHeight);

    b.drawButton();

    if (b.clicked == true)
    {
      difficulty = diff[i];
    }
  }
  textSize(9);
  text(difficulty, goX-textWidth(difficulty)/2, bottom-goHeight);

  g = new button("Go", false, goX+border, bottom, goWidth, goHeight);
  g.drawButton();
}

//draw main menu highscores option
void drawHigh()
{
  float border = menuBoxWidth/20;
  float sectionWidth = menuBoxWidth/6;

  //in this tab around line 300
  drawMenuBox(); 
  textSize(10);

  //load scores from file, put in arraylist, sort display
  ArrayList<TableRow> scores = new ArrayList<TableRow>();

  Table t3 = loadTable("data/highscores.csv", "header");

  for (int i=0; i<t3.getRowCount(); i++)
  {
    scores.add(t3.getRow(i));
  }

  for (int i=0; i<scores.size(); i++)
  {
    for (int j=1; j<scores.size()-i; j++)
    {
      int score = scores.get(j-1).getInt("Score");
      int score1 = scores.get(j).getInt("Score");

      if (score > score1)
      {
        TableRow temp = scores.get(j-1);
        scores.set(j-1, scores.get(j));
        scores.set(j, temp);
      }
    }
  }

  Collections.reverse(scores);

  fill(255);
  for (int i=0; i<scores.size(); i++)
  {
    TableRow row = scores.get(i);
    text(row.getString("Name"), menuLineX+startX+border, menuBoxY+border*2+textAscent()*3*i);
    text(row.getInt("Round"), menuLineX+startX+border+sectionWidth, menuBoxY+border*2+textAscent()*3*i);
    text(row.getInt("Score"), menuLineX+startX+border+sectionWidth*1.5, menuBoxY+border*2+textAscent()*3*i);
    text(row.getString("Diff"), menuLineX+startX+border+sectionWidth*3, menuBoxY+border*2+textAscent()*3*i);
    text(row.getString("Map"), menuLineX+startX+border+sectionWidth*4.5, menuBoxY+border*2+textAscent()*3*i);
  }
}

//draw main menu options option
void drawOptions()
{
  //in this tab around line 300
  drawMenuBox(); 
  String s;

  //turn sound on or off
  if (sound == true)
  {
    s = "Sound On";
  } else
  {
    s = "Sound Off";
  }

  float buttonWidth = menuBoxWidth/5;
  float buttonHeight = menuBoxHeight/5;

  text(s, (menuLineX+startX+(menuBoxWidth/2))-textWidth(s)/2, menuBoxY+(menuBoxHeight/2));

  button on = new button("On", false, menuLineX+startX+(menuBoxWidth/2)-buttonWidth*1.25, menuBoxY+menuBoxHeight-buttonHeight*1.25, buttonWidth, buttonHeight);
  on.drawButton();

  button off = new button("Off", false, menuLineX+startX+(menuBoxWidth/2)+buttonWidth*0.25, menuBoxY+menuBoxHeight-buttonHeight*1.25, buttonWidth, buttonHeight);
  off.drawButton();

  if (on.clicked == true)
  {
    sound = true;
  }

  if (off.clicked == true)
  {
    sound = false;
  }
}

//draw the box that holds all the main menu options
void drawMenuBox()
{
  startX = width/3;

  float endX = width/20;
  float lineY = selectedMenu.yVal - textAscent();

  pushMatrix();
  translate(startX, 0);

  menuLineX = lerp(menuLineX, endX, 0.1);

  menuBoxY = lerp(menuBoxY, lineY-menuBoxHeight/2, 0.1);
  menuBoxWidth = lerp(menuBoxWidth, width/3, 0.1);
  menuBoxHeight = lerp(menuBoxHeight, height/3, 0.1);

  strokeWeight(1);
  stroke(255);
  line(0, lineY, menuLineX, lineY);

  noFill();
  rect(menuLineX, menuBoxY, menuBoxWidth, menuBoxHeight);

  popMatrix();
}

//draw the game title when no option is selected
void drawTitle()
{
  textFont(splashFont, 100);
  String name1 = "Guardians";
  String name2 = "Of The";
  String name3 = "Galaxy";
  float xVal = (width*0.60);
  float yVal = height*0.30;

  fill(255);
  text(name1, xVal-(textWidth(name1)/2), yVal);
  text(name2, xVal-(textWidth(name2)/2), yVal+(textAscent()+textDescent())*1.1);
  text(name3, xVal-(textWidth(name3)/2), yVal+(textAscent()+textDescent())*2.2);
}

//draw the map in game
void drawMap()
{
  for (int i=0; i<maps.size(); i++)
  {
    if (maps.get(i).name.equals(selectedMap)) 
    {
      maps.get(i).drawMap();
    }
  }
}

//draw turrets in game
void drawActiveturrets()
{
  for (int i=0; i<activeturrets.size(); i++)
  {
    if (activeturrets.get(i) instanceof cannon)
    {
      cannon c = (cannon)activeturrets.get(i);
      c.drawturret(true);
    } else if (activeturrets.get(i) instanceof AOE)
    {
      AOE a = (AOE)activeturrets.get(i);
      a.drawturret();
    } else if (activeturrets.get(i) instanceof sniper)
    {
      sniper s = (sniper)activeturrets.get(i);
      s.drawturret(true);
    } else if (activeturrets.get(i) instanceof rocket)
    {
      rocket r = (rocket)activeturrets.get(i);
      r.drawturret(true);
    }
  }
}

//draw enemies in game
void drawEnemies()
{
  noFill();
  strokeWeight(5);

  if (k<enemies.size() && frameCount % 35 == 0)
  {
    enemy e = enemies.get(k);
    activeEnemies.add(e);
    k++;
  }

  for (int i=0; i<activeEnemies.size(); i++)
  {
    enemy e = activeEnemies.get(i);

    if (e instanceof EnemyBlockies)
    {
      EnemyBlockies b = (EnemyBlockies)activeEnemies.get(i); 
      b.drawEnemy();
    } else if (e instanceof EnemyRay)
    {
      EnemyRay h = (EnemyRay)activeEnemies.get(i);
      h.drawEnemy();
    } else if (e instanceof EnemySpider)
    {
      EnemySpider f = (EnemySpider)activeEnemies.get(i);
      f.drawEnemy();
    } else if (e instanceof EnemyKinArt)
    {
      EnemyKinArt b = (EnemyKinArt)activeEnemies.get(i);
      b.drawEnemy();
    }

    e.moveEnemy();
  }
}

//draw the menu that holds the turrets for purchasing
void drawturretMenu()
{
  String l = "Laser Cannon";
  String p = "Pulser";
  String sn = "Sniper";
  String rl = "Launcher";
  fill(0);
  stroke(255);
  strokeWeight(3);

  rect(0, 0, menuWidth, height);

  textSize(10);
  fill(255);
  if (moneyCheck == true)
  {
    fill(255, 0, 0);
    moneyCheck = false;
  }

  text("Money: " + money, 5, textAscent()*2+5);
  fill(255);
  if (limit <= 5)
  {
    fill(255, 0, 0);
  }

  text("Health: " + limit, 5, textAscent()*4+5);

  fill(255);
  text("Score: " + score, 5, textAscent()*6+5);


  noFill();
  textSize(7);
  for (int i=0; i<turretMenu.size(); i++)
  {
    if (turretMenu.get(i) instanceof cannon)
    {
      cannon c = (cannon) turretMenu.get(i);
      c.pos.x = menuWidth/4;
      c.pos.y = height*.12;

      c.drawturret(false); 

      fill(255);
      text(l, c.pos.x+textWidth(l)*0.3, c.pos.y-c.turretHeight*0.2);
      text("Price: "+c.price, c.pos.x+textWidth(l)*0.3, c.pos.y-(c.turretHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(c.damage*c.rateOfFire), c.pos.x+textWidth(l)*0.3, c.pos.y-(c.turretHeight*0.2)+textAscent()*4);
    }

    if (turretMenu.get(i) instanceof AOE)
    {
      AOE a = (AOE) turretMenu.get(i);
      a.pos.x = menuWidth/4;
      a.pos.y = height*0.22;

      a.drawturret(); 


      text(p, a.pos.x+textWidth(l)*0.3, a.pos.y-a.turretHeight*0.2);
      text("Price: "+a.price, a.pos.x+textWidth(l)*0.3, a.pos.y-(a.turretHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(a.damage*a.rateOfFire)+"(AOE)", a.pos.x+textWidth(l)*0.3, a.pos.y-(a.turretHeight*0.2)+textAscent()*4);
    }

    if (turretMenu.get(i) instanceof sniper)
    {
      sniper s = (sniper) turretMenu.get(i);
      s.pos.x = menuWidth/4;
      s.pos.y = height*0.32;
      fill(255);
      text(sn, s.pos.x+textWidth(l)*0.3, s.pos.y-s.turretHeight*0.2);
      text("Price: "+s.price, s.pos.x+textWidth(l)*0.3, s.pos.y-(s.turretHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(s.damage*s.rateOfFire), s.pos.x+textWidth(l)*0.3, s.pos.y-(s.turretHeight*0.2)+textAscent()*4);

      s.drawturret(false);
    }

    if (turretMenu.get(i) instanceof rocket)
    {
      rocket r = (rocket) turretMenu.get(i);
      r.pos.x = menuWidth/4;
      r.pos.y = height*0.42;
      text(rl, r.pos.x+textWidth(l)*0.3, r.pos.y-r.turretHeight*0.2);
      text("Price: "+r.price, r.pos.x+textWidth(l)*0.3, r.pos.y-(r.turretHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(r.damage*r.rateOfFire)+" (AOE)", r.pos.x+textWidth(l)*0.3, r.pos.y-(r.turretHeight*0.2)+textAscent()*4);

      r.drawturret(false);
    }
  }
}

//draw the ui used in controlling the round and displaying round data
void drawRoundUI()
{
  textFont(gameFont, 10);
  String r;
  if (overtime == false)
  {
    r = ("Round:"+(currentRound+1)+"/"+"21");
  } else
  {
    r = ("Round:"+(currentRound+1+overtimeRound));
  }
  String e = ("Remaining Enemies:"+enemyTotal);
  float border = width/80;
  fill(0);
  stroke(255);
  strokeWeight(3);

  s = new button("Start", false, roundStartX, roundStartY, roundStartWidth, roundStartHeight);
  s.drawButton();

  q = new button("Quit", false, width - roundStartWidth - border, border, roundStartWidth, roundStartHeight); 
  q.drawButton();

  fill(255);
  textSize(12);
  text(r, (menuWidth/2)-(textWidth(r)/2), roundStartY-textAscent());

  textSize(10);
  text(e, menuWidth+5, height);

  textSize(10);
  text(rounds.get(currentRound).toString(), menuWidth+5, height-(textAscent()*7));
}

//draw the turret you are currently placing
void drawSelectedturret()
{
  if (selectedturret instanceof cannon)
  {
    cannon c = (cannon)selectedturret;
    c.drawturret(false);
  } else if (selectedturret instanceof AOE)
  {
    AOE a = (AOE)selectedturret;
    a.drawturret();
  } else if ( selectedturret instanceof sniper)
  {
    sniper s = (sniper)selectedturret;
    s.drawturret(false);
  } else if (selectedturret instanceof rocket)
  {
    rocket r = (rocket)selectedturret;
    r.drawturret(false);
  }
}

//draw the quit menu
void drawQCheck()
{ 
  float checkWidth = width/3;
  float checkHeight = height/3;
  float checkX = width/2 - checkWidth/2;
  float checkY = height/2 - checkHeight/2;
  String are = "Are you sure?";
  String all = "All progress will be lost";

  stroke(255);
  fill(0);
  rect(checkX, checkY, checkWidth, checkHeight);

  fill(255);
  textSize(15);
  text(are, checkX+(checkWidth/2)-textWidth(are)/2, checkY+checkHeight*.25);

  textSize(10);
  text(all, checkX+(checkWidth/2)-textWidth(all)/2, checkY+checkHeight*.5);

  yes = new button("Yes", false, checkX+checkWidth/4-5, checkY+checkHeight*.75, checkWidth/4, checkHeight/5);
  yes.drawButton();

  no = new button("No", false, checkX+checkWidth/2+5, checkY+checkHeight*.75, checkWidth/4, checkHeight/5);
  no.drawButton();
}

//draw the continue playing menu(for endless mode)
void drawConCheck()
{
  float checkWidth = width/3;
  float checkHeight = height/3;
  float checkX = width/2 - checkWidth/2;
  float checkY = height/2 - checkHeight/2;
  String grat = "Congratulations";
  String beat = "You have beaten the game";
  String sc = "Score = " + score;
  String diff = "Difficuly: " +difficulty;
  String cont = "Do you wish to continue?";

  stroke(255);
  fill(0);
  rect(checkX, checkY, checkWidth, checkHeight);

  fill(255);
  textSize(15);
  text(grat, checkX+(checkWidth/2)-textWidth(grat)/2, checkY+checkHeight*.25);

  textSize(10);
  text(beat, checkX+(checkWidth/2)-textWidth(beat)/2, checkY+checkHeight*.35);

  text(sc, checkX+(checkWidth/2)-textWidth(sc)/2, checkY+checkHeight*.45);
  text(diff, checkX+(checkWidth/2)-textWidth(diff)/2, checkY+checkHeight*.55);
  text(cont, checkX+(checkWidth/2)-textWidth(cont)/2, checkY+checkHeight*.65);

  con = new button("Yes", false, checkX+checkWidth/4-5, checkY+checkHeight*.75, checkWidth/4, checkHeight/5);
  con.drawButton();

  fin = new button("No", false, checkX+checkWidth/2+5, checkY+checkHeight*.75, checkWidth/4, checkHeight/5);
  fin.drawButton();
}

//draw the game over screen
void drawGameOver()
{
  float overWidth = width/3;
  float overHeight = height/3;
  float overX = (width/2)-overWidth/2;
  float overY = (height/2)-overHeight/2;
  String g = "Game Over";
  String s = "Score: " + score;

  fill(0);
  stroke(255);
  rect(overX, overY, overWidth, overHeight);

  textSize(25);
  fill(255);
  text(g, overX+(overWidth/2)-textWidth(g)/2, overY+(overHeight*0.40));

  textSize(15);
  text(s, overX+(overWidth/2)-textWidth(s)/2, overY+(overHeight*.55));

  r = new button("Retry", false, overX+(overWidth*.15)-5, overY+(overHeight*.65), overWidth/3, overHeight/5);
  r.drawButton();

  m = new button("Menu", false, overX+(overWidth*.15)+(overWidth/3)+5, overY+overHeight*.65, overWidth/3, overHeight/5);
  m.drawButton();
}


void screenControl()
{  
  switch(screenIndex)
  {
  case 0://Splash Screen
    {
      if (keyPressed && key == 32)
      {
        //skip animation
        screenIndex = 1;
      } else if (splashOp >=0 && splashOp <255 && splashCheck == false)
      {
        splashOp += 2;
      } else if (splashOp > 2)
      {
        splashCheck = true;
        splashOp -= 2;
      } else if (splashOp >= 0)
      {
        splashOp -= 2;
      } else
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
      if (gameControl() == true)
      {
        screenIndex = 3;
      }
      break;
    }
  case 3://Game over
    {
      //if game is over check if part of high scores
      if (scoreCheck == true)
      {
        Table t3 = loadTable("data/highscores.csv", "header");

        int lowest = 0;

        //find lowest in table
        for (int i=0; i<t3.getRowCount(); i++)
        {
          TableRow row2 = t3.getRow(lowest);
          int s2 = row2.getInt("Score");

          TableRow row  = t3.getRow(i);
          int s = row.getInt("Score");

          if (s2>s)
          {
            lowest = i;
          }
        }

        TableRow row = t3.getRow(lowest);

        if (row.getInt("Score") < score)
        {
          row.setString("Name", Name);
          row.setInt("Round", currentRound+1);
          row.setInt("Score", score);
          row.setString("Diff", difficulty);
          row.setString("Map", selectedMap);
        }

        saveTable(t3, "data/highscores.csv");

        scoreCheck = false;
      }

      //in main tab
      drawGameOver();

      if (r.clicked == true)
      {
        resetGame();
        screenIndex = 2;
      }

      if (m.clicked == true)
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

  for (int i=0; i<menuOptions.size(); i++)
  {
    menuOptions.get(i).clicked = false;
    menuOptions.get(i).hover = false;
  }
}

void menuControl()
{
  textFont(gameFont, 50);
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
      if (g.clicked)
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
  if (limit == 0)
  {
    return true;
  }

  if (roundInitialised == false)
  {
    roundData();
    roundInitialised = true;
  }

  //in main tab
  drawMap();
  drawActiveturrets();

  if (roundStarted == true && roundInitialised == true && roundEnded == false)
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
  for (int i=0; i<activeEnemies.size(); i++)
  {
    enemy e = activeEnemies.get(i);

    if (e.deadCheck() == true)
    {
      activeEnemies.remove(i); 
      enemyTotal--;
    }
  }
}

void turretFire()
{
  //have all active turrets fire
  for (int i=0; i<activeturrets.size(); i++)
  {
    turret t = activeturrets.get(i); 

    if (t instanceof cannon)
    {
      cannon c = (cannon)t;
      c.fire();
    } else if (t instanceof AOE)
    {
      AOE a = (AOE)t;
      a.fire();
    } else if (t instanceof sniper)
    {
      sniper s = (sniper)t;
      s.fire();
    } else if (t instanceof rocket)
    {
      rocket r = (rocket)t;
      r.fire();
    }
  }
}

//drawing individual turrets data
void turretData()
{
  for (int i=0; i<activeturrets.size(); i++)
  {
    activeturrets.get(i).isClicked(); 

    if (activeturrets.get(i).clicked == true)
    {
      activeturrets.get(i).drawData();
    }
  }
}

//for checking which enemies are in range and return an arraylist containing them
ArrayList<enemy> rangeCheck(PVector pos, float range)
{
  ArrayList <enemy> inRange = new ArrayList<enemy>();
  for (int i=0; i<activeEnemies.size(); i++)
  {
    enemy e = activeEnemies.get(i);
    float distance = dist(pos.x-e.source.x, pos.y-e.source.y, e.curr.x, e.curr.y);

    if (distance <= range)
    {
      inRange.add(e);
    }
  }

  if (inRange.size() > 0)
  {
    return inRange;
  } else
  {
    return null;
  }
}

void roundControl()//to Major Tom
{
  drawRoundUI();
  if (s.clicked == true)
  {
    roundStarted = true;
    roundEnded = false;
  }

  if (q.clicked == true || qCheck == true)
  {
    drawQCheck();

    if (yes.clicked == true)
    {
      resetGame();
      screenIndex = 1;
    } else if (no.clicked == true)
    {
      qCheck = false;
    } else
    {
      qCheck = true;
    }
  }

  if (enemyTotal == 0 || conCheck == true)
  {
    roundEnded = true; 
    roundStarted = false;

    for (int i=0; i<activeturrets.size(); i++)
    {
      turret t = activeturrets.get(i);

      if (t instanceof AOE)
      {
        AOE a = (AOE)t;
        a.pulseCheck = false; 
        a.drawShot = false;
        a.pulse = a.turretWidth/2;
      } else if (t instanceof rocket)
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

    if (regOver == true)
    {
      drawConCheck(); 

      if (con.clicked == true)
      {
        overtime = true; 
        overtimeMult = 1;
        regOver = false;
        conCheck = false;
      }

      if (fin.clicked == true)
      {
        resetGame();
        screenIndex = 1;
      }
    }

    if (conCheck == false)
    {
      if (overtime == true)
      {
        overtimeRound++;
      } else if (currentRound+1 == 21)
      {
        regOver = true;   
        conCheck = true;
      } else if (currentRound+1 < 20)
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
  for (int i=0; i<turretMenu.size(); i++)
  {
    PVector pos = turretMenu.get(i).pos;
    float tWidth = turretMenu.get(i).turretWidth;
    float tHeight = turretMenu.get(i).turretHeight;

    if (mouseX > pos.x - tWidth/2 && mouseX < pos.x + tWidth/2 && mouseY > pos.y - tHeight/2 && mouseY < pos.y+tHeight/2 && mousePressed)
    {
      if (turretMenu.get(i) instanceof cannon && money >= turretMenu.get(i).price)
      {
        selectedturret = new cannon();
        placing = true;
        break;
      } else if (turretMenu.get(i) instanceof AOE && money >= turretMenu.get(i).price)
      {
        selectedturret = new AOE();
        placing = true;
        break;
      } else if (turretMenu.get(i) instanceof sniper && money >= turretMenu.get(i).price)
      {
        selectedturret = new sniper();
        placing = true;
        break;
      } else if (turretMenu.get(i) instanceof rocket && money >= turretMenu.get(i).price)
      {
        selectedturret = new rocket();
        placing = true;
        break;
      } else
      {
        moneyCheck = true;
      }
    }
  }

  if (placing == true && selectedturret != null)
  {
    selectedturret.place();
    drawSelectedturret();
  }
}


void keyPressed() {
  next = 1;
}


class round
{
  float number;
  float block;
  float ray;
  float spider;
  float boss;

  round(TableRow row)
  {
    number = row.getFloat("round");
    block = row.getFloat("basic");
    ray = row.getFloat("heavy");
    spider = row.getFloat("fast");
    boss = row.getFloat("boss");
  }

  String toString()
  {
    return "Block : " + (int)block  + "\n" +
      "Ray   : " + (int)ray  + "\n" +
      "Spider:  " + (int)spider   + "\n" +
      "Boss  :  " + (int)boss   + "\n";
  }
}



class menuOpt
{
  String value;
  float xVal;
  float yVal;
  boolean clicked;
  boolean hover;

  menuOpt(String value, float xVal, float yVal)
  {
    this.value = value;
    this.xVal = xVal;
    this.yVal = yVal;
    this.clicked = false;
    this.hover = false;
  }

  menuOpt()
  {
    this("default", 0, 0);
  }

  void drawOption()
  {
    if (hover == true)
    {
      fill(0, 0, 255);
    } else
    {
      fill(255);
    }

    if (clicked == true)
    {
      fill(255, 0, 0);
    }

    textFont(gameFont, 20);
    text(value, xVal, yVal);
  }

  void mouseDet()
  {
    if (mouseX>xVal && mouseX<xVal+textWidth(value) && mouseY<yVal && mouseY>yVal-(textAscent()*2))
    {
      hover = true;
      if (mousePressed)
      {
        if (clicked == false)
        {
          menuLineX = 0; 
          menuBoxY = 0;
          menuBoxWidth = 0;
          menuBoxHeight = 0;
        }

        clicked = true; 

        for (int i=0; i<menuOptions.size(); i++)
        {
          if (menuOptions.get(i).value != this.value)
          {
            menuOptions.get(i).clicked = false;
          }
        }
      }
    } else
    {
      hover = false;
    }
  }
}


class map
{
  String name;
  ArrayList<PVector> points = new ArrayList<PVector>();

  map()
  {
    this.name = "Default";
  }

  map(TableRow row)
  {
    this.name = row.getString("Name");
    float column = row.getColumnCount();

    for (int i=1; i<column; i+=2)
    { 
      if (!row.getString(i).equals("21"))
      {
        float x = map(Float.parseFloat(row.getString(i)), 0, 20, menuWidth+100, width-100);
        float y = map(Float.parseFloat(row.getString(i+1)), 0, 20, 100, height-156);

        PVector p = new PVector(x, y);
        points.add(p);
      }
    }
  }

  void drawMap()
  {
    for (int i=0; i<points.size(); i++)
    {
      float x1 = points.get(i).x;
      float y1 = points.get(i).y;
      float x2 = -1;
      float y2 = -1;

      if (i+1 < points.size())
      {
        x2 = points.get(i+1).x;
        y2 = points.get(i+1).y;
      }

      strokeWeight(1);
      stroke(255);

      if (i==0)
      {
        //noFill();
        //strokeWeight(5); 
        //stroke(255);
        image(eventHorizon, x1, y1, pathWidth*2, pathWidth*2);
        //ellipse(x1,y1,pathWidth,pathWidth*2);
      }

      if (i==points.size()-2)
      {
        //noFill();
        //strokeWeight(5);
        //stroke(255);
        image(eventHorizon, x2, y2, pathWidth*2, pathWidth*2);
        //ellipse(x2,y2,pathWidth,pathWidth*2);
      }

      if (x2 != -1 && y2 != -1)
      {
        noStroke();
        fill(0, 150);
        quad(x1, y1-pathWidth/2, x2, y2-pathWidth/2, x2, y2+pathWidth/2, x1, y1+pathWidth/2);
      }
    }
  }
}


class button
{
  String label;
  boolean clicked;
  PVector pos;
  float buttonWidth;
  float buttonHeight;

  button()
  {
    label = "Default";
    clicked = false;
    pos = new PVector(0, 0);
    buttonWidth = 0;
    buttonHeight = 0;
  }

  button(String label, boolean clicked, float x, float y, float buttonWidth, float buttonHeight)//Assigning values
  {
    this.label = label;
    this.clicked = clicked;
    pos = new PVector(x, y);
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
  }

  //used to draw all buttons
  void drawButton()
  { 
    noFill();
    stroke(255);

    textSize(buttonHeight/4);

    //check if clicked before drawing
    isClicked();

    //if clicked reduce size
    if (clicked == true)
    {
      buttonWidth = buttonWidth*0.95;
      buttonHeight = buttonHeight*0.95;
      pos.x = pos.x +(buttonWidth*0.025);
      pos.y = pos.y +(buttonHeight*0.025);
      textSize((buttonHeight/4)*0.95);
    }

    strokeWeight(2);
    rect(pos.x, pos.y, buttonWidth, buttonHeight);

    fill(255);

    text(label, (pos.x+(buttonWidth/2))-(textWidth(this.label)/2), pos.y+buttonHeight*.75);
  }

  void isClicked()//if clicked change appearance
  {  
    if (mouseX>pos.x && mouseX<(pos.x+buttonWidth) && mouseY>pos.y && mouseY<pos.y+buttonHeight)
    { 
      if (mousePressed)
      {
        clicked = true;
      } else
      {
        clicked = false;
      }
    }
  }

  String toString()
  {
    return label + "\t" + clicked;
  }
}

void dataInit()
{
  //sound
  minim = new Minim(this);

  laserCannonSound = minim.loadFile("LaserCannon.wav");
  AOESound = minim.loadFile("AOE1.wav");
  sniperSound = minim.loadFile("Sniper.wav");
  launcherSound = minim.loadFile("Launcher.wav");
  sound = true;
  scoreCheck = true;

  //stats
  money = 500;
  score = 0;
  Name = "";
  moneyCheck = false;

  regOver = false;
  overtime = false;
  conCheck = false;
  overtimeMult = 0;

  //game options
  difficulty = "Normal";
  diffMult = 1;
  selectedMap = "Line";

  //Fonts
  //splashFont = createFont("spektakel.otf", 200);
  gameFont = createFont("pixel1.otf", 200);
  splashFont = createFont("Malgun Gothic Bold", 200);


  eventHorizon = new Movie(this, "portal.mp4");

  //Global Variables Initialisation
  screenIndex = 0;
  menuIndex = 4; 
  k=0;

  //Splash screen
  splashOp = 0;
  splashCheck = titleCheck = false;

  //In game menu
  menuWidth = width/6;
  turretMenu = new ArrayList<turret>();

  //turret preference
  prefButtons = new ArrayList<button>();


  //Main Menu
  menuLineX = menuBoxWidth = menuBoxHeight = menuBoxY = 
    startX = goWidth = goHeight = goX = goY = 0;

  menuOptions = new ArrayList<menuOpt>();
  selectedMenu = new menuOpt();

  textFont(gameFont, 20);
  String[] menuNames = {"Play", "High Scores", "Options", "Quit"};

  for (int i=0; i<menuNames.length; i++)
  {
    float optionX = (width/3)-textWidth(menuNames[i]);
    float optionY = (height/3)+((textDescent()+textAscent())*i+(15*i));
    menuOpt o = new menuOpt(menuNames[i], optionX, optionY);
    menuOptions.add(o);
  }

  //Round data
  maps = new ArrayList<map>();
  rounds = new ArrayList<round>();
  roundStarted = roundInitialised = roundEnded = false;
  limit = 20;
  currentRound = 0;
  overtimeRound = 0;

  //Round UI elements
  roundStartX = menuWidth*0.15;
  roundStartY = height*0.9;
  roundStartWidth = menuWidth*.70;
  roundStartHeight = height/15;

  pathWidth = width/20;
  qCheck = false;

  Table t = loadTable("maps.csv", "header");

  for (TableRow row : t.rows())
  {
    map m = new map(row);
    maps.add(m);
  }

  Table t2 = loadTable("rounds.csv", "header");

  for (TableRow row : t2.rows())
  {
    round r = new round(row);
    rounds.add(r);
  }

  //Enemies
  basics = new ArrayList<EnemyBlockies>();
  heavys  = new ArrayList<EnemyRay>();
  fasts = new ArrayList<EnemySpider>();

  enemies = new ArrayList<enemy>();
  activeEnemies = new ArrayList<enemy>();

  //turrets
  activeturrets = new ArrayList<turret>();
  placing = false;
  selectedturret = null;

  cannon c = new cannon();
  turretMenu.add(c);

  AOE a = new AOE();
  turretMenu.add(a);

  rocket ro = new rocket();
  turretMenu.add(ro);

  sniper s = new sniper();
  turretMenu.add(s);
}

void roundData()
{
  if (roundStarted == false)
  {
    enemyTotal = 0;
    for (int basics=0; basics<(rounds.get(currentRound).block); basics++)
    {
      enemy b = new EnemyBlockies();
      enemies.add(b);
      enemyTotal++;
    }

    for (int heavys=0; heavys<(rounds.get(currentRound).ray); heavys++)
    {
      enemy h = new EnemyRay();
      enemies.add(h);
      enemyTotal++;
    }  

    for (int fasts=0; fasts < (rounds.get(currentRound).spider); fasts++)
    {
      enemy f = new EnemySpider();
      enemies.add(f);
      enemyTotal++;
    }  

    for (int boss=0; boss < (rounds.get(currentRound).boss); boss++)
    {
      enemy b = new EnemyKinArt();
      enemies.add(b);
      enemyTotal++;
    }  

    //gives random order of enemies each round
    Collections.shuffle(enemies);
  }
}
