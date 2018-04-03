
//loading page
int next;

//sound
Minim minim;
AudioPlayer laserCannonSound;
AudioPlayer AOESound;
AudioPlayer sniperSound;
AudioPlayer launcherSound;
Boolean sound;
boolean scoreCheck;

//Video to play under portals
Movie eventHorizon;


int money,score;
String Name;
boolean moneyCheck;

//Game options
String selectedMap,difficulty;
float diffMult;
button g;

//Index Variables
int screenIndex, menuIndex, k;

//Splash Screen
int splashOp;
boolean splashCheck;

//Main Menu
boolean titleCheck;
float menuLineX, menuBoxWidth, menuBoxHeight, menuBoxY, startX, goWidth, goHeight, goX, goY;
ArrayList<menuOpt> menuOptions;
menuOpt selectedMenu;

//Fonts
PFont splashFont, gameFont;

//Round data
ArrayList<map> maps;
ArrayList<round> rounds;
float pathWidth; 

//Enemies
ArrayList<EnemyBlockies> basics;
ArrayList<EnemyRay> heavys;
ArrayList<EnemySpider>  fasts;
ArrayList<enemy> enemies, activeEnemies;

//turrets
ArrayList<turret> turretMenu, activeturrets;
boolean placing;
turret selectedturret;

//Round controllers
boolean roundStarted, roundInitialised, roundEnded;
int enemyTotal, limit, currentRound, overtimeRound;


//Round UI 
float roundStartX, roundStartY, roundStartWidth, roundStartHeight, menuWidth;
button s,q,yes,no;
boolean qCheck;

//turret preference buttons
String[] preferences = {"first","last","strongest","weakest","blockies","ray","spider","random"};
ArrayList<button> prefButtons;

//Game over
button r,m;

//overtime
button con,fin;
boolean regOver, overtime, conCheck;
int overtimeMult = 0;
