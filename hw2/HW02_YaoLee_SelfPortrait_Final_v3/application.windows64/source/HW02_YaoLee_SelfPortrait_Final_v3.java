import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class HW02_YaoLee_SelfPortrait_Final_v3 extends PApplet {

// Self Portrait, MSDS6390 HW02
// 1/22/2018 Yao Yao, Mooyoung Lee

// Reference(Mooyoung Lee); Code from the below sources are used and modified.
  // https://processing.org/reference
  // Greenberg, Ira. "Processing, Creative coding and generative art in Processing 2".

// Yao's global variables
PImage img;
int p = 0, q = 0; //size and location parameters
PFont f;

// Mooyoung's global variables

// collage inputs
String imgPath = "MooyoungLeeSM.png";
int xStart = 792, yStart = 0;  // starting pixel of Mooyoung's pallet

// portrait inputs
float sizeRatio = 1;
float xOffset = 784, yOffset = 112;

// draw inputs
float stepSize[] = {0,0,1,2,5,4,3,1,0,0};
int i = 0, k=0;

// mouse input
int mouseLeft = 0;

//frame size
public void settings() {           
  img = loadImage("1.jpg");
  int iWidth = img.width*2;
  int iHeight = img.height;
  size(iWidth + 742, iHeight);
}

//font
public void setup() {
  f = createFont("Arial",8,true);
  frameRate(3);
}

//left click starts or stops, right click saves
public void mousePressed() {
  if(mouseButton == RIGHT) {
    save("final.jpg");
  }
  if(mouseButton == LEFT) {
    if (mouseLeft == 0){
      mouseLeft = 1;
    } else {
      mouseLeft = 0;
    }
  }
}

public void keyPressed() { //manual
  if (key == CODED) {
    if (keyCode == UP) { //size
      p++;
    } else if (keyCode == DOWN) {
      p--;
    } else if (keyCode == RIGHT) { //position
      q+=10;
    } else if (keyCode == LEFT) {
      q-=10;
    }
  }
}

//create random background boxes that resize with parameters
public void draw() {
  float x = img.width*pow(1.1f,p)/15;
  float y = img.height*pow(1.1f,p)/30;
  stroke(1);
  for(int i = 0; i < img.width; i += x){
    for(int j = 0; j < img.height; j += y){
      fill(PApplet.parseInt(random(255)),PApplet.parseInt(random(255)),PApplet.parseInt(random(255)));
      rect(i,j,x,y);
    }
  } 
  
  //instuctions for Yao's and Mooyoung's portrait
  textFont(f,20);
  fill(255);
  text("Press Arrow Keys: Left, Right, Up, or Down",0,20);
  fill(5);
  text("Press Mouse to Stop/Start",img.width*2,20);
  float iWidth = img.width*pow(1.1f,p);
  float iHeight = img.height*pow(1.1f,p);
  image(img, img.width, 0);
  
  //start of Yao's portrait
  stroke(1);
  fill(19,26,34); // black shoes 1
  beginShape();
  curveVertex(0.333333333f*iWidth+q,0.864640884f*iHeight);
  curveVertex(0.333333333f*iWidth+q,0.864640884f*iHeight);
  curveVertex(0.345959596f*iWidth+q,0.883977901f*iHeight);
  curveVertex(0.348484848f*iWidth+q,0.904696133f*iHeight);
  curveVertex(0.356060606f*iWidth+q,0.92679558f*iHeight);
  curveVertex(0.371212121f*iWidth+q,0.933701657f*iHeight);
  curveVertex(0.404040404f*iWidth+q,0.935082873f*iHeight);
  curveVertex(0.421717172f*iWidth+q,0.932320442f*iHeight);
  curveVertex(0.444444444f*iWidth+q,0.924033149f*iHeight);
  curveVertex(0.446969697f*iWidth+q,0.910220994f*iHeight);
  curveVertex(0.449494949f*iWidth+q,0.901933702f*iHeight);
  curveVertex(0.441919192f*iWidth+q,0.890883978f*iHeight);
  curveVertex(0.434343434f*iWidth+q,0.88121547f*iHeight);
  curveVertex(0.426767677f*iWidth+q,0.870165746f*iHeight);
  curveVertex(0.419191919f*iWidth+q,0.860497238f*iHeight);
  curveVertex(0.419191919f*iWidth+q,0.860497238f*iHeight);
  endShape(CLOSE);
  
  beginShape();  // black shoes 2
  curveVertex(0.217171717f*iWidth+q,0.852209945f*iHeight);
  curveVertex(0.217171717f*iWidth+q,0.852209945f*iHeight);
  curveVertex(0.184343434f*iWidth+q,0.870165746f*iHeight);
  curveVertex(0.164141414f*iWidth+q,0.886740331f*iHeight);
  curveVertex(0.138888889f*iWidth+q,0.906077348f*iHeight);
  curveVertex(0.118686869f*iWidth+q,0.921270718f*iHeight);
  curveVertex(0.065656566f*iWidth+q,0.930939227f*iHeight);
  curveVertex(0.02020202f*iWidth+q,0.92679558f*iHeight);
  curveVertex(0.022727273f*iWidth+q,0.933701657f*iHeight);
  curveVertex(0.058080808f*iWidth+q,0.937845304f*iHeight);
  curveVertex(0.098484848f*iWidth+q,0.936464088f*iHeight);
  curveVertex(0.126262626f*iWidth+q,0.92679558f*iHeight);
  curveVertex(0.141414141f*iWidth+q,0.907458564f*iHeight);
  curveVertex(0.156565657f*iWidth+q,0.897790055f*iHeight);
  curveVertex(0.171717172f*iWidth+q,0.888121547f*iHeight);
  curveVertex(0.204545455f*iWidth+q,0.879834254f*iHeight);
  curveVertex(0.214646465f*iWidth+q,0.870165746f*iHeight);
  curveVertex(0.212121212f*iWidth+q,0.860497238f*iHeight);
  curveVertex(0.212121212f*iWidth+q,0.860497238f*iHeight);
  endShape(CLOSE);
    
  fill(255, 255, 255); // white shoes 1
  beginShape();
  curveVertex(0.095959596f*iWidth+q,0.86878453f*iHeight);
  curveVertex(0.095959596f*iWidth+q,0.86878453f*iHeight);
  curveVertex(0.027777778f*iWidth+q,0.91160221f*iHeight);
  curveVertex(0.02020202f*iWidth+q,0.925414365f*iHeight);
  curveVertex(0.078282828f*iWidth+q,0.937845304f*iHeight);
  curveVertex(0.126262626f*iWidth+q,0.92679558f*iHeight);
  curveVertex(0.159090909f*iWidth+q,0.888121547f*iHeight);
  curveVertex(0.202020202f*iWidth+q,0.864640884f*iHeight);
  curveVertex(0.202020202f*iWidth+q,0.864640884f*iHeight);
  endShape(CLOSE);
    
  beginShape(); // white shoes 2
  curveVertex(0.333333333f*iWidth+q,0.866022099f*iHeight);
  curveVertex(0.333333333f*iWidth+q,0.866022099f*iHeight);
  curveVertex(0.345959596f*iWidth+q,0.885359116f*iHeight);
  curveVertex(0.345959596f*iWidth+q,0.908839779f*iHeight);
  curveVertex(0.361111111f*iWidth+q,0.930939227f*iHeight);
  curveVertex(0.406565657f*iWidth+q,0.929558011f*iHeight);
  curveVertex(0.429292929f*iWidth+q,0.92679558f*iHeight);
  curveVertex(0.449494949f*iWidth+q,0.91160221f*iHeight);
  curveVertex(0.444444444f*iWidth+q,0.89640884f*iHeight);
  curveVertex(0.439393939f*iWidth+q,0.882596685f*iHeight);
  curveVertex(0.414141414f*iWidth+q,0.85359116f*iHeight);
  curveVertex(0.414141414f*iWidth+q,0.85359116f*iHeight);
  endShape(CLOSE);
  
  //shoe laces 1
  line(0.073232323f*iWidth+q,0.901933702f*iHeight,0.101010101f*iWidth+q,0.893646409f*iHeight);
  line(0.101010101f*iWidth+q,0.893646409f*iHeight,0.083333333f*iWidth+q,0.888121547f*iHeight);
  line(0.083333333f*iWidth+q,0.888121547f*iHeight,0.108585859f*iWidth+q,0.88121547f*iHeight);
  line(0.108585859f*iWidth+q,0.88121547f*iHeight,0.095959596f*iWidth+q,0.86878453f*iHeight);
  line(0.095959596f*iWidth+q,0.86878453f*iHeight,0.123737374f*iWidth+q,0.874309392f*iHeight);
  line(0.123737374f*iWidth+q,0.874309392f*iHeight,0.085858586f*iWidth+q,0.879834254f*iHeight);
  line(0.085858586f*iWidth+q,0.879834254f*iHeight,0.101010101f*iWidth+q,0.886740331f*iHeight);
  line(0.101010101f*iWidth+q,0.886740331f*iHeight,0.078282828f*iWidth+q,0.893646409f*iHeight);
  line(0.078282828f*iWidth+q,0.893646409f*iHeight,0.090909091f*iWidth+q,0.906077348f*iHeight);
  
  //shoe laces 2
  line(0.396464646f*iWidth+q,0.89640884f*iHeight,0.411616162f*iWidth+q,0.883977901f*iHeight);
  line(0.411616162f*iWidth+q,0.883977901f*iHeight,0.381313131f*iWidth+q,0.882596685f*iHeight);
  line(0.381313131f*iWidth+q,0.882596685f*iHeight,0.401515152f*iWidth+q,0.870165746f*iHeight);
  line(0.401515152f*iWidth+q,0.870165746f*iHeight,0.381313131f*iWidth+q,0.866022099f*iHeight);
  line(0.381313131f*iWidth+q,0.866022099f*iHeight,0.401515152f*iWidth+q,0.859116022f*iHeight);
  line(0.401515152f*iWidth+q,0.859116022f*iHeight,0.383838384f*iWidth+q,0.871546961f*iHeight);
  line(0.383838384f*iWidth+q,0.871546961f*iHeight,0.404040404f*iWidth+q,0.877071823f*iHeight);
  line(0.404040404f*iWidth+q,0.877071823f*iHeight,0.393939394f*iWidth+q,0.889502762f*iHeight);
  line(0.393939394f*iWidth+q,0.889502762f*iHeight,0.414141414f*iWidth+q,0.890883978f*iHeight);
    
  fill(181,181,195); //pants
  beginShape();
  curveVertex(0.080808081f*iWidth+q,0.473756906f*iHeight);
  curveVertex(0.080808081f*iWidth+q,0.473756906f*iHeight);
  curveVertex(0.075757576f*iWidth+q,0.482044199f*iHeight);
  curveVertex(0.073232323f*iWidth+q,0.509668508f*iHeight);
  curveVertex(0.083333333f*iWidth+q,0.524861878f*iHeight);
  curveVertex(0.078282828f*iWidth+q,0.578729282f*iHeight);
  curveVertex(0.088383838f*iWidth+q,0.602209945f*iHeight);
  curveVertex(0.088383838f*iWidth+q,0.633977901f*iHeight);
  curveVertex(0.103535354f*iWidth+q,0.664364641f*iHeight);
  curveVertex(0.098484848f*iWidth+q,0.678176796f*iHeight);
  curveVertex(0.106060606f*iWidth+q,0.698895028f*iHeight);
  curveVertex(0.095959596f*iWidth+q,0.714088398f*iHeight);
  curveVertex(0.098484848f*iWidth+q,0.723756906f*iHeight);
  curveVertex(0.085858586f*iWidth+q,0.763812155f*iHeight);
  curveVertex(0.080808081f*iWidth+q,0.814917127f*iHeight);
  curveVertex(0.106060606f*iWidth+q,0.841160221f*iHeight);
  curveVertex(0.093434343f*iWidth+q,0.845303867f*iHeight);
  curveVertex(0.095959596f*iWidth+q,0.86878453f*iHeight);
  curveVertex(0.174242424f*iWidth+q,0.872928177f*iHeight);
  curveVertex(0.222222222f*iWidth+q,0.849447514f*iHeight);
  curveVertex(0.224747475f*iWidth+q,0.834254144f*iHeight);
  curveVertex(0.20959596f*iWidth+q,0.813535912f*iHeight);
  curveVertex(0.23989899f*iWidth+q,0.747237569f*iHeight);
  curveVertex(0.23989899f*iWidth+q,0.660220994f*iHeight);
  curveVertex(0.257575758f*iWidth+q,0.651933702f*iHeight);
  curveVertex(0.262626263f*iWidth+q,0.598066298f*iHeight);
  curveVertex(0.262626263f*iWidth+q,0.575966851f*iHeight);
  curveVertex(0.255050505f*iWidth+q,0.563535912f*iHeight);
  curveVertex(0.265151515f*iWidth+q,0.575966851f*iHeight);
  curveVertex(0.265151515f*iWidth+q,0.598066298f*iHeight);
  curveVertex(0.292929293f*iWidth+q,0.642265193f*iHeight);
  curveVertex(0.308080808f*iWidth+q,0.672651934f*iHeight);
  curveVertex(0.313131313f*iWidth+q,0.727900552f*iHeight);
  curveVertex(0.300505051f*iWidth+q,0.777624309f*iHeight);
  curveVertex(0.308080808f*iWidth+q,0.794198895f*iHeight);
  curveVertex(0.308080808f*iWidth+q,0.828729282f*iHeight);
  curveVertex(0.333333333f*iWidth+q,0.866022099f*iHeight);
  curveVertex(0.398989899f*iWidth+q,0.860497238f*iHeight);
  curveVertex(0.414141414f*iWidth+q,0.854972376f*iHeight);
  curveVertex(0.411616162f*iWidth+q,0.832872928f*iHeight);
  curveVertex(0.444444444f*iWidth+q,0.783149171f*iHeight);
  curveVertex(0.436868687f*iWidth+q,0.70441989f*iHeight);
  curveVertex(0.436868687f*iWidth+q,0.679558011f*iHeight);
  curveVertex(0.424242424f*iWidth+q,0.662983425f*iHeight);
  curveVertex(0.434343434f*iWidth+q,0.64640884f*iHeight);
  curveVertex(0.441919192f*iWidth+q,0.535911602f*iHeight);
  curveVertex(0.446969697f*iWidth+q,0.523480663f*iHeight);
  curveVertex(0.449494949f*iWidth+q,0.508287293f*iHeight);
  curveVertex(0.441919192f*iWidth+q,0.494475138f*iHeight);
  curveVertex(0.436868687f*iWidth+q,0.486187845f*iHeight);
  curveVertex(0.436868687f*iWidth+q,0.486187845f*iHeight);
  endShape(CLOSE);
  
  fill(37,91,191); //undershirt 1
  beginShape();
  curveVertex(0.106060606f*iWidth+q,0.363259669f*iHeight);
  curveVertex(0.106060606f*iWidth+q,0.363259669f*iHeight);
  curveVertex(0.101010101f*iWidth+q,0.386740331f*iHeight);
  curveVertex(0.108585859f*iWidth+q,0.403314917f*iHeight);
  curveVertex(0.098484848f*iWidth+q,0.415745856f*iHeight);
  curveVertex(0.106060606f*iWidth+q,0.429558011f*iHeight);
  curveVertex(0.098484848f*iWidth+q,0.439226519f*iHeight);
  curveVertex(0.101010101f*iWidth+q,0.453038674f*iHeight);
  curveVertex(0.093434343f*iWidth+q,0.462707182f*iHeight);
  curveVertex(0.161616162f*iWidth+q,0.470994475f*iHeight);
  curveVertex(0.303030303f*iWidth+q,0.473756906f*iHeight);
  curveVertex(0.396464646f*iWidth+q,0.468232044f*iHeight);
  curveVertex(0.436868687f*iWidth+q,0.464088398f*iHeight);
  curveVertex(0.441919192f*iWidth+q,0.430939227f*iHeight);
  curveVertex(0.439393939f*iWidth+q,0.389502762f*iHeight);
  curveVertex(0.439393939f*iWidth+q,0.38121547f*iHeight);
  curveVertex(0.439393939f*iWidth+q,0.38121547f*iHeight);
  endShape(CLOSE);
  
  beginShape(); //undershirt 2
  curveVertex(0.315656566f*iWidth+q,0.360497238f*iHeight);
  curveVertex(0.315656566f*iWidth+q,0.360497238f*iHeight);
  curveVertex(0.204545455f*iWidth+q,0.367403315f*iHeight);
  curveVertex(0.078282828f*iWidth+q,0.364640884f*iHeight);
  curveVertex(0.045454545f*iWidth+q,0.32320442f*iHeight);
  curveVertex(0.037878788f*iWidth+q,0.283149171f*iHeight);
  curveVertex(0.050505051f*iWidth+q,0.247237569f*iHeight);
  curveVertex(0.045454545f*iWidth+q,0.236187845f*iHeight);
  curveVertex(0.050505051f*iWidth+q,0.220994475f*iHeight);
  curveVertex(0.053030303f*iWidth+q,0.208563536f*iHeight);
  curveVertex(0.085858586f*iWidth+q,0.183701657f*iHeight);
  curveVertex(0.113636364f*iWidth+q,0.172651934f*iHeight);
  curveVertex(0.143939394f*iWidth+q,0.169889503f*iHeight);
  curveVertex(0.174242424f*iWidth+q,0.165745856f*iHeight);
  curveVertex(0.204545455f*iWidth+q,0.142265193f*iHeight);
  curveVertex(0.348484848f*iWidth+q,0.139502762f*iHeight);
  curveVertex(0.358585859f*iWidth+q,0.151933702f*iHeight);
  curveVertex(0.376262626f*iWidth+q,0.160220994f*iHeight);
  curveVertex(0.439393939f*iWidth+q,0.169889503f*iHeight);
  curveVertex(0.492424242f*iWidth+q,0.194751381f*iHeight);
  curveVertex(0.51010101f*iWidth+q,0.21961326f*iHeight);
  curveVertex(0.515151515f*iWidth+q,0.251381215f*iHeight);
  curveVertex(0.515151515f*iWidth+q,0.291436464f*iHeight);
  curveVertex(0.51010101f*iWidth+q,0.316298343f*iHeight);
  curveVertex(0.492424242f*iWidth+q,0.366022099f*iHeight);
  curveVertex(0.376262626f*iWidth+q,0.389502762f*iHeight);
  curveVertex(0.21969697f*iWidth+q,0.390883978f*iHeight);
  curveVertex(0.212121212f*iWidth+q,0.36878453f*iHeight);
  curveVertex(0.212121212f*iWidth+q,0.36878453f*iHeight);
  endShape(CLOSE);
  
  fill(198,160,139); //brown bear shape
  beginShape();
  curveVertex(0.702020202f*iWidth+q,0.070441989f*iHeight);
  curveVertex(0.702020202f*iWidth+q,0.070441989f*iHeight);
  curveVertex(0.659090909f*iWidth+q,0.075966851f*iHeight);
  curveVertex(0.608585859f*iWidth+q,0.071823204f*iHeight);
  curveVertex(0.573232323f*iWidth+q,0.075966851f*iHeight);
  curveVertex(0.532828283f*iWidth+q,0.064917127f*iHeight);
  curveVertex(0.515151515f*iWidth+q,0.071823204f*iHeight);
  curveVertex(0.5f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.497474747f*iWidth+q,0.099447514f*iHeight);
  curveVertex(0.502525253f*iWidth+q,0.107734807f*iHeight);
  curveVertex(0.51010101f*iWidth+q,0.110497238f*iHeight);
  curveVertex(0.497474747f*iWidth+q,0.13121547f*iHeight);
  curveVertex(0.487373737f*iWidth+q,0.14640884f*iHeight);
  curveVertex(0.487373737f*iWidth+q,0.174033149f*iHeight);
  curveVertex(0.492424242f*iWidth+q,0.185082873f*iHeight);
  curveVertex(0.502525253f*iWidth+q,0.198895028f*iHeight);
  curveVertex(0.505050505f*iWidth+q,0.20718232f*iHeight);
  curveVertex(0.507575758f*iWidth+q,0.218232044f*iHeight);
  curveVertex(0.497474747f*iWidth+q,0.25f*iHeight);
  curveVertex(0.477272727f*iWidth+q,0.328729282f*iHeight);
  curveVertex(0.474747475f*iWidth+q,0.364640884f*iHeight);
  curveVertex(0.446969697f*iWidth+q,0.382596685f*iHeight);
  curveVertex(0.441919192f*iWidth+q,0.41160221f*iHeight);
  curveVertex(0.441919192f*iWidth+q,0.436464088f*iHeight);
  curveVertex(0.441919192f*iWidth+q,0.473756906f*iHeight);
  curveVertex(0.449494949f*iWidth+q,0.517955801f*iHeight);
  curveVertex(0.449494949f*iWidth+q,0.537292818f*iHeight);
  curveVertex(0.444444444f*iWidth+q,0.535911602f*iHeight);
  curveVertex(0.441919192f*iWidth+q,0.566298343f*iHeight);
  curveVertex(0.439393939f*iWidth+q,0.596685083f*iHeight);
  curveVertex(0.436868687f*iWidth+q,0.620165746f*iHeight);
  curveVertex(0.436868687f*iWidth+q,0.649171271f*iHeight);
  curveVertex(0.467171717f*iWidth+q,0.723756906f*iHeight);
  curveVertex(0.46969697f*iWidth+q,0.754143646f*iHeight);
  curveVertex(0.46969697f*iWidth+q,0.788674033f*iHeight);
  curveVertex(0.431818182f*iWidth+q,0.802486188f*iHeight);
  curveVertex(0.416666667f*iWidth+q,0.821823204f*iHeight);
  curveVertex(0.416666667f*iWidth+q,0.854972376f*iHeight);
  curveVertex(0.431818182f*iWidth+q,0.878453039f*iHeight);
  curveVertex(0.446969697f*iWidth+q,0.895027624f*iHeight);
  curveVertex(0.452020202f*iWidth+q,0.91160221f*iHeight);
  curveVertex(0.462121212f*iWidth+q,0.930939227f*iHeight);
  curveVertex(0.47979798f*iWidth+q,0.95718232f*iHeight);
  curveVertex(0.532828283f*iWidth+q,0.970994475f*iHeight);
  curveVertex(0.560606061f*iWidth+q,0.973756906f*iHeight);
  curveVertex(0.606060606f*iWidth+q,0.976519337f*iHeight);
  curveVertex(0.641414141f*iWidth+q,0.975138122f*iHeight);
  curveVertex(0.727272727f*iWidth+q,0.975138122f*iHeight);
  curveVertex(0.777777778f*iWidth+q,0.976519337f*iHeight);
  curveVertex(0.856060606f*iWidth+q,0.973756906f*iHeight);
  curveVertex(0.896464646f*iWidth+q,0.965469613f*iHeight);
  curveVertex(0.954545455f*iWidth+q,0.925414365f*iHeight);
  curveVertex(0.97979798f*iWidth+q,0.892265193f*iHeight);
  curveVertex(0.98989899f*iWidth+q,0.863259669f*iHeight);
  curveVertex(0.987373737f*iWidth+q,0.832872928f*iHeight);
  curveVertex(0.972222222f*iWidth+q,0.812154696f*iHeight);
  curveVertex(0.929292929f*iWidth+q,0.783149171f*iHeight);
  curveVertex(0.941919192f*iWidth+q,0.725138122f*iHeight);
  curveVertex(0.952020202f*iWidth+q,0.665745856f*iHeight);
  curveVertex(0.957070707f*iWidth+q,0.621546961f*iHeight);
  curveVertex(0.95959596f*iWidth+q,0.566298343f*iHeight);
  curveVertex(0.946969697f*iWidth+q,0.526243094f*iHeight);
  curveVertex(0.944444444f*iWidth+q,0.505524862f*iHeight);
  curveVertex(0.952020202f*iWidth+q,0.45718232f*iHeight);
  curveVertex(0.957070707f*iWidth+q,0.430939227f*iHeight);
  curveVertex(0.949494949f*iWidth+q,0.383977901f*iHeight);
  curveVertex(0.921717172f*iWidth+q,0.337016575f*iHeight);
  curveVertex(0.911616162f*iWidth+q,0.284530387f*iHeight);
  curveVertex(0.893939394f*iWidth+q,0.193370166f*iHeight);
  curveVertex(0.909090909f*iWidth+q,0.165745856f*iHeight);
  curveVertex(0.914141414f*iWidth+q,0.133977901f*iHeight);
  curveVertex(0.911616162f*iWidth+q,0.120165746f*iHeight);
  curveVertex(0.896464646f*iWidth+q,0.104972376f*iHeight);
  curveVertex(0.901515152f*iWidth+q,0.096685083f*iHeight);
  curveVertex(0.914141414f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.898989899f*iWidth+q,0.069060773f*iHeight);
  curveVertex(0.883838384f*iWidth+q,0.062154696f*iHeight);
  curveVertex(0.845959596f*iWidth+q,0.059392265f*iHeight);
  curveVertex(0.810606061f*iWidth+q,0.067679558f*iHeight);
  curveVertex(0.810606061f*iWidth+q,0.078729282f*iHeight);
  curveVertex(0.805555556f*iWidth+q,0.071823204f*iHeight);
  curveVertex(0.777777778f*iWidth+q,0.071823204f*iHeight);
  curveVertex(0.755050505f*iWidth+q,0.071823204f*iHeight);
  curveVertex(0.707070707f*iWidth+q,0.069060773f*iHeight);
  curveVertex(0.707070707f*iWidth+q,0.069060773f*iHeight);
  endShape(CLOSE);
  
  fill(231,217,188);//bear light parts 1
  beginShape();
  curveVertex(0.441919192f*iWidth+q,0.451657459f*iHeight);
  curveVertex(0.441919192f*iWidth+q,0.451657459f*iHeight);
  curveVertex(0.474747475f*iWidth+q,0.493093923f*iHeight);
  curveVertex(0.5f*iWidth+q,0.51519337f*iHeight);
  curveVertex(0.505050505f*iWidth+q,0.540055249f*iHeight);
  curveVertex(0.51010101f*iWidth+q,0.556629834f*iHeight);
  curveVertex(0.47979798f*iWidth+q,0.560773481f*iHeight);
  curveVertex(0.462121212f*iWidth+q,0.555248619f*iHeight);
  curveVertex(0.452020202f*iWidth+q,0.527624309f*iHeight);
  curveVertex(0.452020202f*iWidth+q,0.527624309f*iHeight);
  endShape(CLOSE);
  
  beginShape();//bear light parts 2
  curveVertex(0.952020202f*iWidth+q,0.535911602f*iHeight);
  curveVertex(0.952020202f*iWidth+q,0.535911602f*iHeight);
  curveVertex(0.888888889f*iWidth+q,0.580110497f*iHeight);
  curveVertex(0.886363636f*iWidth+q,0.638121547f*iHeight);
  curveVertex(0.893939394f*iWidth+q,0.687845304f*iHeight);
  curveVertex(0.919191919f*iWidth+q,0.740331492f*iHeight);
  curveVertex(0.919191919f*iWidth+q,0.758287293f*iHeight);
  curveVertex(0.861111111f*iWidth+q,0.837016575f*iHeight);
  curveVertex(0.845959596f*iWidth+q,0.886740331f*iHeight);
  curveVertex(0.810606061f*iWidth+q,0.94198895f*iHeight);
  curveVertex(0.805555556f*iWidth+q,0.976519337f*iHeight);
  curveVertex(0.881313131f*iWidth+q,0.970994475f*iHeight);
  curveVertex(0.921717172f*iWidth+q,0.946132597f*iHeight);
  curveVertex(0.952020202f*iWidth+q,0.925414365f*iHeight);
  curveVertex(0.984848485f*iWidth+q,0.886740331f*iHeight);
  curveVertex(0.992424242f*iWidth+q,0.834254144f*iHeight);
  curveVertex(0.952020202f*iWidth+q,0.801104972f*iHeight);
  curveVertex(0.941919192f*iWidth+q,0.788674033f*iHeight);
  curveVertex(0.949494949f*iWidth+q,0.665745856f*iHeight);
  curveVertex(0.962121212f*iWidth+q,0.628453039f*iHeight);
  curveVertex(0.964646465f*iWidth+q,0.57320442f*iHeight);
  curveVertex(0.964646465f*iWidth+q,0.57320442f*iHeight);
  endShape(CLOSE);
  
  beginShape();//bear light parts 3
  curveVertex(0.946969697f*iWidth+q,0.389502762f*iHeight);
  curveVertex(0.946969697f*iWidth+q,0.389502762f*iHeight);
  curveVertex(0.906565657f*iWidth+q,0.429558011f*iHeight);
  curveVertex(0.858585859f*iWidth+q,0.464088398f*iHeight);
  curveVertex(0.830808081f*iWidth+q,0.512430939f*iHeight);
  curveVertex(0.808080808f*iWidth+q,0.563535912f*iHeight);
  curveVertex(0.936868687f*iWidth+q,0.555248619f*iHeight);
  curveVertex(0.944444444f*iWidth+q,0.506906077f*iHeight);
  curveVertex(0.964646465f*iWidth+q,0.439226519f*iHeight);
  curveVertex(0.964646465f*iWidth+q,0.439226519f*iHeight);
  endShape(CLOSE);
  
  fill(112,250,253); //blue sweater 1
  beginShape();
  curveVertex(0.093434343f*iWidth+q,0.461325967f*iHeight);
  curveVertex(0.093434343f*iWidth+q,0.461325967f*iHeight);
  curveVertex(0.078282828f*iWidth+q,0.473756906f*iHeight);
  curveVertex(0.151515152f*iWidth+q,0.487569061f*iHeight);
  curveVertex(0.242424242f*iWidth+q,0.490331492f*iHeight);
  curveVertex(0.292929293f*iWidth+q,0.490331492f*iHeight);
  curveVertex(0.313131313f*iWidth+q,0.486187845f*iHeight);
  curveVertex(0.406565657f*iWidth+q,0.486187845f*iHeight);
  curveVertex(0.444444444f*iWidth+q,0.486187845f*iHeight);
  curveVertex(0.441919192f*iWidth+q,0.466850829f*iHeight);
  curveVertex(0.381313131f*iWidth+q,0.468232044f*iHeight);
  curveVertex(0.328282828f*iWidth+q,0.46961326f*iHeight);
  curveVertex(0.300505051f*iWidth+q,0.470994475f*iHeight);
  curveVertex(0.257575758f*iWidth+q,0.470994475f*iHeight);
  curveVertex(0.212121212f*iWidth+q,0.46961326f*iHeight);
  curveVertex(0.164141414f*iWidth+q,0.468232044f*iHeight);
  curveVertex(0.128787879f*iWidth+q,0.462707182f*iHeight);
  curveVertex(0.095959596f*iWidth+q,0.462707182f*iHeight);
  curveVertex(0.095959596f*iWidth+q,0.462707182f*iHeight);
  endShape(CLOSE);
  
  beginShape(); //blue sweater 2
  curveVertex(0.20959596f*iWidth+q,0.142265193f*iHeight);
  curveVertex(0.20959596f*iWidth+q,0.142265193f*iHeight);
  curveVertex(0.214646465f*iWidth+q,0.149171271f*iHeight);
  curveVertex(0.217171717f*iWidth+q,0.174033149f*iHeight);
  curveVertex(0.237373737f*iWidth+q,0.193370166f*iHeight);
  curveVertex(0.28030303f*iWidth+q,0.198895028f*iHeight);
  curveVertex(0.287878788f*iWidth+q,0.201657459f*iHeight);
  curveVertex(0.320707071f*iWidth+q,0.187845304f*iHeight);
  curveVertex(0.340909091f*iWidth+q,0.178176796f*iHeight);
  curveVertex(0.343434343f*iWidth+q,0.157458564f*iHeight);
  curveVertex(0.343434343f*iWidth+q,0.145027624f*iHeight);
  curveVertex(0.335858586f*iWidth+q,0.139502762f*iHeight);
  curveVertex(0.353535354f*iWidth+q,0.149171271f*iHeight);
  curveVertex(0.356060606f*iWidth+q,0.171270718f*iHeight);
  curveVertex(0.351010101f*iWidth+q,0.183701657f*iHeight);
  curveVertex(0.333333333f*iWidth+q,0.19198895f*iHeight);
  curveVertex(0.325757576f*iWidth+q,0.196132597f*iHeight);
  curveVertex(0.320707071f*iWidth+q,0.200276243f*iHeight);
  curveVertex(0.313131313f*iWidth+q,0.208563536f*iHeight);
  curveVertex(0.305555556f*iWidth+q,0.218232044f*iHeight);
  curveVertex(0.300505051f*iWidth+q,0.229281768f*iHeight);
  curveVertex(0.29040404f*iWidth+q,0.243093923f*iHeight);
  curveVertex(0.287878788f*iWidth+q,0.255524862f*iHeight);
  curveVertex(0.265151515f*iWidth+q,0.232044199f*iHeight);
  curveVertex(0.262626263f*iWidth+q,0.215469613f*iHeight);
  curveVertex(0.257575758f*iWidth+q,0.20441989f*iHeight);
  curveVertex(0.244949495f*iWidth+q,0.201657459f*iHeight);
  curveVertex(0.21969697f*iWidth+q,0.194751381f*iHeight);
  curveVertex(0.217171717f*iWidth+q,0.200276243f*iHeight);
  curveVertex(0.202020202f*iWidth+q,0.187845304f*iHeight);
  curveVertex(0.199494949f*iWidth+q,0.156077348f*iHeight);
  curveVertex(0.207070707f*iWidth+q,0.145027624f*iHeight);
  curveVertex(0.207070707f*iWidth+q,0.145027624f*iHeight);
  endShape(CLOSE);
  
  //outlines of blue sweater
  line(0.25f*iWidth+q,0.363259669f*iHeight,0.232323232f*iWidth+q,0.309392265f*iHeight);
  line(0.285353535f*iWidth+q,0.388121547f*iHeight,0.282828283f*iWidth+q,0.361878453f*iHeight);
  line(0.318181818f*iWidth+q,0.356353591f*iHeight,0.303030303f*iWidth+q,0.302486188f*iHeight);
  line(0.23989899f*iWidth+q,0.30801105f*iHeight,0.303030303f*iWidth+q,0.303867403f*iHeight);
  line(0.23989899f*iWidth+q,0.306629834f*iHeight,0.169191919f*iWidth+q,0.301104972f*iHeight);
  line(0.123737374f*iWidth+q,0.302486188f*iHeight,0.171717172f*iWidth+q,0.302486188f*iHeight);
  line(0.121212121f*iWidth+q,0.303867403f*iHeight,0.146464646f*iWidth+q,0.256906077f*iHeight);
  line(0.315656566f*iWidth+q,0.337016575f*iHeight,0.338383838f*iWidth+q,0.332872928f*iHeight);
  line(0.353535354f*iWidth+q,0.328729282f*iHeight,0.393939394f*iWidth+q,0.327348066f*iHeight);
  line(0.393939394f*iWidth+q,0.327348066f*iHeight,0.414141414f*iWidth+q,0.306629834f*iHeight);
  line(0.416666667f*iWidth+q,0.305248619f*iHeight,0.411616162f*iWidth+q,0.29281768f*iHeight);
  line(0.411616162f*iWidth+q,0.284530387f*iHeight,0.416666667f*iWidth+q,0.254143646f*iHeight);
  
  fill(234,223,217); //hands 1
  beginShape();
  curveVertex(0.303030303f*iWidth+q,0.305248619f*iHeight);
  curveVertex(0.303030303f*iWidth+q,0.305248619f*iHeight);
  curveVertex(0.313131313f*iWidth+q,0.337016575f*iHeight);
  curveVertex(0.366161616f*iWidth+q,0.327348066f*iHeight);
  curveVertex(0.393939394f*iWidth+q,0.328729282f*iHeight);
  curveVertex(0.411616162f*iWidth+q,0.310773481f*iHeight);
  curveVertex(0.411616162f*iWidth+q,0.296961326f*iHeight);
  curveVertex(0.378787879f*iWidth+q,0.298342541f*iHeight);
  curveVertex(0.356060606f*iWidth+q,0.302486188f*iHeight);
  curveVertex(0.308080808f*iWidth+q,0.303867403f*iHeight);
  curveVertex(0.308080808f*iWidth+q,0.303867403f*iHeight);
  endShape(CLOSE);
  
  beginShape();//hands 2
  curveVertex(0.181818182f*iWidth+q,0.301104972f*iHeight);
  curveVertex(0.181818182f*iWidth+q,0.301104972f*iHeight);
  curveVertex(0.161616162f*iWidth+q,0.28038674f*iHeight);
  curveVertex(0.148989899f*iWidth+q,0.270718232f*iHeight);
  curveVertex(0.126262626f*iWidth+q,0.26519337f*iHeight);
  curveVertex(0.123737374f*iWidth+q,0.273480663f*iHeight);
  curveVertex(0.113636364f*iWidth+q,0.266574586f*iHeight);
  curveVertex(0.106060606f*iWidth+q,0.270718232f*iHeight);
  curveVertex(0.098484848f*iWidth+q,0.277624309f*iHeight);
  curveVertex(0.116161616f*iWidth+q,0.288674033f*iHeight);
  curveVertex(0.111111111f*iWidth+q,0.291436464f*iHeight);
  curveVertex(0.128787879f*iWidth+q,0.302486188f*iHeight);
  curveVertex(0.171717172f*iWidth+q,0.302486188f*iHeight);
  curveVertex(0.171717172f*iWidth+q,0.302486188f*iHeight);
  endShape(CLOSE);
  
  fill(97,121,159); //grey collar
  beginShape();
  curveVertex(0.277777778f*iWidth+q,0.279005525f*iHeight);
  curveVertex(0.277777778f*iWidth+q,0.279005525f*iHeight);
  curveVertex(0.277777778f*iWidth+q,0.261049724f*iHeight);
  curveVertex(0.25f*iWidth+q,0.227900552f*iHeight);
  curveVertex(0.247474747f*iWidth+q,0.212707182f*iHeight);
  curveVertex(0.176767677f*iWidth+q,0.20718232f*iHeight);
  curveVertex(0.164141414f*iWidth+q,0.20441989f*iHeight);
  curveVertex(0.176767677f*iWidth+q,0.19198895f*iHeight);
  curveVertex(0.181818182f*iWidth+q,0.164364641f*iHeight);
  curveVertex(0.196969697f*iWidth+q,0.147790055f*iHeight);
  curveVertex(0.207070707f*iWidth+q,0.142265193f*iHeight);
  curveVertex(0.204545455f*iWidth+q,0.151933702f*iHeight);
  curveVertex(0.196969697f*iWidth+q,0.160220994f*iHeight);
  curveVertex(0.196969697f*iWidth+q,0.17679558f*iHeight);
  curveVertex(0.199494949f*iWidth+q,0.190607735f*iHeight);
  curveVertex(0.21969697f*iWidth+q,0.198895028f*iHeight);
  curveVertex(0.232323232f*iWidth+q,0.200276243f*iHeight);
  curveVertex(0.255050505f*iWidth+q,0.205801105f*iHeight);
  curveVertex(0.267676768f*iWidth+q,0.222375691f*iHeight);
  curveVertex(0.275252525f*iWidth+q,0.238950276f*iHeight);
  curveVertex(0.282828283f*iWidth+q,0.247237569f*iHeight);
  curveVertex(0.287878788f*iWidth+q,0.241712707f*iHeight);
  curveVertex(0.300505051f*iWidth+q,0.226519337f*iHeight);
  curveVertex(0.313131313f*iWidth+q,0.214088398f*iHeight);
  curveVertex(0.320707071f*iWidth+q,0.20441989f*iHeight);
  curveVertex(0.330808081f*iWidth+q,0.198895028f*iHeight);
  curveVertex(0.335858586f*iWidth+q,0.194751381f*iHeight);
  curveVertex(0.343434343f*iWidth+q,0.189226519f*iHeight);
  curveVertex(0.356060606f*iWidth+q,0.183701657f*iHeight);
  curveVertex(0.356060606f*iWidth+q,0.174033149f*iHeight);
  curveVertex(0.353535354f*iWidth+q,0.160220994f*iHeight);
  curveVertex(0.351010101f*iWidth+q,0.151933702f*iHeight);
  curveVertex(0.340909091f*iWidth+q,0.140883978f*iHeight);
  curveVertex(0.348484848f*iWidth+q,0.139502762f*iHeight);
  curveVertex(0.363636364f*iWidth+q,0.151933702f*iHeight);
  curveVertex(0.373737374f*iWidth+q,0.160220994f*iHeight);
  curveVertex(0.391414141f*iWidth+q,0.171270718f*iHeight);
  curveVertex(0.398989899f*iWidth+q,0.189226519f*iHeight);
  curveVertex(0.401515152f*iWidth+q,0.194751381f*iHeight);
  curveVertex(0.378787879f*iWidth+q,0.196132597f*iHeight);
  curveVertex(0.361111111f*iWidth+q,0.197513812f*iHeight);
  curveVertex(0.351010101f*iWidth+q,0.203038674f*iHeight);
  curveVertex(0.335858586f*iWidth+q,0.214088398f*iHeight);
  curveVertex(0.318181818f*iWidth+q,0.232044199f*iHeight);
  curveVertex(0.300505051f*iWidth+q,0.255524862f*iHeight);
  curveVertex(0.303030303f*iWidth+q,0.272099448f*iHeight);
  curveVertex(0.303030303f*iWidth+q,0.272099448f*iHeight);
  endShape(CLOSE);
  
  fill(15,19,20); //hair
  beginShape();
  curveVertex(0.189393939f*iWidth+q,0.10359116f*iHeight);
  curveVertex(0.189393939f*iWidth+q,0.10359116f*iHeight);
  curveVertex(0.179292929f*iWidth+q,0.060773481f*iHeight);
  curveVertex(0.191919192f*iWidth+q,0.031767956f*iHeight);
  curveVertex(0.224747475f*iWidth+q,0.017955801f*iHeight);
  curveVertex(0.244949495f*iWidth+q,0.012430939f*iHeight);
  curveVertex(0.272727273f*iWidth+q,0.008287293f*iHeight);
  curveVertex(0.330808081f*iWidth+q,0.017955801f*iHeight);
  curveVertex(0.353535354f*iWidth+q,0.037292818f*iHeight);
  curveVertex(0.368686869f*iWidth+q,0.056629834f*iHeight);
  curveVertex(0.363636364f*iWidth+q,0.078729282f*iHeight);
  curveVertex(0.361111111f*iWidth+q,0.08839779f*iHeight);
  curveVertex(0.351010101f*iWidth+q,0.099447514f*iHeight);
  curveVertex(0.351010101f*iWidth+q,0.10359116f*iHeight);
  curveVertex(0.351010101f*iWidth+q,0.10359116f*iHeight);
  endShape(CLOSE);
  
  fill(213,199,188); //head
  beginShape();
  curveVertex(0.23989899f*iWidth+q,0.19198895f*iHeight);
  curveVertex(0.23989899f*iWidth+q,0.19198895f*iHeight);
  curveVertex(0.217171717f*iWidth+q,0.175414365f*iHeight);
  curveVertex(0.214646465f*iWidth+q,0.164364641f*iHeight);
  curveVertex(0.214646465f*iWidth+q,0.151933702f*iHeight);
  curveVertex(0.214646465f*iWidth+q,0.143646409f*iHeight);
  curveVertex(0.204545455f*iWidth+q,0.136740331f*iHeight);
  curveVertex(0.189393939f*iWidth+q,0.120165746f*iHeight);
  curveVertex(0.191919192f*iWidth+q,0.114640884f*iHeight);
  curveVertex(0.181818182f*iWidth+q,0.114640884f*iHeight);
  curveVertex(0.181818182f*iWidth+q,0.104972376f*iHeight);
  curveVertex(0.179292929f*iWidth+q,0.095303867f*iHeight);
  curveVertex(0.176767677f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.181818182f*iWidth+q,0.081491713f*iHeight);
  curveVertex(0.186868687f*iWidth+q,0.077348066f*iHeight);
  curveVertex(0.186868687f*iWidth+q,0.066298343f*iHeight);
  curveVertex(0.189393939f*iWidth+q,0.046961326f*iHeight);
  curveVertex(0.199494949f*iWidth+q,0.034530387f*iHeight);
  curveVertex(0.212121212f*iWidth+q,0.031767956f*iHeight);
  curveVertex(0.237373737f*iWidth+q,0.031767956f*iHeight);
  curveVertex(0.262626263f*iWidth+q,0.033149171f*iHeight);
  curveVertex(0.272727273f*iWidth+q,0.04281768f*iHeight);
  curveVertex(0.29040404f*iWidth+q,0.037292818f*iHeight);
  curveVertex(0.310606061f*iWidth+q,0.038674033f*iHeight);
  curveVertex(0.315656566f*iWidth+q,0.038674033f*iHeight);
  curveVertex(0.345959596f*iWidth+q,0.04558011f*iHeight);
  curveVertex(0.353535354f*iWidth+q,0.060773481f*iHeight);
  curveVertex(0.356060606f*iWidth+q,0.07320442f*iHeight);
  curveVertex(0.348484848f*iWidth+q,0.092541436f*iHeight);
  curveVertex(0.353535354f*iWidth+q,0.098066298f*iHeight);
  curveVertex(0.358585859f*iWidth+q,0.093922652f*iHeight);
  curveVertex(0.366161616f*iWidth+q,0.093922652f*iHeight);
  curveVertex(0.371212121f*iWidth+q,0.099447514f*iHeight);
  curveVertex(0.358585859f*iWidth+q,0.122928177f*iHeight);
  curveVertex(0.348484848f*iWidth+q,0.124309392f*iHeight);
  curveVertex(0.340909091f*iWidth+q,0.124309392f*iHeight);
  curveVertex(0.340909091f*iWidth+q,0.139502762f*iHeight);
  curveVertex(0.343434343f*iWidth+q,0.150552486f*iHeight);
  curveVertex(0.343434343f*iWidth+q,0.158839779f*iHeight);
  curveVertex(0.330808081f*iWidth+q,0.179558011f*iHeight);
  curveVertex(0.315656566f*iWidth+q,0.187845304f*iHeight);
  curveVertex(0.285353535f*iWidth+q,0.200276243f*iHeight);
  curveVertex(0.23989899f*iWidth+q,0.193370166f*iHeight);
  curveVertex(0.23989899f*iWidth+q,0.193370166f*iHeight);
  endShape(CLOSE);
  
  beginShape(); //glasses 1
  curveVertex(0.202020202f*iWidth+q,0.082872928f*iHeight);
  curveVertex(0.202020202f*iWidth+q,0.082872928f*iHeight);
  curveVertex(0.204545455f*iWidth+q,0.092541436f*iHeight);
  curveVertex(0.227272727f*iWidth+q,0.099447514f*iHeight);
  curveVertex(0.247474747f*iWidth+q,0.098066298f*iHeight);
  curveVertex(0.26010101f*iWidth+q,0.08839779f*iHeight);
  curveVertex(0.26010101f*iWidth+q,0.082872928f*iHeight);
  curveVertex(0.247474747f*iWidth+q,0.078729282f*iHeight);
  curveVertex(0.222222222f*iWidth+q,0.075966851f*iHeight);
  curveVertex(0.204545455f*iWidth+q,0.080110497f*iHeight);
  curveVertex(0.204545455f*iWidth+q,0.080110497f*iHeight);
  endShape(CLOSE);
  
  beginShape(); //glasses 2
  curveVertex(0.272727273f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.272727273f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.282828283f*iWidth+q,0.095303867f*iHeight);
  curveVertex(0.287878788f*iWidth+q,0.100828729f*iHeight);
  curveVertex(0.313131313f*iWidth+q,0.102209945f*iHeight);
  curveVertex(0.330808081f*iWidth+q,0.100828729f*iHeight);
  curveVertex(0.333333333f*iWidth+q,0.087016575f*iHeight);
  curveVertex(0.328282828f*iWidth+q,0.081491713f*iHeight);
  curveVertex(0.308080808f*iWidth+q,0.080110497f*iHeight);
  curveVertex(0.282828283f*iWidth+q,0.080110497f*iHeight);
  curveVertex(0.272727273f*iWidth+q,0.084254144f*iHeight);
  curveVertex(0.272727273f*iWidth+q,0.084254144f*iHeight);
  endShape(CLOSE);
  
  //glasses frame
  line(0.26010101f*iWidth+q,0.085635359f*iHeight,0.277777778f*iWidth+q,0.087016575f*iHeight);
  line(0.333333333f*iWidth+q,0.085635359f*iHeight,0.356060606f*iWidth+q,0.085635359f*iHeight);
  line(0.204545455f*iWidth+q,0.084254144f*iHeight,0.179292929f*iWidth+q,0.075966851f*iHeight);
  
  fill(245,246,250); //teeth
  beginShape();
  curveVertex(0.23989899f*iWidth+q,0.127071823f*iHeight);
  curveVertex(0.23989899f*iWidth+q,0.127071823f*iHeight);
  curveVertex(0.23989899f*iWidth+q,0.122928177f*iHeight);
  curveVertex(0.255050505f*iWidth+q,0.121546961f*iHeight);
  curveVertex(0.272727273f*iWidth+q,0.121546961f*iHeight);
  curveVertex(0.292929293f*iWidth+q,0.122928177f*iHeight);
  curveVertex(0.29040404f*iWidth+q,0.127071823f*iHeight);
  curveVertex(0.272727273f*iWidth+q,0.128453039f*iHeight);
  curveVertex(0.25f*iWidth+q,0.128453039f*iHeight);
  curveVertex(0.244949495f*iWidth+q,0.128453039f*iHeight);
  curveVertex(0.244949495f*iWidth+q,0.128453039f*iHeight);
  endShape(CLOSE);
  
  fill(174,174,176); //glasses
  beginShape();
  curveVertex(0.222222222f*iWidth+q,0.071823204f*iHeight);
  curveVertex(0.222222222f*iWidth+q,0.071823204f*iHeight);
  curveVertex(0.204545455f*iWidth+q,0.075966851f*iHeight);
  curveVertex(0.212121212f*iWidth+q,0.069060773f*iHeight);
  curveVertex(0.22979798f*iWidth+q,0.067679558f*iHeight);
  curveVertex(0.244949495f*iWidth+q,0.069060773f*iHeight);
  curveVertex(0.252525253f*iWidth+q,0.074585635f*iHeight);
  curveVertex(0.242424242f*iWidth+q,0.071823204f*iHeight);
  curveVertex(0.222222222f*iWidth+q,0.071823204f*iHeight);
  curveVertex(0.222222222f*iWidth+q,0.071823204f*iHeight);
  endShape(CLOSE);
  
  beginShape(); //glasses 2
  curveVertex(0.282828283f*iWidth+q,0.078729282f*iHeight);
  curveVertex(0.282828283f*iWidth+q,0.078729282f*iHeight);
  curveVertex(0.297979798f*iWidth+q,0.07320442f*iHeight);
  curveVertex(0.313131313f*iWidth+q,0.07320442f*iHeight);
  curveVertex(0.328282828f*iWidth+q,0.075966851f*iHeight);
  curveVertex(0.338383838f*iWidth+q,0.081491713f*iHeight);
  curveVertex(0.320707071f*iWidth+q,0.077348066f*iHeight);
  curveVertex(0.308080808f*iWidth+q,0.077348066f*iHeight);
  curveVertex(0.297979798f*iWidth+q,0.077348066f*iHeight);
  curveVertex(0.287878788f*iWidth+q,0.078729282f*iHeight);
  curveVertex(0.287878788f*iWidth+q,0.078729282f*iHeight);
  endShape(CLOSE);
  
  fill(218,208,216); //white eyes 1
  beginShape();
  curveVertex(0.224747475f*iWidth+q,0.080110497f*iHeight);
  curveVertex(0.224747475f*iWidth+q,0.080110497f*iHeight);
  curveVertex(0.207070707f*iWidth+q,0.084254144f*iHeight);
  curveVertex(0.227272727f*iWidth+q,0.087016575f*iHeight);
  curveVertex(0.242424242f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.22979798f*iWidth+q,0.080110497f*iHeight);
  curveVertex(0.22979798f*iWidth+q,0.080110497f*iHeight);
  endShape(CLOSE);
  
  beginShape(); //white eyes 2
  curveVertex(0.308080808f*iWidth+q,0.082872928f*iHeight);
  curveVertex(0.308080808f*iWidth+q,0.082872928f*iHeight);
  curveVertex(0.297979798f*iWidth+q,0.082872928f*iHeight);
  curveVertex(0.292929293f*iWidth+q,0.08839779f*iHeight);
  curveVertex(0.305555556f*iWidth+q,0.08839779f*iHeight);
  curveVertex(0.318181818f*iWidth+q,0.089779006f*iHeight);
  curveVertex(0.328282828f*iWidth+q,0.089779006f*iHeight);
  curveVertex(0.315656566f*iWidth+q,0.084254144f*iHeight);
  curveVertex(0.315656566f*iWidth+q,0.084254144f*iHeight);
  endShape(CLOSE);
  
  fill(44,34,42); //black eyes 1
  beginShape();
  curveVertex(0.222222222f*iWidth+q,0.081491713f*iHeight);
  curveVertex(0.222222222f*iWidth+q,0.081491713f*iHeight);
  curveVertex(0.224747475f*iWidth+q,0.084254144f*iHeight);
  curveVertex(0.237373737f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.237373737f*iWidth+q,0.081491713f*iHeight);
  curveVertex(0.237373737f*iWidth+q,0.081491713f*iHeight);
  endShape(CLOSE);
  
  beginShape(); //black eyes 2
  curveVertex(0.300505051f*iWidth+q,0.084254144f*iHeight);
  curveVertex(0.300505051f*iWidth+q,0.084254144f*iHeight);
  curveVertex(0.300505051f*iWidth+q,0.08839779f*iHeight);
  curveVertex(0.310606061f*iWidth+q,0.089779006f*iHeight);
  curveVertex(0.313131313f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.305555556f*iWidth+q,0.084254144f*iHeight);
  curveVertex(0.305555556f*iWidth+q,0.084254144f*iHeight);
  endShape(CLOSE);
  
  fill(44,35,40);//white interior eyes 1
  beginShape();
  curveVertex(0.227272727f*iWidth+q,0.081491713f*iHeight);
  curveVertex(0.227272727f*iWidth+q,0.081491713f*iHeight);
  curveVertex(0.227272727f*iWidth+q,0.081491713f*iHeight);
  endShape(CLOSE);
  
  beginShape();//white interior eyes 2
  curveVertex(0.305555556f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.305555556f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.305555556f*iWidth+q,0.085635359f*iHeight);
  endShape(CLOSE);
  
  fill(26,18,16); // bear mouth
  beginShape();
  curveVertex(0.659090909f*iWidth+q,0.124309392f*iHeight);
  curveVertex(0.659090909f*iWidth+q,0.124309392f*iHeight);
  curveVertex(0.633838384f*iWidth+q,0.156077348f*iHeight);
  curveVertex(0.641414141f*iWidth+q,0.178176796f*iHeight);
  curveVertex(0.661616162f*iWidth+q,0.180939227f*iHeight);
  curveVertex(0.691919192f*iWidth+q,0.183701657f*iHeight);
  curveVertex(0.72979798f*iWidth+q,0.180939227f*iHeight);
  curveVertex(0.744949495f*iWidth+q,0.17679558f*iHeight);
  curveVertex(0.744949495f*iWidth+q,0.16160221f*iHeight);
  curveVertex(0.752525253f*iWidth+q,0.149171271f*iHeight);
  curveVertex(0.752525253f*iWidth+q,0.132596685f*iHeight);
  curveVertex(0.757575758f*iWidth+q,0.128453039f*iHeight);
  curveVertex(0.742424242f*iWidth+q,0.122928177f*iHeight);
  curveVertex(0.742424242f*iWidth+q,0.122928177f*iHeight);
  endShape(CLOSE);
  
  fill(209,194,155); // bear teeth top
  beginShape();
  curveVertex(0.656565657f*iWidth+q,0.124309392f*iHeight);
  curveVertex(0.656565657f*iWidth+q,0.124309392f*iHeight);
  curveVertex(0.654040404f*iWidth+q,0.143646409f*iHeight);
  curveVertex(0.666666667f*iWidth+q,0.154696133f*iHeight);
  curveVertex(0.671717172f*iWidth+q,0.153314917f*iHeight);
  curveVertex(0.679292929f*iWidth+q,0.136740331f*iHeight);
  curveVertex(0.684343434f*iWidth+q,0.120165746f*iHeight);
  curveVertex(0.679292929f*iWidth+q,0.133977901f*iHeight);
  curveVertex(0.684343434f*iWidth+q,0.138121547f*iHeight);
  curveVertex(0.694444444f*iWidth+q,0.133977901f*iHeight);
  curveVertex(0.694444444f*iWidth+q,0.122928177f*iHeight);
  curveVertex(0.689393939f*iWidth+q,0.135359116f*iHeight);
  curveVertex(0.699494949f*iWidth+q,0.132596685f*iHeight);
  curveVertex(0.704545455f*iWidth+q,0.125690608f*iHeight);
  curveVertex(0.704545455f*iWidth+q,0.132596685f*iHeight);
  curveVertex(0.707070707f*iWidth+q,0.133977901f*iHeight);
  curveVertex(0.714646465f*iWidth+q,0.125690608f*iHeight);
  curveVertex(0.714646465f*iWidth+q,0.136740331f*iHeight);
  curveVertex(0.71969697f*iWidth+q,0.140883978f*iHeight);
  curveVertex(0.724747475f*iWidth+q,0.136740331f*iHeight);
  curveVertex(0.732323232f*iWidth+q,0.125690608f*iHeight);
  curveVertex(0.72979798f*iWidth+q,0.136740331f*iHeight);
  curveVertex(0.732323232f*iWidth+q,0.151933702f*iHeight);
  curveVertex(0.744949495f*iWidth+q,0.147790055f*iHeight);
  curveVertex(0.755050505f*iWidth+q,0.138121547f*iHeight);
  curveVertex(0.757575758f*iWidth+q,0.128453039f*iHeight);
  curveVertex(0.75f*iWidth+q,0.121546961f*iHeight);
  curveVertex(0.722222222f*iWidth+q,0.121546961f*iHeight);
  curveVertex(0.691919192f*iWidth+q,0.11878453f*iHeight);
  curveVertex(0.656565657f*iWidth+q,0.124309392f*iHeight);
  curveVertex(0.656565657f*iWidth+q,0.124309392f*iHeight);
  endShape(CLOSE);
  
  beginShape();  // bear teeth bottom
  curveVertex(0.654040404f*iWidth+q,0.182320442f*iHeight);
  curveVertex(0.654040404f*iWidth+q,0.182320442f*iHeight);
  curveVertex(0.671717172f*iWidth+q,0.165745856f*iHeight);
  curveVertex(0.681818182f*iWidth+q,0.168508287f*iHeight);
  curveVertex(0.679292929f*iWidth+q,0.182320442f*iHeight);
  curveVertex(0.684343434f*iWidth+q,0.17679558f*iHeight);
  curveVertex(0.686868687f*iWidth+q,0.17679558f*iHeight);
  curveVertex(0.686868687f*iWidth+q,0.183701657f*iHeight);
  curveVertex(0.691919192f*iWidth+q,0.179558011f*iHeight);
  curveVertex(0.696969697f*iWidth+q,0.17679558f*iHeight);
  curveVertex(0.699494949f*iWidth+q,0.182320442f*iHeight);
  curveVertex(0.704545455f*iWidth+q,0.179558011f*iHeight);
  curveVertex(0.707070707f*iWidth+q,0.174033149f*iHeight);
  curveVertex(0.707070707f*iWidth+q,0.180939227f*iHeight);
  curveVertex(0.717171717f*iWidth+q,0.180939227f*iHeight);
  curveVertex(0.717171717f*iWidth+q,0.175414365f*iHeight);
  curveVertex(0.722222222f*iWidth+q,0.182320442f*iHeight);
  curveVertex(0.727272727f*iWidth+q,0.175414365f*iHeight);
  curveVertex(0.734848485f*iWidth+q,0.164364641f*iHeight);
  curveVertex(0.744949495f*iWidth+q,0.175414365f*iHeight);
  curveVertex(0.744949495f*iWidth+q,0.179558011f*iHeight);
  curveVertex(0.732323232f*iWidth+q,0.182320442f*iHeight);
  curveVertex(0.694444444f*iWidth+q,0.182320442f*iHeight);
  curveVertex(0.664141414f*iWidth+q,0.183701657f*iHeight);
  curveVertex(0.664141414f*iWidth+q,0.183701657f*iHeight);
  endShape(CLOSE);
  
  fill(67,96,114);//bear nose
  beginShape();
  curveVertex(0.702020202f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.702020202f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.681818182f*iWidth+q,0.080110497f*iHeight);
  curveVertex(0.661616162f*iWidth+q,0.069060773f*iHeight);
  curveVertex(0.674242424f*iWidth+q,0.05801105f*iHeight);
  curveVertex(0.699494949f*iWidth+q,0.055248619f*iHeight);
  curveVertex(0.734848485f*iWidth+q,0.056629834f*iHeight);
  curveVertex(0.744949495f*iWidth+q,0.069060773f*iHeight);
  curveVertex(0.734848485f*iWidth+q,0.078729282f*iHeight);
  curveVertex(0.70959596f*iWidth+q,0.084254144f*iHeight);
  curveVertex(0.702020202f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.702020202f*iWidth+q,0.085635359f*iHeight);
  endShape(CLOSE);
  
  fill(38,31,38);//bear ears
  beginShape();
  curveVertex(0.52020202f*iWidth+q,0.099447514f*iHeight);
  curveVertex(0.52020202f*iWidth+q,0.099447514f*iHeight);
  curveVertex(0.502525253f*iWidth+q,0.093922652f*iHeight);
  curveVertex(0.512626263f*iWidth+q,0.081491713f*iHeight);
  curveVertex(0.53030303f*iWidth+q,0.07320442f*iHeight);
  curveVertex(0.550505051f*iWidth+q,0.07320442f*iHeight);
  curveVertex(0.563131313f*iWidth+q,0.081491713f*iHeight);
  curveVertex(0.537878788f*iWidth+q,0.091160221f*iHeight);
  curveVertex(0.522727273f*iWidth+q,0.099447514f*iHeight);
  curveVertex(0.522727273f*iWidth+q,0.099447514f*iHeight);
  endShape(CLOSE);
  
  //bear lines
  line(0.46969697f*iWidth+q,0.772099448f*iHeight,0.472222222f*iWidth+q,0.832872928f*iHeight);
  line(0.606060606f*iWidth+q,0.850828729f*iHeight,0.626262626f*iWidth+q,0.825966851f*iHeight);
  line(0.626262626f*iWidth+q,0.814917127f*iHeight,0.636363636f*iWidth+q,0.767955801f*iHeight);
  line(0.638888889f*iWidth+q,0.756906077f*iHeight,0.641414141f*iWidth+q,0.675414365f*iHeight);
  line(0.641414141f*iWidth+q,0.672651934f*iHeight,0.674242424f*iWidth+q,0.69198895f*iHeight);
  line(0.676767677f*iWidth+q,0.690607735f*iHeight,0.689393939f*iWidth+q,0.689226519f*iHeight);
  line(0.689393939f*iWidth+q,0.689226519f*iHeight,0.714646465f*iWidth+q,0.67679558f*iHeight);
  line(0.722222222f*iWidth+q,0.678176796f*iHeight,0.717171717f*iWidth+q,0.701657459f*iHeight);
  line(0.722222222f*iWidth+q,0.703038674f*iHeight,0.755050505f*iWidth+q,0.798342541f*iHeight);
  line(0.755050505f*iWidth+q,0.799723757f*iHeight,0.767676768f*iWidth+q,0.856353591f*iHeight);
  line(0.921717172f*iWidth+q,0.841160221f*iHeight,0.929292929f*iWidth+q,0.769337017f*iHeight);
  line(0.633838384f*iWidth+q,0.756906077f*iHeight,0.742424242f*iWidth+q,0.761049724f*iHeight);
  
  beginShape();
  curveVertex(0.828282828f*iWidth+q,0.074585635f*iHeight);
  curveVertex(0.828282828f*iWidth+q,0.074585635f*iHeight);
  curveVertex(0.853535354f*iWidth+q,0.069060773f*iHeight);
  curveVertex(0.883838384f*iWidth+q,0.074585635f*iHeight);
  curveVertex(0.891414141f*iWidth+q,0.081491713f*iHeight);
  curveVertex(0.893939394f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.893939394f*iWidth+q,0.096685083f*iHeight);
  curveVertex(0.873737374f*iWidth+q,0.085635359f*iHeight);
  curveVertex(0.838383838f*iWidth+q,0.077348066f*iHeight);
  curveVertex(0.838383838f*iWidth+q,0.077348066f*iHeight);
  endShape(CLOSE);
  
  beginShape(); //bear eyes 1
  curveVertex(0.643939394f*iWidth+q,0.089779006f*iHeight);
  curveVertex(0.643939394f*iWidth+q,0.089779006f*iHeight);
  curveVertex(0.628787879f*iWidth+q,0.092541436f*iHeight);
  curveVertex(0.626262626f*iWidth+q,0.096685083f*iHeight);
  curveVertex(0.631313131f*iWidth+q,0.100828729f*iHeight);
  curveVertex(0.638888889f*iWidth+q,0.093922652f*iHeight);
  curveVertex(0.643939394f*iWidth+q,0.089779006f*iHeight);
  curveVertex(0.643939394f*iWidth+q,0.089779006f*iHeight);
  endShape(CLOSE);
  
  beginShape(); //bear eyes 2
  curveVertex(0.767676768f*iWidth+q,0.091160221f*iHeight);
  curveVertex(0.767676768f*iWidth+q,0.091160221f*iHeight);
  curveVertex(0.772727273f*iWidth+q,0.093922652f*iHeight);
  curveVertex(0.777777778f*iWidth+q,0.092541436f*iHeight);
  curveVertex(0.775252525f*iWidth+q,0.08839779f*iHeight);
  curveVertex(0.77020202f*iWidth+q,0.087016575f*iHeight);
  curveVertex(0.767676768f*iWidth+q,0.091160221f*iHeight);
  curveVertex(0.767676768f*iWidth+q,0.091160221f*iHeight);
  endShape(CLOSE);
  
  beginShape(); //bear claws 1
  curveVertex(0.462121212f*iWidth+q,0.559392265f*iHeight);
  curveVertex(0.462121212f*iWidth+q,0.559392265f*iHeight);
  curveVertex(0.477272727f*iWidth+q,0.592541436f*iHeight);
  curveVertex(0.487373737f*iWidth+q,0.589779006f*iHeight);
  curveVertex(0.494949495f*iWidth+q,0.578729282f*iHeight);
  curveVertex(0.487373737f*iWidth+q,0.562154696f*iHeight);
  curveVertex(0.492424242f*iWidth+q,0.58839779f*iHeight);
  curveVertex(0.505050505f*iWidth+q,0.595303867f*iHeight);
  curveVertex(0.517676768f*iWidth+q,0.591160221f*iHeight);
  curveVertex(0.52020202f*iWidth+q,0.580110497f*iHeight);
  curveVertex(0.52020202f*iWidth+q,0.563535912f*iHeight);
  curveVertex(0.52020202f*iWidth+q,0.587016575f*iHeight);
  curveVertex(0.527777778f*iWidth+q,0.596685083f*iHeight);
  curveVertex(0.537878788f*iWidth+q,0.591160221f*iHeight);
  curveVertex(0.542929293f*iWidth+q,0.574585635f*iHeight);
  curveVertex(0.542929293f*iWidth+q,0.562154696f*iHeight);
  curveVertex(0.545454545f*iWidth+q,0.578729282f*iHeight);
  curveVertex(0.555555556f*iWidth+q,0.596685083f*iHeight);
  curveVertex(0.563131313f*iWidth+q,0.595303867f*iHeight);
  curveVertex(0.568181818f*iWidth+q,0.577348066f*iHeight);
  curveVertex(0.570707071f*iWidth+q,0.567679558f*iHeight);
  curveVertex(0.575757576f*iWidth+q,0.577348066f*iHeight);
  curveVertex(0.578282828f*iWidth+q,0.595303867f*iHeight);
  curveVertex(0.585858586f*iWidth+q,0.596685083f*iHeight);
  curveVertex(0.593434343f*iWidth+q,0.582872928f*iHeight);
  curveVertex(0.595959596f*iWidth+q,0.560773481f*iHeight);
  curveVertex(0.595959596f*iWidth+q,0.560773481f*iHeight);
  endShape(CLOSE);
  
  beginShape(); //bear claws 2
  curveVertex(0.797979798f*iWidth+q,0.562154696f*iHeight);
  curveVertex(0.797979798f*iWidth+q,0.562154696f*iHeight);
  curveVertex(0.815656566f*iWidth+q,0.598066298f*iHeight);
  curveVertex(0.830808081f*iWidth+q,0.587016575f*iHeight);
  curveVertex(0.828282828f*iWidth+q,0.566298343f*iHeight);
  curveVertex(0.830808081f*iWidth+q,0.582872928f*iHeight);
  curveVertex(0.835858586f*iWidth+q,0.596685083f*iHeight);
  curveVertex(0.843434343f*iWidth+q,0.598066298f*iHeight);
  curveVertex(0.851010101f*iWidth+q,0.592541436f*iHeight);
  curveVertex(0.861111111f*iWidth+q,0.577348066f*iHeight);
  curveVertex(0.861111111f*iWidth+q,0.562154696f*iHeight);
  curveVertex(0.861111111f*iWidth+q,0.581491713f*iHeight);
  curveVertex(0.868686869f*iWidth+q,0.593922652f*iHeight);
  curveVertex(0.876262626f*iWidth+q,0.595303867f*iHeight);
  curveVertex(0.883838384f*iWidth+q,0.589779006f*iHeight);
  curveVertex(0.886363636f*iWidth+q,0.574585635f*iHeight);
  curveVertex(0.891414141f*iWidth+q,0.564917127f*iHeight);
  curveVertex(0.888888889f*iWidth+q,0.587016575f*iHeight);
  curveVertex(0.898989899f*iWidth+q,0.595303867f*iHeight);
  curveVertex(0.906565657f*iWidth+q,0.591160221f*iHeight);
  curveVertex(0.916666667f*iWidth+q,0.578729282f*iHeight);
  curveVertex(0.916666667f*iWidth+q,0.563535912f*iHeight);
  curveVertex(0.921717172f*iWidth+q,0.577348066f*iHeight);
  curveVertex(0.919191919f*iWidth+q,0.589779006f*iHeight);
  curveVertex(0.926767677f*iWidth+q,0.587016575f*iHeight);
  curveVertex(0.929292929f*iWidth+q,0.571823204f*iHeight);
  curveVertex(0.931818182f*iWidth+q,0.559392265f*iHeight);
  curveVertex(0.936868687f*iWidth+q,0.555248619f*iHeight);
  curveVertex(0.936868687f*iWidth+q,0.555248619f*iHeight);
  endShape(CLOSE);

  beginShape(); //bear claws 3
  curveVertex(0.467171717f*iWidth+q,0.825966851f*iHeight);
  curveVertex(0.467171717f*iWidth+q,0.825966851f*iHeight);
  curveVertex(0.47979798f*iWidth+q,0.848066298f*iHeight);
  curveVertex(0.497474747f*iWidth+q,0.870165746f*iHeight);
  curveVertex(0.502525253f*iWidth+q,0.854972376f*iHeight);
  curveVertex(0.502525253f*iWidth+q,0.824585635f*iHeight);
  curveVertex(0.507575758f*iWidth+q,0.859116022f*iHeight);
  curveVertex(0.52020202f*iWidth+q,0.86878453f*iHeight);
  curveVertex(0.527777778f*iWidth+q,0.864640884f*iHeight);
  curveVertex(0.53030303f*iWidth+q,0.841160221f*iHeight);
  curveVertex(0.53030303f*iWidth+q,0.821823204f*iHeight);
  curveVertex(0.532828283f*iWidth+q,0.83839779f*iHeight);
  curveVertex(0.532828283f*iWidth+q,0.860497238f*iHeight);
  curveVertex(0.545454545f*iWidth+q,0.870165746f*iHeight);
  curveVertex(0.558080808f*iWidth+q,0.866022099f*iHeight);
  curveVertex(0.558080808f*iWidth+q,0.846685083f*iHeight);
  curveVertex(0.558080808f*iWidth+q,0.821823204f*iHeight);
  curveVertex(0.558080808f*iWidth+q,0.846685083f*iHeight);
  curveVertex(0.563131313f*iWidth+q,0.864640884f*iHeight);
  curveVertex(0.565656566f*iWidth+q,0.867403315f*iHeight);
  curveVertex(0.578282828f*iWidth+q,0.856353591f*iHeight);
  curveVertex(0.580808081f*iWidth+q,0.841160221f*iHeight);
  curveVertex(0.588383838f*iWidth+q,0.82320442f*iHeight);
  curveVertex(0.585858586f*iWidth+q,0.843922652f*iHeight);
  curveVertex(0.588383838f*iWidth+q,0.861878453f*iHeight);
  curveVertex(0.595959596f*iWidth+q,0.859116022f*iHeight);
  curveVertex(0.606060606f*iWidth+q,0.849447514f*iHeight);
  curveVertex(0.611111111f*iWidth+q,0.835635359f*iHeight);
  curveVertex(0.611111111f*iWidth+q,0.824585635f*iHeight);
  curveVertex(0.611111111f*iWidth+q,0.824585635f*iHeight);
  endShape(CLOSE);
  
  beginShape();//bear claws 4
  curveVertex(0.762626263f*iWidth+q,0.83839779f*iHeight);
  curveVertex(0.762626263f*iWidth+q,0.83839779f*iHeight);
  curveVertex(0.777777778f*iWidth+q,0.874309392f*iHeight);
  curveVertex(0.785353535f*iWidth+q,0.878453039f*iHeight);
  curveVertex(0.800505051f*iWidth+q,0.852209945f*iHeight);
  curveVertex(0.792929293f*iWidth+q,0.835635359f*iHeight);
  curveVertex(0.797979798f*iWidth+q,0.860497238f*iHeight);
  curveVertex(0.795454545f*iWidth+q,0.88121547f*iHeight);
  curveVertex(0.813131313f*iWidth+q,0.88121547f*iHeight);
  curveVertex(0.823232323f*iWidth+q,0.861878453f*iHeight);
  curveVertex(0.825757576f*iWidth+q,0.841160221f*iHeight);
  curveVertex(0.828282828f*iWidth+q,0.83839779f*iHeight);
  curveVertex(0.828282828f*iWidth+q,0.85359116f*iHeight);
  curveVertex(0.825757576f*iWidth+q,0.872928177f*iHeight);
  curveVertex(0.823232323f*iWidth+q,0.885359116f*iHeight);
  curveVertex(0.840909091f*iWidth+q,0.886740331f*iHeight);
  curveVertex(0.851010101f*iWidth+q,0.872928177f*iHeight);
  curveVertex(0.848484848f*iWidth+q,0.839779006f*iHeight);
  curveVertex(0.856060606f*iWidth+q,0.839779006f*iHeight);
  curveVertex(0.851010101f*iWidth+q,0.866022099f*iHeight);
  curveVertex(0.851010101f*iWidth+q,0.882596685f*iHeight);
  curveVertex(0.861111111f*iWidth+q,0.886740331f*iHeight);
  curveVertex(0.871212121f*iWidth+q,0.882596685f*iHeight);
  curveVertex(0.878787879f*iWidth+q,0.861878453f*iHeight);
  curveVertex(0.881313131f*iWidth+q,0.843922652f*iHeight);
  curveVertex(0.886363636f*iWidth+q,0.841160221f*iHeight);
  curveVertex(0.891414141f*iWidth+q,0.86878453f*iHeight);
  curveVertex(0.893939394f*iWidth+q,0.888121547f*iHeight);
  curveVertex(0.904040404f*iWidth+q,0.885359116f*iHeight);
  curveVertex(0.919191919f*iWidth+q,0.861878453f*iHeight);
  curveVertex(0.919191919f*iWidth+q,0.842541436f*iHeight);
  curveVertex(0.919191919f*iWidth+q,0.842541436f*iHeight);
  endShape(CLOSE);

  stroke(137,148,144); // pants wrinkles
  line(0.138888889f*iWidth+q,0.832872928f*iHeight,0.174242424f*iWidth+q,0.828729282f*iHeight);
  line(0.174242424f*iWidth+q,0.828729282f*iHeight,0.207070707f*iWidth+q,0.803867403f*iHeight);
  line(0.217171717f*iWidth+q,0.796961326f*iHeight,0.207070707f*iWidth+q,0.720994475f*iHeight);
  line(0.116161616f*iWidth+q,0.846685083f*iHeight,0.101010101f*iWidth+q,0.817679558f*iHeight);
  line(0.156565657f*iWidth+q,0.820441989f*iHeight,0.111111111f*iWidth+q,0.816298343f*iHeight);
  line(0.101010101f*iWidth+q,0.846685083f*iHeight,0.118686869f*iWidth+q,0.850828729f*iHeight);
  line(0.161616162f*iWidth+q,0.854972376f*iHeight,0.123737374f*iWidth+q,0.85359116f*iHeight);
  line(0.108585859f*iWidth+q,0.716850829f*iHeight,0.20959596f*iWidth+q,0.696132597f*iHeight);
  line(0.123737374f*iWidth+q,0.71961326f*iHeight,0.189393939f*iWidth+q,0.727900552f*iHeight);
  line(0.116161616f*iWidth+q,0.726519337f*iHeight,0.106060606f*iWidth+q,0.773480663f*iHeight);
  line(0.166666667f*iWidth+q,0.79281768f*iHeight,0.191919192f*iWidth+q,0.763812155f*iHeight);
  line(0.164141414f*iWidth+q,0.747237569f*iHeight,0.159090909f*iWidth+q,0.79281768f*iHeight);
  line(0.184343434f*iWidth+q,0.837016575f*iHeight,0.212121212f*iWidth+q,0.835635359f*iHeight);
  line(0.174242424f*iWidth+q,0.651933702f*iHeight,0.217171717f*iWidth+q,0.632596685f*iHeight);
  line(0.217171717f*iWidth+q,0.685082873f*iHeight,0.224747475f*iWidth+q,0.647790055f*iHeight);
  line(0.242424242f*iWidth+q,0.595303867f*iHeight,0.232323232f*iWidth+q,0.642265193f*iHeight);
  line(0.169191919f*iWidth+q,0.613259669f*iHeight,0.234848485f*iWidth+q,0.593922652f*iHeight);
  line(0.159090909f*iWidth+q,0.589779006f*iHeight,0.212121212f*iWidth+q,0.592541436f*iHeight);
  line(0.164141414f*iWidth+q,0.577348066f*iHeight,0.202020202f*iWidth+q,0.567679558f*iHeight);
  line(0.126262626f*iWidth+q,0.650552486f*iHeight,0.169191919f*iWidth+q,0.657458564f*iHeight);
  line(0.108585859f*iWidth+q,0.611878453f*iHeight,0.141414141f*iWidth+q,0.624309392f*iHeight);
  line(0.151515152f*iWidth+q,0.535911602f*iHeight,0.169191919f*iWidth+q,0.566298343f*iHeight);
  line(0.143939394f*iWidth+q,0.523480663f*iHeight,0.207070707f*iWidth+q,0.541436464f*iHeight);
  line(0.098484848f*iWidth+q,0.5f*iHeight,0.133838384f*iWidth+q,0.498618785f*iHeight);
  line(0.159090909f*iWidth+q,0.491712707f*iHeight,0.126262626f*iWidth+q,0.519337017f*iHeight);
  line(0.282828283f*iWidth+q,0.570441989f*iHeight,0.305555556f*iWidth+q,0.560773481f*iHeight);
  line(0.272727273f*iWidth+q,0.540055249f*iHeight,0.315656566f*iWidth+q,0.516574586f*iHeight);
  line(0.335858586f*iWidth+q,0.490331492f*iHeight,0.338383838f*iWidth+q,0.535911602f*iHeight);
  line(0.398989899f*iWidth+q,0.551104972f*iHeight,0.434343434f*iWidth+q,0.531767956f*iHeight);
  line(0.391414141f*iWidth+q,0.55801105f*iHeight,0.414141414f*iWidth+q,0.600828729f*iHeight);
  line(0.358585859f*iWidth+q,0.607734807f*iHeight,0.409090909f*iWidth+q,0.606353591f*iHeight);
  line(0.366161616f*iWidth+q,0.61878453f*iHeight,0.421717172f*iWidth+q,0.679558011f*iHeight);
  line(0.323232323f*iWidth+q,0.629834254f*iHeight,0.368686869f*iWidth+q,0.621546961f*iHeight);
  line(0.338383838f*iWidth+q,0.672651934f*iHeight,0.371212121f*iWidth+q,0.665745856f*iHeight);
  line(0.361111111f*iWidth+q,0.690607735f*iHeight,0.431818182f*iWidth+q,0.693370166f*iHeight);
  line(0.323232323f*iWidth+q,0.685082873f*iHeight,0.388888889f*iWidth+q,0.720994475f*iHeight);
  line(0.335858586f*iWidth+q,0.730662983f*iHeight,0.378787879f*iWidth+q,0.723756906f*iHeight);
  line(0.328282828f*iWidth+q,0.796961326f*iHeight,0.419191919f*iWidth+q,0.787292818f*iHeight);
  line(0.361111111f*iWidth+q,0.801104972f*iHeight,0.330808081f*iWidth+q,0.82320442f*iHeight);
  line(0.348484848f*iWidth+q,0.830110497f*iHeight,0.398989899f*iWidth+q,0.831491713f*iHeight);
  line(0.313131313f*iWidth+q,0.839779006f*iHeight,0.340909091f*iWidth+q,0.75f*iHeight);
  line(0.237373737f*iWidth+q,0.490331492f*iHeight,0.234848485f*iWidth+q,0.559392265f*iHeight);
  
  stroke(19,66,174); //shirt wrinkes
  line(0.282828283f*iWidth+q,0.386740331f*iHeight,0.277777778f*iWidth+q,0.360497238f*iHeight);
  line(0.300505051f*iWidth+q,0.36878453f*iHeight,0.356060606f*iWidth+q,0.372928177f*iHeight);
  line(0.363636364f*iWidth+q,0.375690608f*iHeight,0.454545455f*iWidth+q,0.367403315f*iHeight);
  line(0.439393939f*iWidth+q,0.357734807f*iHeight,0.363636364f*iWidth+q,0.359116022f*iHeight);
  line(0.318181818f*iWidth+q,0.354972376f*iHeight,0.361111111f*iWidth+q,0.359116022f*iHeight);
  line(0.406565657f*iWidth+q,0.339779006f*iHeight,0.462121212f*iWidth+q,0.348066298f*iHeight);
  line(0.179292929f*iWidth+q,0.306629834f*iHeight,0.212121212f*iWidth+q,0.316298343f*iHeight);
  line(0.214646465f*iWidth+q,0.317679558f*iHeight,0.22979798f*iWidth+q,0.356353591f*iHeight);
  line(0.212121212f*iWidth+q,0.364640884f*iHeight,0.224747475f*iWidth+q,0.359116022f*iHeight);
  line(0.146464646f*iWidth+q,0.325966851f*iHeight,0.151515152f*iWidth+q,0.305248619f*iHeight);
  line(0.103535354f*iWidth+q,0.327348066f*iHeight,0.118686869f*iWidth+q,0.305248619f*iHeight);
  line(0.088383838f*iWidth+q,0.313535912f*iHeight,0.113636364f*iWidth+q,0.305248619f*iHeight);
  line(0.055555556f*iWidth+q,0.312154696f*iHeight,0.111111111f*iWidth+q,0.301104972f*iHeight);
  line(0.436868687f*iWidth+q,0.269337017f*iHeight,0.48989899f*iWidth+q,0.245856354f*iHeight);
  line(0.45959596f*iWidth+q,0.273480663f*iHeight,0.497474747f*iWidth+q,0.262430939f*iHeight);
  line(0.45959596f*iWidth+q,0.29558011f*iHeight,0.47979798f*iWidth+q,0.29281768f*iHeight);
  line(0.457070707f*iWidth+q,0.305248619f*iHeight,0.505050505f*iWidth+q,0.287292818f*iHeight);
  line(0.434343434f*iWidth+q,0.30801105f*iHeight,0.467171717f*iWidth+q,0.314917127f*iHeight);
  line(0.320707071f*iWidth+q,0.425414365f*iHeight,0.363636364f*iWidth+q,0.393646409f*iHeight);
  line(0.255050505f*iWidth+q,0.419889503f*iHeight,0.328282828f*iWidth+q,0.392265193f*iHeight);
  line(0.202020202f*iWidth+q,0.407458564f*iHeight,0.255050505f*iWidth+q,0.401933702f*iHeight);
  line(0.123737374f*iWidth+q,0.412983425f*iHeight,0.169191919f*iWidth+q,0.408839779f*iHeight);
  line(0.136363636f*iWidth+q,0.370165746f*iHeight,0.103535354f*iWidth+q,0.397790055f*iHeight);
  line(0.452020202f*iWidth+q,0.241712707f*iHeight,0.497474747f*iWidth+q,0.200276243f*iHeight);
  line(0.472222222f*iWidth+q,0.238950276f*iHeight,0.494949495f*iWidth+q,0.229281768f*iHeight);
  line(0.452020202f*iWidth+q,0.182320442f*iHeight,0.434343434f*iWidth+q,0.227900552f*iHeight);
  line(0.426767677f*iWidth+q,0.175414365f*iHeight,0.421717172f*iWidth+q,0.215469613f*iHeight);
  line(0.391414141f*iWidth+q,0.241712707f*iHeight,0.378787879f*iWidth+q,0.256906077f*iHeight);
  line(0.393939394f*iWidth+q,0.256906077f*iHeight,0.393939394f*iWidth+q,0.248618785f*iHeight);
  line(0.282828283f*iWidth+q,0.28038674f*iHeight,0.303030303f*iWidth+q,0.252762431f*iHeight);
  line(0.28030303f*iWidth+q,0.287292818f*iHeight,0.303030303f*iWidth+q,0.285911602f*iHeight);
  line(0.143939394f*iWidth+q,0.198895028f*iHeight,0.181818182f*iWidth+q,0.279005525f*iHeight);
  line(0.126262626f*iWidth+q,0.197513812f*iHeight,0.138888889f*iWidth+q,0.251381215f*iHeight);
  line(0.065656566f*iWidth+q,0.194751381f*iHeight,0.133838384f*iWidth+q,0.233425414f*iHeight);
  line(0.161616162f*iWidth+q,0.194751381f*iHeight,0.169191919f*iWidth+q,0.171270718f*iHeight);
  line(0.075757576f*iWidth+q,0.215469613f*iHeight,0.118686869f*iWidth+q,0.233425414f*iHeight);
  line(0.068181818f*iWidth+q,0.238950276f*iHeight,0.103535354f*iWidth+q,0.256906077f*iHeight);
  line(0.439393939f*iWidth+q,0.332872928f*iHeight,0.411616162f*iWidth+q,0.320441989f*iHeight);
  line(0.234848485f*iWidth+q,0.236187845f*iHeight,0.212121212f*iWidth+q,0.214088398f*iHeight);
  line(0.103535354f*iWidth+q,0.428176796f*iHeight,0.242424242f*iWidth+q,0.437845304f*iHeight);
  line(0.313131313f*iWidth+q,0.435082873f*iHeight,0.23989899f*iWidth+q,0.439226519f*iHeight);
  line(0.310606061f*iWidth+q,0.435082873f*iHeight,0.444444444f*iWidth+q,0.432320442f*iHeight);

  stroke(154,126,114); // face outline
  line(0.265151515f*iWidth+q,0.227900552f*iHeight,0.272727273f*iWidth+q,0.20718232f*iHeight);
  line(0.27020202f*iWidth+q,0.205801105f*iHeight,0.287878788f*iWidth+q,0.200276243f*iHeight);
  line(0.277777778f*iWidth+q,0.262430939f*iHeight,0.26010101f*iWidth+q,0.230662983f*iHeight);
  line(0.26010101f*iWidth+q,0.222375691f*iHeight,0.255050505f*iWidth+q,0.214088398f*iHeight);
  line(0.308080808f*iWidth+q,0.133977901f*iHeight,0.315656566f*iWidth+q,0.117403315f*iHeight);
  line(0.313131313f*iWidth+q,0.117403315f*iHeight,0.287878788f*iWidth+q,0.099447514f*iHeight);
  line(0.212121212f*iWidth+q,0.116022099f*iHeight,0.244949495f*iWidth+q,0.100828729f*iHeight);
  line(0.217171717f*iWidth+q,0.116022099f*iHeight,0.227272727f*iWidth+q,0.133977901f*iHeight);
  line(0.242424242f*iWidth+q,0.128453039f*iHeight,0.242424242f*iWidth+q,0.121546961f*iHeight);
  line(0.244949495f*iWidth+q,0.102209945f*iHeight,0.242424242f*iWidth+q,0.109116022f*iHeight);
  line(0.23989899f*iWidth+q,0.109116022f*iHeight,0.267676768f*iWidth+q,0.107734807f*iHeight);
  line(0.267676768f*iWidth+q,0.109116022f*iHeight,0.285353535f*iWidth+q,0.110497238f*iHeight);
  line(0.295454545f*iWidth+q,0.106353591f*iHeight,0.29040404f*iWidth+q,0.110497238f*iHeight);
  line(0.277777778f*iWidth+q,0.143646409f*iHeight,0.297979798f*iWidth+q,0.132596685f*iHeight);
  line(0.20959596f*iWidth+q,0.142265193f*iHeight,0.242424242f*iWidth+q,0.154696133f*iHeight);
  line(0.242424242f*iWidth+q,0.151933702f*iHeight,0.27020202f*iWidth+q,0.157458564f*iHeight);
  line(0.27020202f*iWidth+q,0.157458564f*iHeight,0.323232323f*iWidth+q,0.153314917f*iHeight);
  line(0.323232323f*iWidth+q,0.153314917f*iHeight,0.338383838f*iWidth+q,0.138121547f*iHeight);
  line(0.308080808f*iWidth+q,0.157458564f*iHeight,0.285353535f*iWidth+q,0.186464088f*iHeight);
  line(0.244949495f*iWidth+q,0.16160221f*iHeight,0.265151515f*iWidth+q,0.179558011f*iHeight);
  line(0.267676768f*iWidth+q,0.07320442f*iHeight,0.275252525f*iWidth+q,0.060773481f*iHeight);
  line(0.287878788f*iWidth+q,0.214088398f*iHeight,0.287878788f*iWidth+q,0.222375691f*iHeight);
  line(0.146464646f*iWidth+q,0.299723757f*iHeight,0.118686869f*iWidth+q,0.288674033f*iHeight);
  line(0.159090909f*iWidth+q,0.302486188f*iHeight,0.143939394f*iWidth+q,0.288674033f*iHeight);
  line(0.143939394f*iWidth+q,0.287292818f*iHeight,0.108585859f*iWidth+q,0.274861878f*iHeight);
  line(0.118686869f*iWidth+q,0.270718232f*iHeight,0.148989899f*iWidth+q,0.279005525f*iHeight);
  line(0.151515152f*iWidth+q,0.279005525f*iHeight,0.174242424f*iWidth+q,0.298342541f*iHeight);
  line(0.303030303f*iWidth+q,0.328729282f*iHeight,0.340909091f*iWidth+q,0.328729282f*iHeight);
  line(0.396464646f*iWidth+q,0.302486188f*iHeight,0.373737374f*iWidth+q,0.303867403f*iHeight);
  line(0.378787879f*iWidth+q,0.316298343f*iHeight,0.404040404f*iWidth+q,0.312154696f*iHeight);
  line(0.358585859f*iWidth+q,0.111878453f*iHeight,0.351010101f*iWidth+q,0.102209945f*iHeight);
  line(0.366161616f*iWidth+q,0.096685083f*iHeight,0.363636364f*iWidth+q,0.102209945f*iHeight);
  line(0.181818182f*iWidth+q,0.100828729f*iHeight,0.181818182f*iWidth+q,0.089779006f*iHeight);

  stroke(86,47,32); //bear dark lines
  line(0.358585859f*iWidth+q,0.111878453f*iHeight,0.351010101f*iWidth+q,0.102209945f*iHeight);
  line(0.366161616f*iWidth+q,0.096685083f*iHeight,0.363636364f*iWidth+q,0.102209945f*iHeight);
  line(0.181818182f*iWidth+q,0.100828729f*iHeight,0.181818182f*iWidth+q,0.089779006f*iHeight);
  line(0.358585859f*iWidth+q,0.111878453f*iHeight,0.351010101f*iWidth+q,0.102209945f*iHeight);
  line(0.366161616f*iWidth+q,0.096685083f*iHeight,0.363636364f*iWidth+q,0.102209945f*iHeight);
  line(0.181818182f*iWidth+q,0.100828729f*iHeight,0.181818182f*iWidth+q,0.089779006f*iHeight);
  line(0.512626263f*iWidth+q,0.317679558f*iHeight,0.691919192f*iWidth+q,0.447513812f*iHeight);
  line(0.704545455f*iWidth+q,0.44198895f*iHeight,0.744949495f*iWidth+q,0.410220994f*iHeight);
  line(0.747474747f*iWidth+q,0.410220994f*iHeight,0.871212121f*iWidth+q,0.317679558f*iHeight);
  line(0.873737374f*iWidth+q,0.316298343f*iHeight,0.904040404f*iWidth+q,0.277624309f*iHeight);
  line(0.704545455f*iWidth+q,0.371546961f*iHeight,0.762626263f*iWidth+q,0.30801105f*iHeight);
  line(0.78030303f*iWidth+q,0.288674033f*iHeight,0.820707071f*iWidth+q,0.261049724f*iHeight);
  line(0.845959596f*iWidth+q,0.243093923f*iHeight,0.893939394f*iWidth+q,0.197513812f*iHeight);
  line(0.843434343f*iWidth+q,0.243093923f*iHeight,0.732323232f*iWidth+q,0.26519337f*iHeight);
  line(0.686868687f*iWidth+q,0.266574586f*iHeight,0.575757576f*iWidth+q,0.256906077f*iHeight);
  line(0.563131313f*iWidth+q,0.251381215f*iHeight,0.522727273f*iWidth+q,0.230662983f*iHeight);
  line(0.699494949f*iWidth+q,0.374309392f*iHeight,0.621212121f*iWidth+q,0.321823204f*iHeight);
  line(0.601010101f*iWidth+q,0.309392265f*iHeight,0.535353535f*iWidth+q,0.256906077f*iHeight);
  line(0.482323232f*iWidth+q,0.375690608f*iHeight,0.621212121f*iWidth+q,0.522099448f*iHeight);
  line(0.772727273f*iWidth+q,0.505524862f*iHeight,0.853535354f*iWidth+q,0.407458564f*iHeight);
  line(0.856060606f*iWidth+q,0.401933702f*iHeight,0.904040404f*iWidth+q,0.342541436f*iHeight);
  line(0.742424242f*iWidth+q,0.658839779f*iHeight,0.775252525f*iWidth+q,0.512430939f*iHeight);
  line(0.603535354f*iWidth+q,0.591160221f*iHeight,0.633838384f*iWidth+q,0.657458564f*iHeight);
  line(0.616161616f*iWidth+q,0.125690608f*iHeight,0.638888889f*iWidth+q,0.093922652f*iHeight);
  line(0.638888889f*iWidth+q,0.093922652f*iHeight,0.661616162f*iWidth+q,0.077348066f*iHeight);
  line(0.744949495f*iWidth+q,0.078729282f*iHeight,0.77020202f*iWidth+q,0.092541436f*iHeight);
  line(0.772727273f*iWidth+q,0.095303867f*iHeight,0.792929293f*iWidth+q,0.121546961f*iHeight);
  line(0.621212121f*iWidth+q,0.153314917f*iHeight,0.638888889f*iWidth+q,0.122928177f*iHeight);
  line(0.636363636f*iWidth+q,0.151933702f*iHeight,0.654040404f*iWidth+q,0.124309392f*iHeight);
  line(0.757575758f*iWidth+q,0.150552486f*iHeight,0.76010101f*iWidth+q,0.128453039f*iHeight);
  line(0.651515152f*iWidth+q,0.116022099f*iHeight,0.679292929f*iWidth+q,0.113259669f*iHeight);
  line(0.696969697f*iWidth+q,0.110497238f*iHeight,0.742424242f*iWidth+q,0.113259669f*iHeight);
  line(0.755050505f*iWidth+q,0.114640884f*iHeight,0.78030303f*iWidth+q,0.11878453f*iHeight);
  line(0.79040404f*iWidth+q,0.124309392f*iHeight,0.777777778f*iWidth+q,0.143646409f*iHeight);
  line(0.618686869f*iWidth+q,0.157458564f*iHeight,0.626262626f*iWidth+q,0.200276243f*iHeight);
  line(0.636363636f*iWidth+q,0.211325967f*iHeight,0.686868687f*iWidth+q,0.216850829f*iHeight);
  line(0.694444444f*iWidth+q,0.214088398f*iHeight,0.744949495f*iWidth+q,0.209944751f*iHeight);
  line(0.762626263f*iWidth+q,0.201657459f*iHeight,0.765151515f*iWidth+q,0.178176796f*iHeight);
  line(0.76010101f*iWidth+q,0.169889503f*iHeight,0.767676768f*iWidth+q,0.147790055f*iHeight);
  line(0.656565657f*iWidth+q,0.190607735f*iHeight,0.656565657f*iWidth+q,0.203038674f*iHeight);
  line(0.659090909f*iWidth+q,0.10359116f*iHeight,0.664141414f*iWidth+q,0.087016575f*iHeight);
  line(0.636363636f*iWidth+q,0.180939227f*iHeight,0.681818182f*iWidth+q,0.183701657f*iHeight);
  line(0.712121212f*iWidth+q,0.186464088f*iHeight,0.744949495f*iWidth+q,0.183701657f*iHeight);
  line(0.762626263f*iWidth+q,0.102209945f*iHeight,0.755050505f*iWidth+q,0.096685083f*iHeight);
  line(0.537878788f*iWidth+q,0.165745856f*iHeight,0.560606061f*iWidth+q,0.209944751f*iHeight);
  line(0.590909091f*iWidth+q,0.223756906f*iHeight,0.616161616f*iWidth+q,0.218232044f*iHeight);
  line(0.775252525f*iWidth+q,0.220994475f*iHeight,0.823232323f*iWidth+q,0.218232044f*iHeight);
  line(0.848484848f*iWidth+q,0.193370166f*iHeight,0.876262626f*iWidth+q,0.125690608f*iHeight);
  line(0.535353535f*iWidth+q,0.124309392f*iHeight,0.555555556f*iWidth+q,0.100828729f*iHeight);
  line(0.835858586f*iWidth+q,0.087016575f*iHeight,0.858585859f*iWidth+q,0.104972376f*iHeight);
  line(0.689393939f*iWidth+q,0.552486188f*iHeight,0.696969697f*iWidth+q,0.651933702f*iHeight);
  line(0.494949495f*iWidth+q,0.821823204f*iHeight,0.494949495f*iWidth+q,0.791436464f*iHeight);
  line(0.535353535f*iWidth+q,0.817679558f*iHeight,0.532828283f*iWidth+q,0.791436464f*iHeight);
  line(0.560606061f*iWidth+q,0.816298343f*iHeight,0.555555556f*iWidth+q,0.791436464f*iHeight);
  line(0.585858586f*iWidth+q,0.824585635f*iHeight,0.588383838f*iWidth+q,0.791436464f*iHeight);
  line(0.797979798f*iWidth+q,0.831491713f*iHeight,0.79040404f*iWidth+q,0.79558011f*iHeight);
  line(0.823232323f*iWidth+q,0.834254144f*iHeight,0.815656566f*iWidth+q,0.798342541f*iHeight);
  line(0.858585859f*iWidth+q,0.832872928f*iHeight,0.843434343f*iWidth+q,0.798342541f*iHeight);
  line(0.896464646f*iWidth+q,0.83839779f*iHeight,0.878787879f*iWidth+q,0.799723757f*iHeight);
  line(0.838383838f*iWidth+q,0.555248619f*iHeight,0.835858586f*iWidth+q,0.531767956f*iHeight);
  line(0.866161616f*iWidth+q,0.560773481f*iHeight,0.866161616f*iWidth+q,0.534530387f*iHeight);
  line(0.896464646f*iWidth+q,0.560773481f*iHeight,0.896464646f*iWidth+q,0.537292818f*iHeight);
  line(0.921717172f*iWidth+q,0.535911602f*iHeight,0.919191919f*iWidth+q,0.559392265f*iHeight);
  line(0.570707071f*iWidth+q,0.560773481f*iHeight,0.558080808f*iWidth+q,0.529005525f*iHeight);
  line(0.542929293f*iWidth+q,0.559392265f*iHeight,0.535353535f*iWidth+q,0.533149171f*iHeight);
  line(0.502525253f*iWidth+q,0.535911602f*iHeight,0.507575758f*iWidth+q,0.560773481f*iHeight);
  line(0.472222222f*iWidth+q,0.529005525f*iHeight,0.482323232f*iWidth+q,0.555248619f*iHeight);
  line(0.446969697f*iWidth+q,0.821823204f*iHeight,0.505050505f*iWidth+q,0.907458564f*iHeight);
  line(0.515151515f*iWidth+q,0.907458564f*iHeight,0.568181818f*iWidth+q,0.922651934f*iHeight);
  line(0.585858586f*iWidth+q,0.922651934f*iHeight,0.654040404f*iWidth+q,0.922651934f*iHeight);
  line(0.681818182f*iWidth+q,0.914364641f*iHeight,0.73989899f*iWidth+q,0.933701657f*iHeight);
  line(0.775252525f*iWidth+q,0.92679558f*iHeight,0.835858586f*iWidth+q,0.922651934f*iHeight);
  line(0.861111111f*iWidth+q,0.918508287f*iHeight,0.898989899f*iWidth+q,0.899171271f*iHeight);
  line(0.924242424f*iWidth+q,0.879834254f*iHeight,0.96969697f*iWidth+q,0.841160221f*iHeight);
  
  stroke(174,109,71); // bear light lines
  line(0.613636364f*iWidth+q,0.197513812f*iHeight,0.606060606f*iWidth+q,0.111878453f*iHeight);
  line(0.595959596f*iWidth+q,0.113259669f*iHeight,0.585858586f*iWidth+q,0.197513812f*iHeight);
  line(0.555555556f*iWidth+q,0.182320442f*iHeight,0.578282828f*iWidth+q,0.120165746f*iHeight);
  line(0.54040404f*iWidth+q,0.120165746f*iHeight,0.54040404f*iWidth+q,0.165745856f*iHeight);
  line(0.52020202f*iWidth+q,0.128453039f*iHeight,0.505050505f*iWidth+q,0.183701657f*iHeight);
  line(0.810606061f*iWidth+q,0.117403315f*iHeight,0.805555556f*iWidth+q,0.169889503f*iHeight);
  line(0.828282828f*iWidth+q,0.122928177f*iHeight,0.830808081f*iWidth+q,0.172651934f*iHeight);
  line(0.856060606f*iWidth+q,0.111878453f*iHeight,0.853535354f*iWidth+q,0.189226519f*iHeight);
  line(0.863636364f*iWidth+q,0.113259669f*iHeight,0.871212121f*iWidth+q,0.186464088f*iHeight);
  line(0.560606061f*iWidth+q,0.100828729f*iHeight,0.593434343f*iWidth+q,0.093922652f*iHeight);
  line(0.805555556f*iWidth+q,0.092541436f*iHeight,0.863636364f*iWidth+q,0.099447514f*iHeight);
  line(0.578282828f*iWidth+q,0.227900552f*iHeight,0.608585859f*iWidth+q,0.255524862f*iHeight);
  line(0.606060606f*iWidth+q,0.229281768f*iHeight,0.648989899f*iWidth+q,0.26519337f*iHeight);
  line(0.641414141f*iWidth+q,0.225138122f*iHeight,0.671717172f*iWidth+q,0.256906077f*iHeight);
  line(0.674242424f*iWidth+q,0.226519337f*iHeight,0.689393939f*iWidth+q,0.256906077f*iHeight);
  line(0.717171717f*iWidth+q,0.222375691f*iHeight,0.714646465f*iWidth+q,0.256906077f*iHeight);
  line(0.752525253f*iWidth+q,0.230662983f*iHeight,0.732323232f*iWidth+q,0.261049724f*iHeight);
  line(0.805555556f*iWidth+q,0.230662983f*iHeight,0.755050505f*iWidth+q,0.25f*iHeight);
  line(0.818181818f*iWidth+q,0.227900552f*iHeight,0.800505051f*iWidth+q,0.263812155f*iHeight);
  line(0.838383838f*iWidth+q,0.232044199f*iHeight,0.797979798f*iWidth+q,0.259668508f*iHeight);
  line(0.818181818f*iWidth+q,0.186464088f*iHeight,0.815656566f*iWidth+q,0.211325967f*iHeight);
  line(0.535353535f*iWidth+q,0.20718232f*iHeight,0.588383838f*iWidth+q,0.218232044f*iHeight);
  line(0.621212121f*iWidth+q,0.270718232f*iHeight,0.669191919f*iWidth+q,0.298342541f*iHeight);
  line(0.664141414f*iWidth+q,0.269337017f*iHeight,0.702020202f*iWidth+q,0.296961326f*iHeight);
  line(0.742424242f*iWidth+q,0.269337017f*iHeight,0.722222222f*iWidth+q,0.291436464f*iHeight);
  line(0.785353535f*iWidth+q,0.273480663f*iHeight,0.737373737f*iWidth+q,0.299723757f*iHeight);
  line(0.732323232f*iWidth+q,0.303867403f*iHeight,0.704545455f*iWidth+q,0.330110497f*iHeight);
  line(0.626262626f*iWidth+q,0.291436464f*iHeight,0.651515152f*iWidth+q,0.319060773f*iHeight);
  line(0.654040404f*iWidth+q,0.328729282f*iHeight,0.689393939f*iWidth+q,0.345303867f*iHeight);
  line(0.689393939f*iWidth+q,0.357734807f*iHeight,0.71969697f*iWidth+q,0.335635359f*iHeight);
  line(0.853535354f*iWidth+q,0.25f*iHeight,0.848484848f*iWidth+q,0.316298343f*iHeight);
  line(0.823232323f*iWidth+q,0.270718232f*iHeight,0.813131313f*iWidth+q,0.32320442f*iHeight);
  line(0.787878788f*iWidth+q,0.301104972f*iHeight,0.765151515f*iWidth+q,0.346685083f*iHeight);
  line(0.744949495f*iWidth+q,0.350828729f*iHeight,0.742424242f*iWidth+q,0.383977901f*iHeight);
  line(0.707070707f*iWidth+q,0.371546961f*iHeight,0.676767677f*iWidth+q,0.404696133f*iHeight);
  line(0.550505051f*iWidth+q,0.272099448f*iHeight,0.558080808f*iWidth+q,0.324585635f*iHeight);
  line(0.583333333f*iWidth+q,0.302486188f*iHeight,0.593434343f*iWidth+q,0.343922652f*iHeight);
  line(0.611111111f*iWidth+q,0.321823204f*iHeight,0.633838384f*iWidth+q,0.364640884f*iHeight);
  line(0.659090909f*iWidth+q,0.345303867f*iHeight,0.666666667f*iWidth+q,0.385359116f*iHeight);
  line(0.732323232f*iWidth+q,0.435082873f*iHeight,0.71969697f*iWidth+q,0.477900552f*iHeight);
  line(0.772727273f*iWidth+q,0.407458564f*iHeight,0.772727273f*iWidth+q,0.443370166f*iHeight);
  line(0.803030303f*iWidth+q,0.389502762f*iHeight,0.803030303f*iWidth+q,0.422651934f*iHeight);
  line(0.825757576f*iWidth+q,0.374309392f*iHeight,0.825757576f*iWidth+q,0.407458564f*iHeight);
  line(0.838383838f*iWidth+q,0.35359116f*iHeight,0.843434343f*iWidth+q,0.392265193f*iHeight);
  line(0.866161616f*iWidth+q,0.342541436f*iHeight,0.868686869f*iWidth+q,0.372928177f*iHeight);
  line(0.878787879f*iWidth+q,0.321823204f*iHeight,0.888888889f*iWidth+q,0.348066298f*iHeight);
  line(0.893939394f*iWidth+q,0.316298343f*iHeight,0.893939394f*iWidth+q,0.342541436f*iHeight);
  line(0.532828283f*iWidth+q,0.350828729f*iHeight,0.53030303f*iWidth+q,0.389502762f*iHeight);
  line(0.555555556f*iWidth+q,0.367403315f*iHeight,0.54040404f*iWidth+q,0.408839779f*iHeight);
  line(0.595959596f*iWidth+q,0.388121547f*iHeight,0.570707071f*iWidth+q,0.435082873f*iHeight);
  line(0.618686869f*iWidth+q,0.410220994f*iHeight,0.598484848f*iWidth+q,0.450276243f*iHeight);
  line(0.651515152f*iWidth+q,0.432320442f*iHeight,0.628787879f*iWidth+q,0.473756906f*iHeight);
  line(0.664141414f*iWidth+q,0.44198895f*iHeight,0.654040404f*iWidth+q,0.483425414f*iHeight);
  line(0.684343434f*iWidth+q,0.455801105f*iHeight,0.691919192f*iWidth+q,0.5f*iHeight);
  line(0.765151515f*iWidth+q,0.483425414f*iHeight,0.752525253f*iWidth+q,0.523480663f*iHeight);
  line(0.73989899f*iWidth+q,0.494475138f*iHeight,0.732323232f*iWidth+q,0.537292818f*iHeight);
  line(0.71969697f*iWidth+q,0.504143646f*iHeight,0.707070707f*iWidth+q,0.560773481f*iHeight);
  line(0.762626263f*iWidth+q,0.551104972f*iHeight,0.724747475f*iWidth+q,0.596685083f*iHeight);
  line(0.742424242f*iWidth+q,0.548342541f*iHeight,0.702020202f*iWidth+q,0.598066298f*iHeight);
  line(0.747474747f*iWidth+q,0.609116022f*iHeight,0.724747475f*iWidth+q,0.645027624f*iHeight);
  line(0.734848485f*iWidth+q,0.607734807f*iHeight,0.699494949f*iWidth+q,0.628453039f*iHeight);
  line(0.568181818f*iWidth+q,0.455801105f*iHeight,0.583333333f*iWidth+q,0.488950276f*iHeight);
  line(0.606060606f*iWidth+q,0.48480663f*iHeight,0.601010101f*iWidth+q,0.53038674f*iHeight);
  line(0.626262626f*iWidth+q,0.502762431f*iHeight,0.628787879f*iWidth+q,0.54558011f*iHeight);
  line(0.679292929f*iWidth+q,0.519337017f*iHeight,0.656565657f*iWidth+q,0.555248619f*iHeight);
  line(0.656565657f*iWidth+q,0.517955801f*iHeight,0.631313131f*iWidth+q,0.574585635f*iHeight);
  line(0.681818182f*iWidth+q,0.564917127f*iHeight,0.646464646f*iWidth+q,0.602209945f*iHeight);
  line(0.621212121f*iWidth+q,0.578729282f*iHeight,0.633838384f*iWidth+q,0.617403315f*iHeight);
  line(0.643939394f*iWidth+q,0.571823204f*iHeight,0.664141414f*iWidth+q,0.625690608f*iHeight);
  line(0.643939394f*iWidth+q,0.638121547f*iHeight,0.664141414f*iWidth+q,0.624309392f*iHeight);
  line(0.659090909f*iWidth+q,0.656077348f*iHeight,0.638888889f*iWidth+q,0.629834254f*iHeight);
  line(0.679292929f*iWidth+q,0.654696133f*iHeight,0.661616162f*iWidth+q,0.624309392f*iHeight);
  line(0.893939394f*iWidth+q,0.38121547f*iHeight,0.924242424f*iWidth+q,0.42679558f*iHeight);
  line(0.871212121f*iWidth+q,0.39640884f*iHeight,0.901515152f*iWidth+q,0.450276243f*iHeight);
  line(0.835858586f*iWidth+q,0.414364641f*iHeight,0.861111111f*iWidth+q,0.470994475f*iHeight);
  line(0.813131313f*iWidth+q,0.453038674f*iHeight,0.828282828f*iWidth+q,0.5f*iHeight);
  line(0.79040404f*iWidth+q,0.483425414f*iHeight,0.815656566f*iWidth+q,0.517955801f*iHeight);
  line(0.782828283f*iWidth+q,0.524861878f*iHeight,0.815656566f*iWidth+q,0.540055249f*iHeight);
  line(0.911616162f*iWidth+q,0.46961326f*iHeight,0.863636364f*iWidth+q,0.504143646f*iHeight);
  line(0.484848485f*iWidth+q,0.41160221f*iHeight,0.477272727f*iWidth+q,0.458563536f*iHeight);
  line(0.497474747f*iWidth+q,0.432320442f*iHeight,0.477272727f*iWidth+q,0.475138122f*iHeight);
  line(0.52020202f*iWidth+q,0.453038674f*iHeight,0.484848485f*iWidth+q,0.502762431f*iHeight);
  line(0.537878788f*iWidth+q,0.473756906f*iHeight,0.48989899f*iWidth+q,0.519337017f*iHeight);
  line(0.565656566f*iWidth+q,0.491712707f*iHeight,0.535353535f*iWidth+q,0.523480663f*iHeight);
  line(0.46969697f*iWidth+q,0.488950276f*iHeight,0.457070707f*iWidth+q,0.520718232f*iHeight);
  line(0.914141414f*iWidth+q,0.595303867f*iHeight,0.929292929f*iWidth+q,0.66160221f*iHeight);
  line(0.931818182f*iWidth+q,0.599447514f*iHeight,0.919191919f*iWidth+q,0.667127072f*iHeight);
  line(0.785353535f*iWidth+q,0.599447514f*iHeight,0.782828283f*iWidth+q,0.651933702f*iHeight);
  line(0.815656566f*iWidth+q,0.595303867f*iHeight,0.818181818f*iWidth+q,0.683701657f*iHeight);
  line(0.873737374f*iWidth+q,0.609116022f*iHeight,0.863636364f*iWidth+q,0.678176796f*iHeight);
  line(0.843434343f*iWidth+q,0.617403315f*iHeight,0.820707071f*iWidth+q,0.696132597f*iHeight);
  line(0.871212121f*iWidth+q,0.689226519f*iHeight,0.883838384f*iWidth+q,0.737569061f*iHeight);
  line(0.830808081f*iWidth+q,0.70441989f*iHeight,0.858585859f*iWidth+q,0.745856354f*iHeight);
  line(0.921717172f*iWidth+q,0.686464088f*iHeight,0.898989899f*iWidth+q,0.745856354f*iHeight);
  line(0.878787879f*iWidth+q,0.767955801f*iHeight,0.797979798f*iWidth+q,0.783149171f*iHeight);
  line(0.777777778f*iWidth+q,0.741712707f*iHeight,0.803030303f*iWidth+q,0.78038674f*iHeight);
  line(0.825757576f*iWidth+q,0.752762431f*iHeight,0.853535354f*iWidth+q,0.785911602f*iHeight);
  line(0.891414141f*iWidth+q,0.767955801f*iHeight,0.921717172f*iWidth+q,0.801104972f*iHeight);
  line(0.502525253f*iWidth+q,0.606353591f*iHeight,0.48989899f*iWidth+q,0.683701657f*iHeight);
  line(0.535353535f*iWidth+q,0.621546961f*iHeight,0.525252525f*iWidth+q,0.696132597f*iHeight);
  line(0.565656566f*iWidth+q,0.622928177f*iHeight,0.560606061f*iWidth+q,0.701657459f*iHeight);
  line(0.588383838f*iWidth+q,0.624309392f*iHeight,0.588383838f*iWidth+q,0.718232044f*iHeight);
  line(0.497474747f*iWidth+q,0.714088398f*iHeight,0.542929293f*iWidth+q,0.75f*iHeight);
  line(0.53030303f*iWidth+q,0.697513812f*iHeight,0.568181818f*iWidth+q,0.748618785f*iHeight);
  line(0.593434343f*iWidth+q,0.718232044f*iHeight,0.608585859f*iWidth+q,0.761049724f*iHeight);
  line(0.512626263f*iWidth+q,0.754143646f*iHeight,0.547979798f*iWidth+q,0.78038674f*iHeight);
  line(0.568181818f*iWidth+q,0.759668508f*iHeight,0.593434343f*iWidth+q,0.784530387f*iHeight);
  line(0.603535354f*iWidth+q,0.763812155f*iHeight,0.606060606f*iWidth+q,0.783149171f*iHeight);
  line(0.494949495f*iWidth+q,0.769337017f*iHeight,0.527777778f*iWidth+q,0.796961326f*iHeight);
  line(0.492424242f*iWidth+q,0.708563536f*iHeight,0.492424242f*iWidth+q,0.743093923f*iHeight);
  line(0.482323232f*iWidth+q,0.604972376f*iHeight,0.467171717f*iWidth+q,0.66160221f*iHeight);
  line(0.871212121f*iWidth+q,0.519337017f*iHeight,0.916666667f*iWidth+q,0.524861878f*iHeight);
  line(0.906565657f*iWidth+q,0.498618785f*iHeight,0.924242424f*iWidth+q,0.531767956f*iHeight);
  line(0.805555556f*iWidth+q,0.102209945f*iHeight,0.845959596f*iWidth+q,0.114640884f*iHeight);
  line(0.565656566f*iWidth+q,0.106353591f*iHeight,0.603535354f*iWidth+q,0.107734807f*iHeight);
  
  
  // Mooyoung's portrait; Moves around when mouse is clicked.
  if (mouseLeft == 1){
    makeCollage(imgPath, xStart, yStart);          // Background; picture collage w/ different filters
    portraitMooyoung(sizeRatio, xOffset, yOffset); // portrait
    
    // Moving portrait;  
      // k represent different quadrant from 2x2 collage sections
      // portrait move from one quadrant to another with 10 moving steps
      // portrait size changes according to the stepSize vector
    if (k == 0){
      xOffset += 36.9f;
      yOffset += 5.2f;
      constrain(xOffset, 784, 1153);
      constrain(yOffset, 112, 164);
      if ((xOffset < 800) && (stepSize[i]==0)){
        xOffset = 784; yOffset = 112;
      }
    }
    if (k == 1){
      xOffset += -41.9f;
      yOffset += 30.4f;
      constrain(xOffset, 734, 1153);
      constrain(yOffset, 164, 468);
    }
    if (k == 2){
      xOffset += 36.6f;
      yOffset += 5.4f;
      constrain(xOffset, 734, 1100);
      constrain(yOffset, 468, 523);
    }
    if (k == 3){
      xOffset += -31.6f;
      yOffset += -41.0f;
      constrain(xOffset, 784, 1100);
      constrain(yOffset, 112, 523);
    }
    i += 1;
    if ( i == 10){
      i = 0;
      //j = j*-1;
      k += 1;
      if ( k == 4){
        k = 0;
      }
    }
    sizeRatio = stepSize[i]/10 +1;

  }

}


// Mooyoung's Functions

public void makeCollage(String imgPath, int xStart, int yStart){
  // Function: take an image path and tile into 2x2 collage frame with four different filters
  //           the tile start from (xStart, yStart) pixel
  
  
  // Load image to work on
  PImage imgML = loadImage(imgPath);
  
  
  // Negative filter (Greenberg p.315)
  image(imgML, 0 + xStart, imgML.height + yStart);
  for (int x = 0 + xStart; x < imgML.width + xStart; x++){
    for (int y = imgML.height + yStart; y < imgML.height*2 +yStart; y++){
      int c = get(x,y);
      set(x, y, color(255-red(c), 255-green(c), 255-blue(c)));
    }
  }
    
  // Random Neighbor filter (Greenberg p.317)
  image(imgML, imgML.width + xStart, 0 + yStart);
  for (int x = imgML.width + xStart; x < imgML.width*2 + xStart; x++){
    for (int y = yStart; y < imgML.height + yStart; y++){
      int newX = round(random(x-1, x+1)*100)/100;
      int newY = round(random(y-1, y+1)*100)/100;
      set(x, y, get(newX, newY));
    }
  }
  
  
  // Grayscale filter (Greenberg p.337)
  imgML.loadPixels();
  for (int i = 0; i < imgML.pixels.length; i++) {
    int c = imgML.pixels[i];
    imgML.pixels[i] = color(red(c)*0.3f+green(c)*0.59f+blue(c)*0.11f);
  }
  imgML.updatePixels();
  image(imgML, imgML.width + xStart, imgML.height + yStart);
    
  // Obamicon (Greenberg p.387)
  int darkBlue = color(0, 51, 76);
  int red = color(217, 26, 33);
  int lightBlue = color(112, 150, 158);
  int yellow = color(252, 227, 166);

  imgML.loadPixels();
  for (int i = 0; i < imgML.pixels.length; i++) {
    int c = imgML.pixels[i];
    float total = red(c)+green(c)+blue(c);
    if (total < 182) { // darkest colored pixels
    imgML.pixels[i] = color(darkBlue);
    }
    else if (total < 364) { // 2nd darkest pixels
    imgML.pixels[i] = color(red);
    }
    else if (total < 546) { // lighter pixels
    imgML.pixels[i] = color(lightBlue);
    }
    else { // lightest pixels
    imgML.pixels[i] = color(yellow);
    }
  }
  imgML.updatePixels();
  image(imgML, 0 + xStart, 0 + yStart);
  
}



// Function to draw Mooyoung's Face
public void portraitMooyoung(float sizeRatio, float xOffset, float yOffset){
  // Function: draw a predefined portrait with given sizeRatio
  //           the drawing templet starts at (xOffset, yOffset) pixel
    
  float[] mouthCoords = {
  -0.205365178f,  0.258484609f,
  -0.102682589f,  0.24269929f,
  -0.044923633f,  0.24269929f,
  0,  0.24269929f,
  0.077011942f,  0.23875296f,
  0.166859207f,  0.24664562f,
  0.121935575f,  0.286108919f,
  0.07059428f,  0.305840568f,
  -0.019252985f,  0.317679558f,
  -0.102682589f,  0.310679558f,
  -0.166859207f,  0.287947908f,
  -0.21178284f,  0.258484609f
  };
  
  float[] noseCoords = {
  -0.275959458f,  0.179558011f,
  -0.231035825f,  0.159826361f,
  -0.147606222f,  0.120363062f,
  -0.134770898f,  0.120363062f,
  -0.160441545f,  0.128255722f,
  -0.147606222f,  0.163772691f,
  -0.044923633f,  0.199289661f,
  -0.019252985f,  0.203235991f,
  0.044923633f,  0.187450671f,
  0.096264927f,  0.175611681f,
  0.128353236f,  0.144041042f,
  0.096264927f,  0.120363062f,
  0.205365178f,  0.159826361f,
  0.243871149f,  0.183504341f,
  0.256706473f,  0.203235991f
  };
  
  float[] shirtCoords = {
  -0.667436829f,  0.751775848f,
  -0.616095534f,  0.708366219f,
  -0.474906974f,  0.657063931f,
  -0.295212444f,  0.621546961f,
  -0.179694531f,  0.589976322f,
  -0.173276869f,  0.570244672f,
  -0.198947516f,  0.530781373f,
  -0.205365178f,  0.503693765f,
  -0.166859207f,  0.550513023f,
  -0.083429604f,  0.629439621f,
  -0.006417662f,  0.6925809f,
  0.121935575f,  0.589976322f,
  0.301630105f,  0.463693765f,
  0.404312694f,  0.412391476f,
  0.468489313f,  0.341357537f,
  0.474906974f,  0.325572218f,
  0.661019167f,  0.443962115f,
  0.686689814f,  0.479479084f,
  0.834296036f,  0.503157064f,
  1.007572905f,  0.574191002f,
  1.180849774f,  0.649171271f
  };
  
  float[] shirtCoords2 = {
  0.179694531f,  0.818863457f,
  0.506995283f,  0.412391476f,
  0.49415996f,  0.337411208f,
  0.667436829f,  0.455801105f,
  0.686689814f,  0.491318074f,
  0.63534852f,  0.6925809f,
  0.481324636f,  0.747829519f,
  0.571171902f,  0.810970797f
  };
  
  float[] tieCoords = {
  -0.314465429f,  0.657063931f,
  -0.179694531f,  0.67679558f,
  -0.044923633f,  0.712312549f,
  0.096264927f,  0.67284925f,
  0.160441545f,  0.728097869f,
  0.154023884f,  0.810970797f,
  0.064176618f,  0.810970797f,
  -0.038505971f,  0.771507498f,
  -0.077011942f,  0.795185478f,
  -0.3529714f,  0.826756117f,
  -0.378642047f,  0.779400158f,
  -0.314465429f,  0.657063931f
  };

  float[] hairCoords = {
  -0.5262f,-0.0848f,
  -0.5198f,-0.2032f,
  -0.4749f,-0.3453f,
  -0.4428f,-0.4045f,
  -0.3851f,-0.4084f,
  -0.3851f,-0.4084f,
  -0.3401f,-0.4558f,
  -0.3016f,-0.4795f,
  -0.3016f,-0.515f,
  -0.2118f,-0.511f,
  -0.1797f,-0.5387f,
  -0.1412f,-0.5229f,
  -0.1284f,-0.5545f,
  -0.0578f,-0.5505f,
  0.0128f,-0.5702f,
  0.1027f,-0.5387f,
  0.1348f,-0.5426f,
  0.2182f,-0.5308f,
  0.2567f,-0.4834f,
  0.3145f,-0.4953f,
  0.3658f,-0.4716f,
  0.3979f,-0.4242f,
  0.3915f,-0.365f,
  0.4942f,-0.3729f,
  0.4685f,-0.3532f,
  0.5391f,-0.294f,
  0.5712f,-0.2348f,
  0.5776f,-0.1914f,
  0.5776f,-0.1243f,
  0.5712f,-0.073f,
  0.4749f,-0.0375f,
  0.4364f,-0.144f,
  0.43f,-0.2072f,
  0.3722f,-0.2861f,
  0.2695f,-0.3295f,
  0.154f,-0.3611f,
  0.0513f,-0.3611f,
  -0.0128f,-0.3493f,
  -0.1284f,-0.369f,
  -0.2567f,-0.3414f,
  -0.3851f,-0.2901f,
  -0.4236f,-0.2585f,
  -0.4492f,-0.1875f,
  -0.4557f,-0.1361f,
  -0.4749f,-0.073f,
  -0.5006f,-0.0691f
  };

  pushMatrix();
  // transformation; Need to rotate the figures in order to match the original picture orientation
  rotate(-0.14f);
  translate(xOffset - 50, yOffset - 8);  // (-50, -8) is an additional offset to match the original image
  //translate(xOffset, yOffset);  // (-50, -8) is an additional offset to match the original image
    
  // Size of portrait
  float newWidth = 371*sizeRatio;
  float newHeight = 362*sizeRatio;
  
  // head
  strokeWeight(3);
  float headWidth = newWidth * .42f;
  float headHeight = newHeight * .7f;
  noFill();
  stroke(50);
  ellipse(newWidth/2, newHeight/2, headWidth, headHeight); 
  
  // Eyes with pupil
  float eyeWidth = headWidth / 6;
  float eyeHeight = eyeWidth / 6;
  stroke(0);
  strokeWeight(1);
  ellipse(newWidth/2 - headWidth/4.5f, newHeight/2, eyeWidth, eyeHeight); // eye LH
  ellipse(newWidth/2 + headWidth/5, newHeight/2, eyeWidth, eyeHeight);   // eye RH
  fill(51, 0, 0); noStroke();
  ellipse(newWidth/2 - headWidth/4.5f, newHeight/2, eyeHeight, eyeHeight);  //pupill LH
  ellipse(newWidth/2 + headWidth/5, newHeight/2, eyeHeight, eyeHeight);    //pupill RH
    
  // Ears
  //fill(255, 255, 0,  0);
  noFill();
  stroke(96, 96, 96);
  strokeWeight(3);
  float x1 = newWidth/3.4f;
  float y1 = newHeight/2 - eyeHeight;
  float x2 = newWidth/4.3f;
  float y2 = newHeight/2 - eyeWidth * 1.5f;
  float y3 = newHeight/2 + eyeWidth*2;
  float x4 = newWidth/3.25f;
  bezier(x1, y1, x2, y2, x2, y3, x4, y3);
  bezier(newWidth - x1, y1, newWidth - x2 + eyeWidth*.5f, y2, newWidth - x2 +eyeWidth*.5f, y3, newWidth - x1*1.04f, y3);
  
  // Glasses
  float glassWidth = eyeWidth * 2;
  float glassHeight = eyeHeight * 8;
  float lenseRadius = eyeHeight * 5;
  noFill();
  strokeWeight(3);
  rect(newWidth/2 - headWidth/4 - glassWidth/2, newHeight/1.95f - glassHeight/2, glassWidth, glassHeight, lenseRadius);
  rect(newWidth/2 + headWidth/5 - glassWidth/2, newHeight/1.95f - glassHeight/2, glassWidth, glassHeight, lenseRadius);
  line(newWidth/2 - headWidth/4 + eyeWidth, newHeight/2, newWidth/2 + headWidth/5 - eyeWidth, newHeight/2);  
  line(newWidth/2 - headWidth/5 - glassWidth/2, newHeight/2 - glassHeight/3, x1, y1);
  line(newWidth/2 + headWidth/5 + glassWidth/2, newHeight/2 - glassHeight/5, newWidth - x1, y1);
  
  // Left eyebrow
  fill(50, 175);
  noStroke();
  beginShape();
  vertex(newWidth/2 - 0.3273f*headWidth, newHeight/2 -0.1085f*headHeight);
  vertex(newWidth/2 - 0.1219f*headWidth, newHeight/2 -0.0927f*headHeight);
  vertex(newWidth/2 - 0.1412f*headWidth, newHeight/2 -0.0730f*headHeight);
  vertex(newWidth/2 - 0.3080f*headWidth, newHeight/2 -0.0809f*headHeight);
  vertex(newWidth/2 - 0.3722f*headWidth, newHeight/2 -0.0769f*headHeight);
  endShape(CLOSE);
  
  // Right eyebrow
  fill(50, 175);
  noStroke();
  beginShape();
  vertex(newWidth/2 + 0.2695f*headWidth, newHeight/2 -0.1085f*headHeight);
  vertex(newWidth/2 + 0.0706f*headWidth, newHeight/2 -0.0927f*headHeight);
  vertex(newWidth/2 + 0.0898f*headWidth, newHeight/2 -0.0730f*headHeight);
  vertex(newWidth/2 + 0.1861f*headWidth, newHeight/2 -0.0769f*headHeight);
  vertex(newWidth/2 + 0.3401f*headWidth, newHeight/2 -0.0611f*headHeight);
  endShape(CLOSE);  
  
  // Hair
  fill(40);
  noStroke();
  beginShape();
  for (int i = 0; i<hairCoords.length; i +=2){
    vertex(newWidth/2 + hairCoords[i]*headWidth, newHeight/2 + hairCoords[i+1]*headHeight);
  }
  endShape(CLOSE);
  
  // Mouth
  noFill();
  stroke(75, 0, 30);
  strokeWeight(4);
  beginShape();
  for (int i = 0; i<mouthCoords.length; i +=2){
    vertex(newWidth/2 + mouthCoords[i]*headWidth, newHeight/2 + mouthCoords[i+1]*headHeight);
  }
  endShape(CLOSE);
  
  // Nose
  noFill();
  stroke(125);
  strokeWeight(2);
  beginShape();
  for (int i = 0; i<noseCoords.length; i +=2){
    vertex(newWidth/2 + noseCoords[i]*headWidth, newHeight/2 + noseCoords[i+1]*headHeight);
  }
  endShape();


  // Shirt
  noFill();
  stroke(70);
  strokeWeight(8);
  beginShape();
  for (int i = 0; i<shirtCoords.length; i +=2){
    vertex(newWidth/2 + shirtCoords[i]*headWidth, newHeight/2 + shirtCoords[i+1]*headHeight);
  }
  endShape();
  
  beginShape();
  for (int i = 0; i<shirtCoords2.length; i +=2){
    vertex(newWidth/2 + shirtCoords2[i]*headWidth, newHeight/2 + shirtCoords2[i+1]*headHeight);
  }
  endShape();
    
  // Bowtie
  noFill();
  stroke(110,0,0);
  strokeWeight(3);
  beginShape();
  for (int i = 0; i<tieCoords.length; i +=2){
    vertex(newWidth/2 + tieCoords[i]*headWidth, newHeight/2 + tieCoords[i+1]*headHeight);
  }
  endShape();
  
  //reset for Yao
  strokeWeight(1);
  popMatrix();
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "HW02_YaoLee_SelfPortrait_Final_v3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
