/*

 Turret Defense:   Guardians of the Galaxy
 Editor:           Mooyoung Lee, Yao Yao
 
 Reference:  
 Game engine source: Github... TBA / cannot find anymore
 Verlet objece source: SMU MSDS Visualization 2DS lecture
 
 
 Difficulties experienced:
 Failed to switch renderer from default to P2D.  Seems it was possible for Processing v1 by "import org.gicentre.utils.multisketch.*;" or "multiple nested PApplets"
 So we decided to run two processing programs to show opening program using default renderer and a game play with P2D renderer.
 
 
 Game Features:
 4 turrets: aoe(Science Vessel), laser(Wraith), rocket launcher(Battle Cruiser), sniper(Ghost)  w/ StartCraft units
 4 enemies: Blockies, Ray, Spider, boss(Kinetic Art) from Verlet Object
 Money System
 Can upgrade turrets
 Can change turret focus
 Can move turrets after placing
 Can sell turrets
 Records top 10 high scores
 Includes sound and an option to turn it on/off
 3 difficuly level: easy, medium, hard
 4 maps: Line, Z, Z2, >
 endless mode (option given after completingt the 21 set rounds)
 
 
 Tabs guide(in order of how processing sorts them)
 1. Main - shows only top level classes: loading and game engine
 2. BossKinArt - boss unit sketch using kinetic art
 3. Engine - contains core classes(Engine, Round, MenuOpt, Map, Button classes) to run this game
 4. Turret - classes for ally unit mothods
 5. VerletObj - classes for enemy unit sketches
 6. WC_Load - loading page (word cloud) wrapper class
 7. WC_Shape - loading page (word cloud) base shape sketch
 8. enemy - classes for enemy unit method
 9. globalVariables - global variable tab 
 */
 
 

PShader nebula;
import java.util.Collections;
import processing.video.*;
import ddf.minim.*;
import processing.core.PApplet;



// class variables
LoadingPage loadingPage; // Loading page; Word Cloud about Turret Game
Engine engine; // Game engine



void setup()
{
  //fullScreen(P2D,3);   // !specify the number of screeen; ! very slow w/ full screen
  size(1200, 800, P2D);  //
  smooth(8); 

  //loadingPage = new LoadingPage(this);  // suppressed due to renderer conflict
  engine = new Engine(this);
}



void draw() {
  //loadingPage.display(next);
  engine.display();
}
