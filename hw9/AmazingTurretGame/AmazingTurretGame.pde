/*
  OOP Assignment 8
  Turret Defense
  Features:
  4 towers: aoe, laser, rocket launcher, sniper
  4 enemies: basic, heavy, fast, boss
  Money System
  Can upgrade towers
  Can change tower focus
  Can move towers after placing
  Can sell towers
  Records top 10 high scores
  Includes sound and an option to turn it on/off
  3 difficuly level: easy, medium, hard
  4 maps: Line, Z, Z2, >
  endless mode (option given after completingt the 21 set rounds)
  
  
  Tabs guide(in order of how processing sorts them)
  1.Main - contains setup, draw, and most drawing code that is not contained in classes
  2.AOE - class for the pulser tower with aoe damage
  3.basic - class for the basic enemy
  4.boss - class for the boss enemy
  5.button - class for all buttons
  6.cannon - class for laser cannon tower
  7.controlFunctions - hold most control/calculation code that is not contained in classes
  8.dataInitialisation - hold all the code for initialising data at program start and for each round
  9.enemy - abstract super class for all enemies
  10.fast - class for fast enemy
  11.globalVariable - holds declaration of all global variables
  12.heavy - class for heavy enemy
  13.map - class to hold each maps data
  14.menuOpt - class to hold the main menu options
  15.rocket - class to the the launcher tower
  16.round - class to hold each rounds information
  17.sniper - class to hold the sniper tower
  18.tower - abstract super class for all towers
  
  
  https://forum.processing.org/two/discussion/21477/having-trouble-overlaying-text-on-top-of-interactive-background
  * From CoffeeBreakStudios.com (CBS)
  * Ported from the webGL version in GLSL Sandbox:
  * http://glsl.heroku.com/e#3265.2
*/

PShader nebula;

void setup()
{
  //fullScreen();
  size(1200,800,P2D);
  //in dataInitialisation tab
  dataInit();
  smooth(8);  
  imageMode(CENTER);
  
  noStroke();

  nebula = loadShader("nebula.glsl");
  nebula.set("resolution", float(width), float(height));
  
  //video used used for portals on map
  eventHorizon.loop();
}



void draw()
{
  background(0);
  nebula.set("time", millis() / 500.0);  
  shader(nebula); 
  
  // This kind of raymarching effects are entirely implemented in the
  // fragment shader, they only need a quad covering the entire view 
  // area so every pixel is pushed through the shader. 
  rect(0, 0, width, height);
  resetShader();
  //in controlFunctions tab
  screenControl(); 
}

//for playing video
void movieEvent(Movie m)  
{
  m.read();
}

//draw splash screen
void drawSplash()
{
  textFont(splashFont,40);
 
  String splashVal = "Loading...";
  float splashX = ((width/2)-(textWidth(splashVal)/2));
  float splashY = ((height/2)+(textAscent()/2)); 
 
  fill(255,255,255,splashOp);
  text(splashVal,splashX,splashY);
}

//draw main menu
void drawMainMenu()
{
  for(int i=0;i<menuOptions.size();i++)
  {
    menuOptions.get(i).mouseDet();
    menuOptions.get(i).drawOption();
    
    if(menuOptions.get(i).clicked == true)
    {
      menuIndex = i; 
      selectedMenu = menuOptions.get(i);
    }
    
    if(menuOptions.get(i).hover == true)
    {
      titleCheck = true; 
    }
  }
  
  textSize(15);
 
  //take user input for name for highscores
  String type = "Insert Name: ";
  fill(255);
  text(type,(width/2)-textWidth(type),height-100);
  text(Name,(width/2)-textWidth(Name)/2,height-100);
  
  if(keyPressed)
  {
    if(key == 8) 
    {
      if (Name.length() > 0) 
      {
        Name = Name.substring(0, Name.length()-1);
      }
    }
    else if (key == 127)
    {
      Name = "";
    } 
    else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && Name.length() < 4) 
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
  for(int i=0;i<maps.size();i++)
  {
     button b = new button(maps.get(i).name,false, menuLineX+startX+border,menuBoxY+(goHeight*i)+border+(border*i),goWidth,goHeight);
     mapChoice.add(b);
     
     if(i == maps.size()-1)
     {
       bottom = menuBoxY+(goHeight*i)+border+(border*i);
     }
     
     if(selectedMap == maps.get(i).name)
     {
        for(int j=0;j<maps.get(i).points.size()-1;j++)
        {
           float x1 = map(map(maps.get(i).points.get(j).x,menuWidth+100,width-100,0,20),0,20,menuLineX+startX+goWidth*2,menuLineX+menuBoxWidth+startX-border);
           float y1 = map(map(maps.get(i).points.get(j).y,100,height-156,0,20),0,20,menuBoxY+border,menuBoxHeight);
           float x2 = map(map(maps.get(i).points.get(j+1).x,menuWidth+100,width-100,0,20),0,20,menuLineX+startX+goWidth*2,menuLineX+menuBoxWidth+startX-border);
           float y2 = map(map(maps.get(i).points.get(j+1).y,100,height-156,0,20),0,20,menuBoxY+border,menuBoxHeight);
           
           line(x1,y1,x2,y2);
        }
     }
  }
  
  for(int i=0;i<mapChoice.size();i++)
  {
    mapChoice.get(i).drawButton(); 
    
    if(mapChoice.get(i).clicked == true)
    {
      selectedMap = mapChoice.get(i).label; 
    }
  }
  
  //selecting difficulty
  String[] diff = {"Easy","Normal","Hard"};
  for(int i=0;i<diff.length;i++)
  {
    button b = new button(diff[i],false,menuLineX+startX+((border/2)*(i+3))+goWidth*(i+1),bottom,goWidth,goHeight);
    
    b.drawButton();
    
    if(b.clicked == true)
    {
      difficulty = diff[i]; 
    }
  }
  textSize(9);
  text(difficulty,goX-textWidth(difficulty)/2,bottom-goHeight);
  
  g = new button("Go",false,goX+border,bottom,goWidth,goHeight);
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

  Table t3 = loadTable("data/highscores.csv","header");
 
  for(int i=0;i<t3.getRowCount();i++)
  {
    scores.add(t3.getRow(i));
  }
  
  for(int i=0;i<scores.size();i++)
  {
    for(int j=1;j<scores.size()-i;j++)
    {
      int score = scores.get(j-1).getInt("Score");
      int score1 = scores.get(j).getInt("Score");

      if(score > score1)
      {
        TableRow temp = scores.get(j-1);
        scores.set(j-1,scores.get(j));
        scores.set(j,temp);
      }
    }
   }
 
  Collections.reverse(scores);
  
  fill(255);
  for(int i=0;i<scores.size();i++)
  {
    TableRow row = scores.get(i);
    text(row.getString("Name"),menuLineX+startX+border,menuBoxY+border*2+textAscent()*3*i);
    text(row.getInt("Round"),menuLineX+startX+border+sectionWidth,menuBoxY+border*2+textAscent()*3*i);
    text(row.getInt("Score"),menuLineX+startX+border+sectionWidth*1.5,menuBoxY+border*2+textAscent()*3*i);
    text(row.getString("Diff"),menuLineX+startX+border+sectionWidth*3,menuBoxY+border*2+textAscent()*3*i);
    text(row.getString("Map"),menuLineX+startX+border+sectionWidth*4.5,menuBoxY+border*2+textAscent()*3*i); 
  }
}

//draw main menu options option
void drawOptions()
{
  //in this tab around line 300
  drawMenuBox(); 
  String s;
  
  //turn sound on or off
  if(sound == true)
  {
    s = "Sound On";
  }
  else
  {
    s = "Sound Off";
  }
  
  float buttonWidth = menuBoxWidth/5;
  float buttonHeight = menuBoxHeight/5;
  
  text(s,(menuLineX+startX+(menuBoxWidth/2))-textWidth(s)/2,menuBoxY+(menuBoxHeight/2));
  
  button on = new button("On",false,menuLineX+startX+(menuBoxWidth/2)-buttonWidth*1.25,menuBoxY+menuBoxHeight-buttonHeight*1.25,buttonWidth,buttonHeight);
  on.drawButton();
  
  button off = new button("Off",false,menuLineX+startX+(menuBoxWidth/2)+buttonWidth*0.25,menuBoxY+menuBoxHeight-buttonHeight*1.25,buttonWidth,buttonHeight);
  off.drawButton();
  
  if(on.clicked == true)
  {
    sound = true; 
  }
  
  if(off.clicked == true)
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
  translate(startX,0);
  
  menuLineX = lerp(menuLineX,endX,0.1);
  
  menuBoxY = lerp(menuBoxY,lineY-menuBoxHeight/2,0.1);
  menuBoxWidth = lerp(menuBoxWidth,width/3,0.1);
  menuBoxHeight = lerp(menuBoxHeight,height/3,0.1);
  
  strokeWeight(1);
  stroke(255);
  line(0,lineY,menuLineX,lineY);
  
  noFill();
  rect(menuLineX,menuBoxY,menuBoxWidth,menuBoxHeight);
  
  popMatrix(); 
  

}

//draw the game title when no option is selected
void drawTitle()
{
  textFont(splashFont,100);
  String name1 = "Turret";
  String name2 = "Defense";
  String name3 = "Game";
  float xVal = (width*0.60);
  float yVal = height*0.30;
  
  fill(255);
  text(name1,xVal-(textWidth(name1)/2),yVal);
  text(name2,xVal-(textWidth(name2)/2),yVal+(textAscent()+textDescent())*1.4);
  text(name3,xVal-(textWidth(name3)/2),yVal+(textAscent()+textDescent())*2.8);
}

//draw the map in game
void drawMap()
{
   for(int i=0;i<maps.size();i++)
   {
     if(maps.get(i).name.equals(selectedMap)) 
     {
       maps.get(i).drawMap(); 
     }
   }
}

//draw towers in game
void drawActiveTowers()
{
  for(int i=0;i<activeTowers.size();i++)
  {
    if(activeTowers.get(i) instanceof cannon)
    {
      cannon c = (cannon)activeTowers.get(i);
      c.drawTower();  
    }
    else if(activeTowers.get(i) instanceof AOE)
    {
      AOE a = (AOE)activeTowers.get(i);
      a.drawTower();
    }
    else if(activeTowers.get(i) instanceof sniper)
    {
      sniper s = (sniper)activeTowers.get(i);
      s.drawTower();
    }
    else if(activeTowers.get(i) instanceof rocket)
    {
      rocket r = (rocket)activeTowers.get(i);
      r.drawTower();
    }
    
  }
}

//draw enemies in game
void drawEnemies()
{
  noFill();
  strokeWeight(5);
  
  if(k<enemies.size() && frameCount % 35 == 0)
  {
    enemy e = enemies.get(k);
    activeEnemies.add(e);
    k++;
  }
  
  for(int i=0;i<activeEnemies.size();i++)
  {
    enemy e = activeEnemies.get(i);
    
   if(e instanceof basic)
    {
      basic b = (basic)activeEnemies.get(i); 
      b.drawEnemy();
    }
    else if(e instanceof heavy)
    {
      heavy h = (heavy)activeEnemies.get(i);
      h.drawEnemy();
    }
    else if(e instanceof fast)
    {
      fast f = (fast)activeEnemies.get(i);
      f.drawEnemy();
    }
    else if(e instanceof boss)
    {
      boss b = (boss)activeEnemies.get(i);
      b.drawEnemy();
    }
    
    e.moveEnemy();
  } 
}
 
//draw the menu that holds the towers for purchasing
void drawTowerMenu()
{
  String l = "Laser Cannon";
  String p = "Pulser";
  String sn = "Sniper";
  String rl = "Launcher";
  fill(0);
  stroke(255);
  strokeWeight(3);
   
  rect(0,0,menuWidth,height);
  
  textSize(10);
  fill(255);
  if(moneyCheck == true)
  {
    fill(255,0,0);
    moneyCheck = false;
  }
  
  text("Money: " + money,5,textAscent()*2+5);
  fill(255);
  if(limit <= 5)
  {
    fill(255,0,0); 
  }
  
  text("Health: " + limit,5,textAscent()*4+5);
  
  fill(255);
  text("Score: " + score,5,textAscent()*6+5);
  
 
  noFill();
  textSize(7);
  for(int i=0;i<towerMenu.size();i++)
  {
    if(towerMenu.get(i) instanceof cannon)
    {
      cannon c = (cannon) towerMenu.get(i);
      c.pos.x = menuWidth/4;
      c.pos.y = height*.12;
      
      c.drawTower(); 
      fill(255);
      text(l,c.pos.x+textWidth(l)*0.3,c.pos.y-c.towerHeight*0.2);
      text("Price: "+c.price,c.pos.x+textWidth(l)*0.3,c.pos.y-(c.towerHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(c.damage*c.rateOfFire),c.pos.x+textWidth(l)*0.3,c.pos.y-(c.towerHeight*0.2)+textAscent()*4);
      
    }
     
    if(towerMenu.get(i) instanceof AOE)
    {
      AOE a = (AOE) towerMenu.get(i);
      a.pos.x = menuWidth/4;
      a.pos.y = height*0.22;
      a.drawTower();
      text(p,a.pos.x+textWidth(l)*0.3,a.pos.y-a.towerHeight*0.2);
      text("Price: "+a.price,a.pos.x+textWidth(l)*0.3,a.pos.y-(a.towerHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(a.damage*a.rateOfFire)+"(AOE)",a.pos.x+textWidth(l)*0.3,a.pos.y-(a.towerHeight*0.2)+textAscent()*4);
    }
    
    if(towerMenu.get(i) instanceof sniper)
    {
      sniper s = (sniper) towerMenu.get(i);
      s.pos.x = menuWidth/4;
      s.pos.y = height*0.32;
      fill(255);
      text(sn,s.pos.x+textWidth(l)*0.3,s.pos.y-s.towerHeight*0.2);
      text("Price: "+s.price,s.pos.x+textWidth(l)*0.3,s.pos.y-(s.towerHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(s.damage*s.rateOfFire),s.pos.x+textWidth(l)*0.3,s.pos.y-(s.towerHeight*0.2)+textAscent()*4);
      s.drawTower();
    }
    
    if(towerMenu.get(i) instanceof rocket)
    {
      rocket r = (rocket) towerMenu.get(i);
      r.pos.x = menuWidth/4;
      r.pos.y = height*0.42;
      text(rl,r.pos.x+textWidth(l)*0.3,r.pos.y-r.towerHeight*0.2);
      text("Price: "+r.price,r.pos.x+textWidth(l)*0.3,r.pos.y-(r.towerHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(r.damage*r.rateOfFire)+" (AOE)",r.pos.x+textWidth(l)*0.3,r.pos.y-(r.towerHeight*0.2)+textAscent()*4);
      r.drawTower();
    }
  }  
}

//draw the ui used in controlling the round and displaying round data
void drawRoundUI()
{
  textFont(gameFont,10);
  String r;
  if(overtime == false)
  {
    r = ("Round:"+(currentRound+1)+"/"+"21");
  }
  else
  {
     r = ("Round:"+(currentRound+1+overtimeRound));
  }
  String e = ("Remaining Enemies:"+enemyTotal);
  float border = width/80;
  fill(0);
  stroke(255);
  strokeWeight(3);
  
  s = new button("Start",false,roundStartX,roundStartY,roundStartWidth,roundStartHeight);
  s.drawButton();
  
  q = new button("Quit",false,width - roundStartWidth - border,border,roundStartWidth,roundStartHeight); 
  q.drawButton();
  
  fill(255);
  textSize(12);
  text(r,(menuWidth/2)-(textWidth(r)/2),roundStartY-textAscent());
  
  textSize(10);
  text(e,menuWidth+5,height);
  
  textSize(10);
  text(rounds.get(currentRound).toString(),menuWidth+5,height-(textAscent()*7));
}

//draw the tower you are currently placing
void drawSelectedTower()
{
  if(selectedTower instanceof cannon)
  {
    cannon c = (cannon)selectedTower;
    c.drawTower();
  }
  else if(selectedTower instanceof AOE)
  {
    AOE a = (AOE)selectedTower;
    a.drawTower();
  } 
  else if( selectedTower instanceof sniper)
  {
    sniper s = (sniper)selectedTower;
    s.drawTower();
  }
  else if(selectedTower instanceof rocket)
  {
    rocket r = (rocket)selectedTower;
    r.drawTower();
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
  rect(checkX,checkY,checkWidth,checkHeight);
  
  fill(255);
  textSize(15);
  text(are,checkX+(checkWidth/2)-textWidth(are)/2,checkY+checkHeight*.25);
  
  textSize(10);
  text(all,checkX+(checkWidth/2)-textWidth(all)/2,checkY+checkHeight*.5);
  
  yes = new button("Yes",false,checkX+checkWidth/4-5,checkY+checkHeight*.75,checkWidth/4,checkHeight/5);
  yes.drawButton();
  
  no = new button("No",false,checkX+checkWidth/2+5,checkY+checkHeight*.75,checkWidth/4,checkHeight/5);
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
  rect(checkX,checkY,checkWidth,checkHeight);
  
  fill(255);
  textSize(15);
  text(grat,checkX+(checkWidth/2)-textWidth(grat)/2,checkY+checkHeight*.25);
  
  textSize(10);
  text(beat,checkX+(checkWidth/2)-textWidth(beat)/2,checkY+checkHeight*.35);
  
  text(sc,checkX+(checkWidth/2)-textWidth(sc)/2,checkY+checkHeight*.45);
  text(diff,checkX+(checkWidth/2)-textWidth(diff)/2,checkY+checkHeight*.55);
  text(cont,checkX+(checkWidth/2)-textWidth(cont)/2,checkY+checkHeight*.65);
  
  con = new button("Yes",false,checkX+checkWidth/4-5,checkY+checkHeight*.75,checkWidth/4,checkHeight/5);
  con.drawButton();
  
  fin = new button("No",false,checkX+checkWidth/2+5,checkY+checkHeight*.75,checkWidth/4,checkHeight/5);
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
  rect(overX,overY,overWidth,overHeight);
  
  textSize(25);
  fill(255);
  text(g,overX+(overWidth/2)-textWidth(g)/2,overY+(overHeight*0.40));
  
  textSize(15);
  text(s,overX+(overWidth/2)-textWidth(s)/2,overY+(overHeight*.55));
  
  r = new button("Retry",false,overX+(overWidth*.15)-5,overY+(overHeight*.65),overWidth/3,overHeight/5);
  r.drawButton();
  
  m = new button("Menu",false,overX+(overWidth*.15)+(overWidth/3)+5,overY+overHeight*.65,overWidth/3,overHeight/5);
  m.drawButton();
}