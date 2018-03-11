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
  splashFont = createFont("spektakel.otf",200);
  gameFont = createFont("pixel1.otf",200);

    
  eventHorizon = new Movie(this,"eventHorizon.mp4");
  
  //Global Variables Initialisation
  screenIndex = 0;
  menuIndex = 4; 
  k=0;
 
  //Splash screen
  splashOp = 0;
  splashCheck = titleCheck = false;
    
  //In game menu
  menuWidth = width/6;
  towerMenu = new ArrayList<tower>();
        
  //Tower preference
  prefButtons = new ArrayList<button>();

   
 //Main Menu
  menuLineX = menuBoxWidth = menuBoxHeight = menuBoxY = 
  startX = goWidth = goHeight = goX = goY = 0;
  
  menuOptions = new ArrayList<menuOpt>();
  selectedMenu = new menuOpt();
  
  textFont(gameFont,20);
  String[] menuNames = {"Play","High Scores","Options","Quit"};
  
  for(int i=0;i<menuNames.length;i++)
  {
    float optionX = (width/3)-textWidth(menuNames[i]);
    float optionY = (height/3)+((textDescent()+textAscent())*i+(15*i));
    menuOpt o = new menuOpt(menuNames[i],optionX,optionY);
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
  
  Table t = loadTable("maps.csv","header");
  
  for(TableRow row:t.rows())
  {
     map m = new map(row);
     maps.add(m);
  }
  
  Table t2 = loadTable("rounds.csv","header");
  
  for(TableRow row:t2.rows())
  {
    round r = new round(row);
    rounds.add(r);
  }
  
  //Enemies
  basics = new ArrayList<basic>();
  heavys  = new ArrayList<heavy>();
  fasts = new ArrayList<fast>();
  
  enemies = new ArrayList<enemy>();
  activeEnemies = new ArrayList<enemy>();

  //Towers
  activeTowers = new ArrayList<tower>();
  placing = false;
  selectedTower = null;
  
  cannon c = new cannon();
  towerMenu.add(c);
  
  AOE a = new AOE();
  towerMenu.add(a);
  
  rocket ro = new rocket();
  towerMenu.add(ro);
  
  sniper s = new sniper();
  towerMenu.add(s);
}

void roundData()
{
  if(roundStarted == false)
  {
    enemyTotal = 0;
    for(int basics=0;basics<(rounds.get(currentRound).basic);basics++)
    {
      enemy b = new basic();
      enemies.add(b);
      enemyTotal++;  
    }

    for(int heavys=0;heavys<(rounds.get(currentRound).heavy);heavys++)
    {
      enemy h = new heavy();
      enemies.add(h);
      enemyTotal++;
    }  
  
    for(int fasts=0;fasts < (rounds.get(currentRound).fast);fasts++)
    {
      enemy f = new fast();
      enemies.add(f);
      enemyTotal++;
    }  
    
    for(int boss=0;boss < (rounds.get(currentRound).boss);boss++)
    {
      enemy b = new boss();
      enemies.add(b);
      enemyTotal++;
    }  
   
    //gives random order of enemies each round
    Collections.shuffle(enemies);
  } 
}