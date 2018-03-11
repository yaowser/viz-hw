import java.util.Collections;
import processing.video.*;
import ddf.minim.*;

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
ArrayList<basic> basics;
ArrayList<heavy> heavys;
ArrayList<fast>  fasts;
ArrayList<enemy> enemies, activeEnemies;

//Towers
ArrayList<tower> towerMenu, activeTowers;
boolean placing;
tower selectedTower;

//Round controllers
boolean roundStarted, roundInitialised, roundEnded;
int enemyTotal, limit, currentRound, overtimeRound;


//Round UI 
float roundStartX, roundStartY, roundStartWidth, roundStartHeight, menuWidth;
button s,q,yes,no;
boolean qCheck;

//Tower preference buttons
String[] preferences = {"first","last","strongest","weakest","basic","heavy","fast","random"};
ArrayList<button> prefButtons;

//Game over
button r,m;

//overtime
button con,fin;
boolean regOver, overtime, conCheck;
int overtimeMult = 0;