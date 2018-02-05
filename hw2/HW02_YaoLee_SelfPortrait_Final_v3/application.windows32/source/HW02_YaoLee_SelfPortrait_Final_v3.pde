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
void settings() {           
  img = loadImage("1.jpg");
  int iWidth = img.width*2;
  int iHeight = img.height;
  size(iWidth + 742, iHeight);
}

//font
void setup() {
  f = createFont("Arial",8,true);
  frameRate(3);
}

//left click starts or stops, right click saves
void mousePressed() {
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

void keyPressed() { //manual
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
void draw() {
  float x = img.width*pow(1.1,p)/15;
  float y = img.height*pow(1.1,p)/30;
  stroke(1);
  for(int i = 0; i < img.width; i += x){
    for(int j = 0; j < img.height; j += y){
      fill(int(random(255)),int(random(255)),int(random(255)));
      rect(i,j,x,y);
    }
  } 
  
  //instuctions for Yao's and Mooyoung's portrait
  textFont(f,20);
  fill(255);
  text("Press Arrow Keys: Left, Right, Up, or Down",0,20);
  fill(5);
  text("Press Mouse to Stop/Start",img.width*2,20);
  float iWidth = img.width*pow(1.1,p);
  float iHeight = img.height*pow(1.1,p);
  image(img, img.width, 0);
  
  //start of Yao's portrait
  stroke(1);
  fill(19,26,34); // black shoes 1
  beginShape();
  curveVertex(0.333333333*iWidth+q,0.864640884*iHeight);
  curveVertex(0.333333333*iWidth+q,0.864640884*iHeight);
  curveVertex(0.345959596*iWidth+q,0.883977901*iHeight);
  curveVertex(0.348484848*iWidth+q,0.904696133*iHeight);
  curveVertex(0.356060606*iWidth+q,0.92679558*iHeight);
  curveVertex(0.371212121*iWidth+q,0.933701657*iHeight);
  curveVertex(0.404040404*iWidth+q,0.935082873*iHeight);
  curveVertex(0.421717172*iWidth+q,0.932320442*iHeight);
  curveVertex(0.444444444*iWidth+q,0.924033149*iHeight);
  curveVertex(0.446969697*iWidth+q,0.910220994*iHeight);
  curveVertex(0.449494949*iWidth+q,0.901933702*iHeight);
  curveVertex(0.441919192*iWidth+q,0.890883978*iHeight);
  curveVertex(0.434343434*iWidth+q,0.88121547*iHeight);
  curveVertex(0.426767677*iWidth+q,0.870165746*iHeight);
  curveVertex(0.419191919*iWidth+q,0.860497238*iHeight);
  curveVertex(0.419191919*iWidth+q,0.860497238*iHeight);
  endShape(CLOSE);
  
  beginShape();  // black shoes 2
  curveVertex(0.217171717*iWidth+q,0.852209945*iHeight);
  curveVertex(0.217171717*iWidth+q,0.852209945*iHeight);
  curveVertex(0.184343434*iWidth+q,0.870165746*iHeight);
  curveVertex(0.164141414*iWidth+q,0.886740331*iHeight);
  curveVertex(0.138888889*iWidth+q,0.906077348*iHeight);
  curveVertex(0.118686869*iWidth+q,0.921270718*iHeight);
  curveVertex(0.065656566*iWidth+q,0.930939227*iHeight);
  curveVertex(0.02020202*iWidth+q,0.92679558*iHeight);
  curveVertex(0.022727273*iWidth+q,0.933701657*iHeight);
  curveVertex(0.058080808*iWidth+q,0.937845304*iHeight);
  curveVertex(0.098484848*iWidth+q,0.936464088*iHeight);
  curveVertex(0.126262626*iWidth+q,0.92679558*iHeight);
  curveVertex(0.141414141*iWidth+q,0.907458564*iHeight);
  curveVertex(0.156565657*iWidth+q,0.897790055*iHeight);
  curveVertex(0.171717172*iWidth+q,0.888121547*iHeight);
  curveVertex(0.204545455*iWidth+q,0.879834254*iHeight);
  curveVertex(0.214646465*iWidth+q,0.870165746*iHeight);
  curveVertex(0.212121212*iWidth+q,0.860497238*iHeight);
  curveVertex(0.212121212*iWidth+q,0.860497238*iHeight);
  endShape(CLOSE);
    
  fill(255, 255, 255); // white shoes 1
  beginShape();
  curveVertex(0.095959596*iWidth+q,0.86878453*iHeight);
  curveVertex(0.095959596*iWidth+q,0.86878453*iHeight);
  curveVertex(0.027777778*iWidth+q,0.91160221*iHeight);
  curveVertex(0.02020202*iWidth+q,0.925414365*iHeight);
  curveVertex(0.078282828*iWidth+q,0.937845304*iHeight);
  curveVertex(0.126262626*iWidth+q,0.92679558*iHeight);
  curveVertex(0.159090909*iWidth+q,0.888121547*iHeight);
  curveVertex(0.202020202*iWidth+q,0.864640884*iHeight);
  curveVertex(0.202020202*iWidth+q,0.864640884*iHeight);
  endShape(CLOSE);
    
  beginShape(); // white shoes 2
  curveVertex(0.333333333*iWidth+q,0.866022099*iHeight);
  curveVertex(0.333333333*iWidth+q,0.866022099*iHeight);
  curveVertex(0.345959596*iWidth+q,0.885359116*iHeight);
  curveVertex(0.345959596*iWidth+q,0.908839779*iHeight);
  curveVertex(0.361111111*iWidth+q,0.930939227*iHeight);
  curveVertex(0.406565657*iWidth+q,0.929558011*iHeight);
  curveVertex(0.429292929*iWidth+q,0.92679558*iHeight);
  curveVertex(0.449494949*iWidth+q,0.91160221*iHeight);
  curveVertex(0.444444444*iWidth+q,0.89640884*iHeight);
  curveVertex(0.439393939*iWidth+q,0.882596685*iHeight);
  curveVertex(0.414141414*iWidth+q,0.85359116*iHeight);
  curveVertex(0.414141414*iWidth+q,0.85359116*iHeight);
  endShape(CLOSE);
  
  //shoe laces 1
  line(0.073232323*iWidth+q,0.901933702*iHeight,0.101010101*iWidth+q,0.893646409*iHeight);
  line(0.101010101*iWidth+q,0.893646409*iHeight,0.083333333*iWidth+q,0.888121547*iHeight);
  line(0.083333333*iWidth+q,0.888121547*iHeight,0.108585859*iWidth+q,0.88121547*iHeight);
  line(0.108585859*iWidth+q,0.88121547*iHeight,0.095959596*iWidth+q,0.86878453*iHeight);
  line(0.095959596*iWidth+q,0.86878453*iHeight,0.123737374*iWidth+q,0.874309392*iHeight);
  line(0.123737374*iWidth+q,0.874309392*iHeight,0.085858586*iWidth+q,0.879834254*iHeight);
  line(0.085858586*iWidth+q,0.879834254*iHeight,0.101010101*iWidth+q,0.886740331*iHeight);
  line(0.101010101*iWidth+q,0.886740331*iHeight,0.078282828*iWidth+q,0.893646409*iHeight);
  line(0.078282828*iWidth+q,0.893646409*iHeight,0.090909091*iWidth+q,0.906077348*iHeight);
  
  //shoe laces 2
  line(0.396464646*iWidth+q,0.89640884*iHeight,0.411616162*iWidth+q,0.883977901*iHeight);
  line(0.411616162*iWidth+q,0.883977901*iHeight,0.381313131*iWidth+q,0.882596685*iHeight);
  line(0.381313131*iWidth+q,0.882596685*iHeight,0.401515152*iWidth+q,0.870165746*iHeight);
  line(0.401515152*iWidth+q,0.870165746*iHeight,0.381313131*iWidth+q,0.866022099*iHeight);
  line(0.381313131*iWidth+q,0.866022099*iHeight,0.401515152*iWidth+q,0.859116022*iHeight);
  line(0.401515152*iWidth+q,0.859116022*iHeight,0.383838384*iWidth+q,0.871546961*iHeight);
  line(0.383838384*iWidth+q,0.871546961*iHeight,0.404040404*iWidth+q,0.877071823*iHeight);
  line(0.404040404*iWidth+q,0.877071823*iHeight,0.393939394*iWidth+q,0.889502762*iHeight);
  line(0.393939394*iWidth+q,0.889502762*iHeight,0.414141414*iWidth+q,0.890883978*iHeight);
    
  fill(181,181,195); //pants
  beginShape();
  curveVertex(0.080808081*iWidth+q,0.473756906*iHeight);
  curveVertex(0.080808081*iWidth+q,0.473756906*iHeight);
  curveVertex(0.075757576*iWidth+q,0.482044199*iHeight);
  curveVertex(0.073232323*iWidth+q,0.509668508*iHeight);
  curveVertex(0.083333333*iWidth+q,0.524861878*iHeight);
  curveVertex(0.078282828*iWidth+q,0.578729282*iHeight);
  curveVertex(0.088383838*iWidth+q,0.602209945*iHeight);
  curveVertex(0.088383838*iWidth+q,0.633977901*iHeight);
  curveVertex(0.103535354*iWidth+q,0.664364641*iHeight);
  curveVertex(0.098484848*iWidth+q,0.678176796*iHeight);
  curveVertex(0.106060606*iWidth+q,0.698895028*iHeight);
  curveVertex(0.095959596*iWidth+q,0.714088398*iHeight);
  curveVertex(0.098484848*iWidth+q,0.723756906*iHeight);
  curveVertex(0.085858586*iWidth+q,0.763812155*iHeight);
  curveVertex(0.080808081*iWidth+q,0.814917127*iHeight);
  curveVertex(0.106060606*iWidth+q,0.841160221*iHeight);
  curveVertex(0.093434343*iWidth+q,0.845303867*iHeight);
  curveVertex(0.095959596*iWidth+q,0.86878453*iHeight);
  curveVertex(0.174242424*iWidth+q,0.872928177*iHeight);
  curveVertex(0.222222222*iWidth+q,0.849447514*iHeight);
  curveVertex(0.224747475*iWidth+q,0.834254144*iHeight);
  curveVertex(0.20959596*iWidth+q,0.813535912*iHeight);
  curveVertex(0.23989899*iWidth+q,0.747237569*iHeight);
  curveVertex(0.23989899*iWidth+q,0.660220994*iHeight);
  curveVertex(0.257575758*iWidth+q,0.651933702*iHeight);
  curveVertex(0.262626263*iWidth+q,0.598066298*iHeight);
  curveVertex(0.262626263*iWidth+q,0.575966851*iHeight);
  curveVertex(0.255050505*iWidth+q,0.563535912*iHeight);
  curveVertex(0.265151515*iWidth+q,0.575966851*iHeight);
  curveVertex(0.265151515*iWidth+q,0.598066298*iHeight);
  curveVertex(0.292929293*iWidth+q,0.642265193*iHeight);
  curveVertex(0.308080808*iWidth+q,0.672651934*iHeight);
  curveVertex(0.313131313*iWidth+q,0.727900552*iHeight);
  curveVertex(0.300505051*iWidth+q,0.777624309*iHeight);
  curveVertex(0.308080808*iWidth+q,0.794198895*iHeight);
  curveVertex(0.308080808*iWidth+q,0.828729282*iHeight);
  curveVertex(0.333333333*iWidth+q,0.866022099*iHeight);
  curveVertex(0.398989899*iWidth+q,0.860497238*iHeight);
  curveVertex(0.414141414*iWidth+q,0.854972376*iHeight);
  curveVertex(0.411616162*iWidth+q,0.832872928*iHeight);
  curveVertex(0.444444444*iWidth+q,0.783149171*iHeight);
  curveVertex(0.436868687*iWidth+q,0.70441989*iHeight);
  curveVertex(0.436868687*iWidth+q,0.679558011*iHeight);
  curveVertex(0.424242424*iWidth+q,0.662983425*iHeight);
  curveVertex(0.434343434*iWidth+q,0.64640884*iHeight);
  curveVertex(0.441919192*iWidth+q,0.535911602*iHeight);
  curveVertex(0.446969697*iWidth+q,0.523480663*iHeight);
  curveVertex(0.449494949*iWidth+q,0.508287293*iHeight);
  curveVertex(0.441919192*iWidth+q,0.494475138*iHeight);
  curveVertex(0.436868687*iWidth+q,0.486187845*iHeight);
  curveVertex(0.436868687*iWidth+q,0.486187845*iHeight);
  endShape(CLOSE);
  
  fill(37,91,191); //undershirt 1
  beginShape();
  curveVertex(0.106060606*iWidth+q,0.363259669*iHeight);
  curveVertex(0.106060606*iWidth+q,0.363259669*iHeight);
  curveVertex(0.101010101*iWidth+q,0.386740331*iHeight);
  curveVertex(0.108585859*iWidth+q,0.403314917*iHeight);
  curveVertex(0.098484848*iWidth+q,0.415745856*iHeight);
  curveVertex(0.106060606*iWidth+q,0.429558011*iHeight);
  curveVertex(0.098484848*iWidth+q,0.439226519*iHeight);
  curveVertex(0.101010101*iWidth+q,0.453038674*iHeight);
  curveVertex(0.093434343*iWidth+q,0.462707182*iHeight);
  curveVertex(0.161616162*iWidth+q,0.470994475*iHeight);
  curveVertex(0.303030303*iWidth+q,0.473756906*iHeight);
  curveVertex(0.396464646*iWidth+q,0.468232044*iHeight);
  curveVertex(0.436868687*iWidth+q,0.464088398*iHeight);
  curveVertex(0.441919192*iWidth+q,0.430939227*iHeight);
  curveVertex(0.439393939*iWidth+q,0.389502762*iHeight);
  curveVertex(0.439393939*iWidth+q,0.38121547*iHeight);
  curveVertex(0.439393939*iWidth+q,0.38121547*iHeight);
  endShape(CLOSE);
  
  beginShape(); //undershirt 2
  curveVertex(0.315656566*iWidth+q,0.360497238*iHeight);
  curveVertex(0.315656566*iWidth+q,0.360497238*iHeight);
  curveVertex(0.204545455*iWidth+q,0.367403315*iHeight);
  curveVertex(0.078282828*iWidth+q,0.364640884*iHeight);
  curveVertex(0.045454545*iWidth+q,0.32320442*iHeight);
  curveVertex(0.037878788*iWidth+q,0.283149171*iHeight);
  curveVertex(0.050505051*iWidth+q,0.247237569*iHeight);
  curveVertex(0.045454545*iWidth+q,0.236187845*iHeight);
  curveVertex(0.050505051*iWidth+q,0.220994475*iHeight);
  curveVertex(0.053030303*iWidth+q,0.208563536*iHeight);
  curveVertex(0.085858586*iWidth+q,0.183701657*iHeight);
  curveVertex(0.113636364*iWidth+q,0.172651934*iHeight);
  curveVertex(0.143939394*iWidth+q,0.169889503*iHeight);
  curveVertex(0.174242424*iWidth+q,0.165745856*iHeight);
  curveVertex(0.204545455*iWidth+q,0.142265193*iHeight);
  curveVertex(0.348484848*iWidth+q,0.139502762*iHeight);
  curveVertex(0.358585859*iWidth+q,0.151933702*iHeight);
  curveVertex(0.376262626*iWidth+q,0.160220994*iHeight);
  curveVertex(0.439393939*iWidth+q,0.169889503*iHeight);
  curveVertex(0.492424242*iWidth+q,0.194751381*iHeight);
  curveVertex(0.51010101*iWidth+q,0.21961326*iHeight);
  curveVertex(0.515151515*iWidth+q,0.251381215*iHeight);
  curveVertex(0.515151515*iWidth+q,0.291436464*iHeight);
  curveVertex(0.51010101*iWidth+q,0.316298343*iHeight);
  curveVertex(0.492424242*iWidth+q,0.366022099*iHeight);
  curveVertex(0.376262626*iWidth+q,0.389502762*iHeight);
  curveVertex(0.21969697*iWidth+q,0.390883978*iHeight);
  curveVertex(0.212121212*iWidth+q,0.36878453*iHeight);
  curveVertex(0.212121212*iWidth+q,0.36878453*iHeight);
  endShape(CLOSE);
  
  fill(198,160,139); //brown bear shape
  beginShape();
  curveVertex(0.702020202*iWidth+q,0.070441989*iHeight);
  curveVertex(0.702020202*iWidth+q,0.070441989*iHeight);
  curveVertex(0.659090909*iWidth+q,0.075966851*iHeight);
  curveVertex(0.608585859*iWidth+q,0.071823204*iHeight);
  curveVertex(0.573232323*iWidth+q,0.075966851*iHeight);
  curveVertex(0.532828283*iWidth+q,0.064917127*iHeight);
  curveVertex(0.515151515*iWidth+q,0.071823204*iHeight);
  curveVertex(0.5*iWidth+q,0.085635359*iHeight);
  curveVertex(0.497474747*iWidth+q,0.099447514*iHeight);
  curveVertex(0.502525253*iWidth+q,0.107734807*iHeight);
  curveVertex(0.51010101*iWidth+q,0.110497238*iHeight);
  curveVertex(0.497474747*iWidth+q,0.13121547*iHeight);
  curveVertex(0.487373737*iWidth+q,0.14640884*iHeight);
  curveVertex(0.487373737*iWidth+q,0.174033149*iHeight);
  curveVertex(0.492424242*iWidth+q,0.185082873*iHeight);
  curveVertex(0.502525253*iWidth+q,0.198895028*iHeight);
  curveVertex(0.505050505*iWidth+q,0.20718232*iHeight);
  curveVertex(0.507575758*iWidth+q,0.218232044*iHeight);
  curveVertex(0.497474747*iWidth+q,0.25*iHeight);
  curveVertex(0.477272727*iWidth+q,0.328729282*iHeight);
  curveVertex(0.474747475*iWidth+q,0.364640884*iHeight);
  curveVertex(0.446969697*iWidth+q,0.382596685*iHeight);
  curveVertex(0.441919192*iWidth+q,0.41160221*iHeight);
  curveVertex(0.441919192*iWidth+q,0.436464088*iHeight);
  curveVertex(0.441919192*iWidth+q,0.473756906*iHeight);
  curveVertex(0.449494949*iWidth+q,0.517955801*iHeight);
  curveVertex(0.449494949*iWidth+q,0.537292818*iHeight);
  curveVertex(0.444444444*iWidth+q,0.535911602*iHeight);
  curveVertex(0.441919192*iWidth+q,0.566298343*iHeight);
  curveVertex(0.439393939*iWidth+q,0.596685083*iHeight);
  curveVertex(0.436868687*iWidth+q,0.620165746*iHeight);
  curveVertex(0.436868687*iWidth+q,0.649171271*iHeight);
  curveVertex(0.467171717*iWidth+q,0.723756906*iHeight);
  curveVertex(0.46969697*iWidth+q,0.754143646*iHeight);
  curveVertex(0.46969697*iWidth+q,0.788674033*iHeight);
  curveVertex(0.431818182*iWidth+q,0.802486188*iHeight);
  curveVertex(0.416666667*iWidth+q,0.821823204*iHeight);
  curveVertex(0.416666667*iWidth+q,0.854972376*iHeight);
  curveVertex(0.431818182*iWidth+q,0.878453039*iHeight);
  curveVertex(0.446969697*iWidth+q,0.895027624*iHeight);
  curveVertex(0.452020202*iWidth+q,0.91160221*iHeight);
  curveVertex(0.462121212*iWidth+q,0.930939227*iHeight);
  curveVertex(0.47979798*iWidth+q,0.95718232*iHeight);
  curveVertex(0.532828283*iWidth+q,0.970994475*iHeight);
  curveVertex(0.560606061*iWidth+q,0.973756906*iHeight);
  curveVertex(0.606060606*iWidth+q,0.976519337*iHeight);
  curveVertex(0.641414141*iWidth+q,0.975138122*iHeight);
  curveVertex(0.727272727*iWidth+q,0.975138122*iHeight);
  curveVertex(0.777777778*iWidth+q,0.976519337*iHeight);
  curveVertex(0.856060606*iWidth+q,0.973756906*iHeight);
  curveVertex(0.896464646*iWidth+q,0.965469613*iHeight);
  curveVertex(0.954545455*iWidth+q,0.925414365*iHeight);
  curveVertex(0.97979798*iWidth+q,0.892265193*iHeight);
  curveVertex(0.98989899*iWidth+q,0.863259669*iHeight);
  curveVertex(0.987373737*iWidth+q,0.832872928*iHeight);
  curveVertex(0.972222222*iWidth+q,0.812154696*iHeight);
  curveVertex(0.929292929*iWidth+q,0.783149171*iHeight);
  curveVertex(0.941919192*iWidth+q,0.725138122*iHeight);
  curveVertex(0.952020202*iWidth+q,0.665745856*iHeight);
  curveVertex(0.957070707*iWidth+q,0.621546961*iHeight);
  curveVertex(0.95959596*iWidth+q,0.566298343*iHeight);
  curveVertex(0.946969697*iWidth+q,0.526243094*iHeight);
  curveVertex(0.944444444*iWidth+q,0.505524862*iHeight);
  curveVertex(0.952020202*iWidth+q,0.45718232*iHeight);
  curveVertex(0.957070707*iWidth+q,0.430939227*iHeight);
  curveVertex(0.949494949*iWidth+q,0.383977901*iHeight);
  curveVertex(0.921717172*iWidth+q,0.337016575*iHeight);
  curveVertex(0.911616162*iWidth+q,0.284530387*iHeight);
  curveVertex(0.893939394*iWidth+q,0.193370166*iHeight);
  curveVertex(0.909090909*iWidth+q,0.165745856*iHeight);
  curveVertex(0.914141414*iWidth+q,0.133977901*iHeight);
  curveVertex(0.911616162*iWidth+q,0.120165746*iHeight);
  curveVertex(0.896464646*iWidth+q,0.104972376*iHeight);
  curveVertex(0.901515152*iWidth+q,0.096685083*iHeight);
  curveVertex(0.914141414*iWidth+q,0.085635359*iHeight);
  curveVertex(0.898989899*iWidth+q,0.069060773*iHeight);
  curveVertex(0.883838384*iWidth+q,0.062154696*iHeight);
  curveVertex(0.845959596*iWidth+q,0.059392265*iHeight);
  curveVertex(0.810606061*iWidth+q,0.067679558*iHeight);
  curveVertex(0.810606061*iWidth+q,0.078729282*iHeight);
  curveVertex(0.805555556*iWidth+q,0.071823204*iHeight);
  curveVertex(0.777777778*iWidth+q,0.071823204*iHeight);
  curveVertex(0.755050505*iWidth+q,0.071823204*iHeight);
  curveVertex(0.707070707*iWidth+q,0.069060773*iHeight);
  curveVertex(0.707070707*iWidth+q,0.069060773*iHeight);
  endShape(CLOSE);
  
  fill(231,217,188);//bear light parts 1
  beginShape();
  curveVertex(0.441919192*iWidth+q,0.451657459*iHeight);
  curveVertex(0.441919192*iWidth+q,0.451657459*iHeight);
  curveVertex(0.474747475*iWidth+q,0.493093923*iHeight);
  curveVertex(0.5*iWidth+q,0.51519337*iHeight);
  curveVertex(0.505050505*iWidth+q,0.540055249*iHeight);
  curveVertex(0.51010101*iWidth+q,0.556629834*iHeight);
  curveVertex(0.47979798*iWidth+q,0.560773481*iHeight);
  curveVertex(0.462121212*iWidth+q,0.555248619*iHeight);
  curveVertex(0.452020202*iWidth+q,0.527624309*iHeight);
  curveVertex(0.452020202*iWidth+q,0.527624309*iHeight);
  endShape(CLOSE);
  
  beginShape();//bear light parts 2
  curveVertex(0.952020202*iWidth+q,0.535911602*iHeight);
  curveVertex(0.952020202*iWidth+q,0.535911602*iHeight);
  curveVertex(0.888888889*iWidth+q,0.580110497*iHeight);
  curveVertex(0.886363636*iWidth+q,0.638121547*iHeight);
  curveVertex(0.893939394*iWidth+q,0.687845304*iHeight);
  curveVertex(0.919191919*iWidth+q,0.740331492*iHeight);
  curveVertex(0.919191919*iWidth+q,0.758287293*iHeight);
  curveVertex(0.861111111*iWidth+q,0.837016575*iHeight);
  curveVertex(0.845959596*iWidth+q,0.886740331*iHeight);
  curveVertex(0.810606061*iWidth+q,0.94198895*iHeight);
  curveVertex(0.805555556*iWidth+q,0.976519337*iHeight);
  curveVertex(0.881313131*iWidth+q,0.970994475*iHeight);
  curveVertex(0.921717172*iWidth+q,0.946132597*iHeight);
  curveVertex(0.952020202*iWidth+q,0.925414365*iHeight);
  curveVertex(0.984848485*iWidth+q,0.886740331*iHeight);
  curveVertex(0.992424242*iWidth+q,0.834254144*iHeight);
  curveVertex(0.952020202*iWidth+q,0.801104972*iHeight);
  curveVertex(0.941919192*iWidth+q,0.788674033*iHeight);
  curveVertex(0.949494949*iWidth+q,0.665745856*iHeight);
  curveVertex(0.962121212*iWidth+q,0.628453039*iHeight);
  curveVertex(0.964646465*iWidth+q,0.57320442*iHeight);
  curveVertex(0.964646465*iWidth+q,0.57320442*iHeight);
  endShape(CLOSE);
  
  beginShape();//bear light parts 3
  curveVertex(0.946969697*iWidth+q,0.389502762*iHeight);
  curveVertex(0.946969697*iWidth+q,0.389502762*iHeight);
  curveVertex(0.906565657*iWidth+q,0.429558011*iHeight);
  curveVertex(0.858585859*iWidth+q,0.464088398*iHeight);
  curveVertex(0.830808081*iWidth+q,0.512430939*iHeight);
  curveVertex(0.808080808*iWidth+q,0.563535912*iHeight);
  curveVertex(0.936868687*iWidth+q,0.555248619*iHeight);
  curveVertex(0.944444444*iWidth+q,0.506906077*iHeight);
  curveVertex(0.964646465*iWidth+q,0.439226519*iHeight);
  curveVertex(0.964646465*iWidth+q,0.439226519*iHeight);
  endShape(CLOSE);
  
  fill(112,250,253); //blue sweater 1
  beginShape();
  curveVertex(0.093434343*iWidth+q,0.461325967*iHeight);
  curveVertex(0.093434343*iWidth+q,0.461325967*iHeight);
  curveVertex(0.078282828*iWidth+q,0.473756906*iHeight);
  curveVertex(0.151515152*iWidth+q,0.487569061*iHeight);
  curveVertex(0.242424242*iWidth+q,0.490331492*iHeight);
  curveVertex(0.292929293*iWidth+q,0.490331492*iHeight);
  curveVertex(0.313131313*iWidth+q,0.486187845*iHeight);
  curveVertex(0.406565657*iWidth+q,0.486187845*iHeight);
  curveVertex(0.444444444*iWidth+q,0.486187845*iHeight);
  curveVertex(0.441919192*iWidth+q,0.466850829*iHeight);
  curveVertex(0.381313131*iWidth+q,0.468232044*iHeight);
  curveVertex(0.328282828*iWidth+q,0.46961326*iHeight);
  curveVertex(0.300505051*iWidth+q,0.470994475*iHeight);
  curveVertex(0.257575758*iWidth+q,0.470994475*iHeight);
  curveVertex(0.212121212*iWidth+q,0.46961326*iHeight);
  curveVertex(0.164141414*iWidth+q,0.468232044*iHeight);
  curveVertex(0.128787879*iWidth+q,0.462707182*iHeight);
  curveVertex(0.095959596*iWidth+q,0.462707182*iHeight);
  curveVertex(0.095959596*iWidth+q,0.462707182*iHeight);
  endShape(CLOSE);
  
  beginShape(); //blue sweater 2
  curveVertex(0.20959596*iWidth+q,0.142265193*iHeight);
  curveVertex(0.20959596*iWidth+q,0.142265193*iHeight);
  curveVertex(0.214646465*iWidth+q,0.149171271*iHeight);
  curveVertex(0.217171717*iWidth+q,0.174033149*iHeight);
  curveVertex(0.237373737*iWidth+q,0.193370166*iHeight);
  curveVertex(0.28030303*iWidth+q,0.198895028*iHeight);
  curveVertex(0.287878788*iWidth+q,0.201657459*iHeight);
  curveVertex(0.320707071*iWidth+q,0.187845304*iHeight);
  curveVertex(0.340909091*iWidth+q,0.178176796*iHeight);
  curveVertex(0.343434343*iWidth+q,0.157458564*iHeight);
  curveVertex(0.343434343*iWidth+q,0.145027624*iHeight);
  curveVertex(0.335858586*iWidth+q,0.139502762*iHeight);
  curveVertex(0.353535354*iWidth+q,0.149171271*iHeight);
  curveVertex(0.356060606*iWidth+q,0.171270718*iHeight);
  curveVertex(0.351010101*iWidth+q,0.183701657*iHeight);
  curveVertex(0.333333333*iWidth+q,0.19198895*iHeight);
  curveVertex(0.325757576*iWidth+q,0.196132597*iHeight);
  curveVertex(0.320707071*iWidth+q,0.200276243*iHeight);
  curveVertex(0.313131313*iWidth+q,0.208563536*iHeight);
  curveVertex(0.305555556*iWidth+q,0.218232044*iHeight);
  curveVertex(0.300505051*iWidth+q,0.229281768*iHeight);
  curveVertex(0.29040404*iWidth+q,0.243093923*iHeight);
  curveVertex(0.287878788*iWidth+q,0.255524862*iHeight);
  curveVertex(0.265151515*iWidth+q,0.232044199*iHeight);
  curveVertex(0.262626263*iWidth+q,0.215469613*iHeight);
  curveVertex(0.257575758*iWidth+q,0.20441989*iHeight);
  curveVertex(0.244949495*iWidth+q,0.201657459*iHeight);
  curveVertex(0.21969697*iWidth+q,0.194751381*iHeight);
  curveVertex(0.217171717*iWidth+q,0.200276243*iHeight);
  curveVertex(0.202020202*iWidth+q,0.187845304*iHeight);
  curveVertex(0.199494949*iWidth+q,0.156077348*iHeight);
  curveVertex(0.207070707*iWidth+q,0.145027624*iHeight);
  curveVertex(0.207070707*iWidth+q,0.145027624*iHeight);
  endShape(CLOSE);
  
  //outlines of blue sweater
  line(0.25*iWidth+q,0.363259669*iHeight,0.232323232*iWidth+q,0.309392265*iHeight);
  line(0.285353535*iWidth+q,0.388121547*iHeight,0.282828283*iWidth+q,0.361878453*iHeight);
  line(0.318181818*iWidth+q,0.356353591*iHeight,0.303030303*iWidth+q,0.302486188*iHeight);
  line(0.23989899*iWidth+q,0.30801105*iHeight,0.303030303*iWidth+q,0.303867403*iHeight);
  line(0.23989899*iWidth+q,0.306629834*iHeight,0.169191919*iWidth+q,0.301104972*iHeight);
  line(0.123737374*iWidth+q,0.302486188*iHeight,0.171717172*iWidth+q,0.302486188*iHeight);
  line(0.121212121*iWidth+q,0.303867403*iHeight,0.146464646*iWidth+q,0.256906077*iHeight);
  line(0.315656566*iWidth+q,0.337016575*iHeight,0.338383838*iWidth+q,0.332872928*iHeight);
  line(0.353535354*iWidth+q,0.328729282*iHeight,0.393939394*iWidth+q,0.327348066*iHeight);
  line(0.393939394*iWidth+q,0.327348066*iHeight,0.414141414*iWidth+q,0.306629834*iHeight);
  line(0.416666667*iWidth+q,0.305248619*iHeight,0.411616162*iWidth+q,0.29281768*iHeight);
  line(0.411616162*iWidth+q,0.284530387*iHeight,0.416666667*iWidth+q,0.254143646*iHeight);
  
  fill(234,223,217); //hands 1
  beginShape();
  curveVertex(0.303030303*iWidth+q,0.305248619*iHeight);
  curveVertex(0.303030303*iWidth+q,0.305248619*iHeight);
  curveVertex(0.313131313*iWidth+q,0.337016575*iHeight);
  curveVertex(0.366161616*iWidth+q,0.327348066*iHeight);
  curveVertex(0.393939394*iWidth+q,0.328729282*iHeight);
  curveVertex(0.411616162*iWidth+q,0.310773481*iHeight);
  curveVertex(0.411616162*iWidth+q,0.296961326*iHeight);
  curveVertex(0.378787879*iWidth+q,0.298342541*iHeight);
  curveVertex(0.356060606*iWidth+q,0.302486188*iHeight);
  curveVertex(0.308080808*iWidth+q,0.303867403*iHeight);
  curveVertex(0.308080808*iWidth+q,0.303867403*iHeight);
  endShape(CLOSE);
  
  beginShape();//hands 2
  curveVertex(0.181818182*iWidth+q,0.301104972*iHeight);
  curveVertex(0.181818182*iWidth+q,0.301104972*iHeight);
  curveVertex(0.161616162*iWidth+q,0.28038674*iHeight);
  curveVertex(0.148989899*iWidth+q,0.270718232*iHeight);
  curveVertex(0.126262626*iWidth+q,0.26519337*iHeight);
  curveVertex(0.123737374*iWidth+q,0.273480663*iHeight);
  curveVertex(0.113636364*iWidth+q,0.266574586*iHeight);
  curveVertex(0.106060606*iWidth+q,0.270718232*iHeight);
  curveVertex(0.098484848*iWidth+q,0.277624309*iHeight);
  curveVertex(0.116161616*iWidth+q,0.288674033*iHeight);
  curveVertex(0.111111111*iWidth+q,0.291436464*iHeight);
  curveVertex(0.128787879*iWidth+q,0.302486188*iHeight);
  curveVertex(0.171717172*iWidth+q,0.302486188*iHeight);
  curveVertex(0.171717172*iWidth+q,0.302486188*iHeight);
  endShape(CLOSE);
  
  fill(97,121,159); //grey collar
  beginShape();
  curveVertex(0.277777778*iWidth+q,0.279005525*iHeight);
  curveVertex(0.277777778*iWidth+q,0.279005525*iHeight);
  curveVertex(0.277777778*iWidth+q,0.261049724*iHeight);
  curveVertex(0.25*iWidth+q,0.227900552*iHeight);
  curveVertex(0.247474747*iWidth+q,0.212707182*iHeight);
  curveVertex(0.176767677*iWidth+q,0.20718232*iHeight);
  curveVertex(0.164141414*iWidth+q,0.20441989*iHeight);
  curveVertex(0.176767677*iWidth+q,0.19198895*iHeight);
  curveVertex(0.181818182*iWidth+q,0.164364641*iHeight);
  curveVertex(0.196969697*iWidth+q,0.147790055*iHeight);
  curveVertex(0.207070707*iWidth+q,0.142265193*iHeight);
  curveVertex(0.204545455*iWidth+q,0.151933702*iHeight);
  curveVertex(0.196969697*iWidth+q,0.160220994*iHeight);
  curveVertex(0.196969697*iWidth+q,0.17679558*iHeight);
  curveVertex(0.199494949*iWidth+q,0.190607735*iHeight);
  curveVertex(0.21969697*iWidth+q,0.198895028*iHeight);
  curveVertex(0.232323232*iWidth+q,0.200276243*iHeight);
  curveVertex(0.255050505*iWidth+q,0.205801105*iHeight);
  curveVertex(0.267676768*iWidth+q,0.222375691*iHeight);
  curveVertex(0.275252525*iWidth+q,0.238950276*iHeight);
  curveVertex(0.282828283*iWidth+q,0.247237569*iHeight);
  curveVertex(0.287878788*iWidth+q,0.241712707*iHeight);
  curveVertex(0.300505051*iWidth+q,0.226519337*iHeight);
  curveVertex(0.313131313*iWidth+q,0.214088398*iHeight);
  curveVertex(0.320707071*iWidth+q,0.20441989*iHeight);
  curveVertex(0.330808081*iWidth+q,0.198895028*iHeight);
  curveVertex(0.335858586*iWidth+q,0.194751381*iHeight);
  curveVertex(0.343434343*iWidth+q,0.189226519*iHeight);
  curveVertex(0.356060606*iWidth+q,0.183701657*iHeight);
  curveVertex(0.356060606*iWidth+q,0.174033149*iHeight);
  curveVertex(0.353535354*iWidth+q,0.160220994*iHeight);
  curveVertex(0.351010101*iWidth+q,0.151933702*iHeight);
  curveVertex(0.340909091*iWidth+q,0.140883978*iHeight);
  curveVertex(0.348484848*iWidth+q,0.139502762*iHeight);
  curveVertex(0.363636364*iWidth+q,0.151933702*iHeight);
  curveVertex(0.373737374*iWidth+q,0.160220994*iHeight);
  curveVertex(0.391414141*iWidth+q,0.171270718*iHeight);
  curveVertex(0.398989899*iWidth+q,0.189226519*iHeight);
  curveVertex(0.401515152*iWidth+q,0.194751381*iHeight);
  curveVertex(0.378787879*iWidth+q,0.196132597*iHeight);
  curveVertex(0.361111111*iWidth+q,0.197513812*iHeight);
  curveVertex(0.351010101*iWidth+q,0.203038674*iHeight);
  curveVertex(0.335858586*iWidth+q,0.214088398*iHeight);
  curveVertex(0.318181818*iWidth+q,0.232044199*iHeight);
  curveVertex(0.300505051*iWidth+q,0.255524862*iHeight);
  curveVertex(0.303030303*iWidth+q,0.272099448*iHeight);
  curveVertex(0.303030303*iWidth+q,0.272099448*iHeight);
  endShape(CLOSE);
  
  fill(15,19,20); //hair
  beginShape();
  curveVertex(0.189393939*iWidth+q,0.10359116*iHeight);
  curveVertex(0.189393939*iWidth+q,0.10359116*iHeight);
  curveVertex(0.179292929*iWidth+q,0.060773481*iHeight);
  curveVertex(0.191919192*iWidth+q,0.031767956*iHeight);
  curveVertex(0.224747475*iWidth+q,0.017955801*iHeight);
  curveVertex(0.244949495*iWidth+q,0.012430939*iHeight);
  curveVertex(0.272727273*iWidth+q,0.008287293*iHeight);
  curveVertex(0.330808081*iWidth+q,0.017955801*iHeight);
  curveVertex(0.353535354*iWidth+q,0.037292818*iHeight);
  curveVertex(0.368686869*iWidth+q,0.056629834*iHeight);
  curveVertex(0.363636364*iWidth+q,0.078729282*iHeight);
  curveVertex(0.361111111*iWidth+q,0.08839779*iHeight);
  curveVertex(0.351010101*iWidth+q,0.099447514*iHeight);
  curveVertex(0.351010101*iWidth+q,0.10359116*iHeight);
  curveVertex(0.351010101*iWidth+q,0.10359116*iHeight);
  endShape(CLOSE);
  
  fill(213,199,188); //head
  beginShape();
  curveVertex(0.23989899*iWidth+q,0.19198895*iHeight);
  curveVertex(0.23989899*iWidth+q,0.19198895*iHeight);
  curveVertex(0.217171717*iWidth+q,0.175414365*iHeight);
  curveVertex(0.214646465*iWidth+q,0.164364641*iHeight);
  curveVertex(0.214646465*iWidth+q,0.151933702*iHeight);
  curveVertex(0.214646465*iWidth+q,0.143646409*iHeight);
  curveVertex(0.204545455*iWidth+q,0.136740331*iHeight);
  curveVertex(0.189393939*iWidth+q,0.120165746*iHeight);
  curveVertex(0.191919192*iWidth+q,0.114640884*iHeight);
  curveVertex(0.181818182*iWidth+q,0.114640884*iHeight);
  curveVertex(0.181818182*iWidth+q,0.104972376*iHeight);
  curveVertex(0.179292929*iWidth+q,0.095303867*iHeight);
  curveVertex(0.176767677*iWidth+q,0.085635359*iHeight);
  curveVertex(0.181818182*iWidth+q,0.081491713*iHeight);
  curveVertex(0.186868687*iWidth+q,0.077348066*iHeight);
  curveVertex(0.186868687*iWidth+q,0.066298343*iHeight);
  curveVertex(0.189393939*iWidth+q,0.046961326*iHeight);
  curveVertex(0.199494949*iWidth+q,0.034530387*iHeight);
  curveVertex(0.212121212*iWidth+q,0.031767956*iHeight);
  curveVertex(0.237373737*iWidth+q,0.031767956*iHeight);
  curveVertex(0.262626263*iWidth+q,0.033149171*iHeight);
  curveVertex(0.272727273*iWidth+q,0.04281768*iHeight);
  curveVertex(0.29040404*iWidth+q,0.037292818*iHeight);
  curveVertex(0.310606061*iWidth+q,0.038674033*iHeight);
  curveVertex(0.315656566*iWidth+q,0.038674033*iHeight);
  curveVertex(0.345959596*iWidth+q,0.04558011*iHeight);
  curveVertex(0.353535354*iWidth+q,0.060773481*iHeight);
  curveVertex(0.356060606*iWidth+q,0.07320442*iHeight);
  curveVertex(0.348484848*iWidth+q,0.092541436*iHeight);
  curveVertex(0.353535354*iWidth+q,0.098066298*iHeight);
  curveVertex(0.358585859*iWidth+q,0.093922652*iHeight);
  curveVertex(0.366161616*iWidth+q,0.093922652*iHeight);
  curveVertex(0.371212121*iWidth+q,0.099447514*iHeight);
  curveVertex(0.358585859*iWidth+q,0.122928177*iHeight);
  curveVertex(0.348484848*iWidth+q,0.124309392*iHeight);
  curveVertex(0.340909091*iWidth+q,0.124309392*iHeight);
  curveVertex(0.340909091*iWidth+q,0.139502762*iHeight);
  curveVertex(0.343434343*iWidth+q,0.150552486*iHeight);
  curveVertex(0.343434343*iWidth+q,0.158839779*iHeight);
  curveVertex(0.330808081*iWidth+q,0.179558011*iHeight);
  curveVertex(0.315656566*iWidth+q,0.187845304*iHeight);
  curveVertex(0.285353535*iWidth+q,0.200276243*iHeight);
  curveVertex(0.23989899*iWidth+q,0.193370166*iHeight);
  curveVertex(0.23989899*iWidth+q,0.193370166*iHeight);
  endShape(CLOSE);
  
  beginShape(); //glasses 1
  curveVertex(0.202020202*iWidth+q,0.082872928*iHeight);
  curveVertex(0.202020202*iWidth+q,0.082872928*iHeight);
  curveVertex(0.204545455*iWidth+q,0.092541436*iHeight);
  curveVertex(0.227272727*iWidth+q,0.099447514*iHeight);
  curveVertex(0.247474747*iWidth+q,0.098066298*iHeight);
  curveVertex(0.26010101*iWidth+q,0.08839779*iHeight);
  curveVertex(0.26010101*iWidth+q,0.082872928*iHeight);
  curveVertex(0.247474747*iWidth+q,0.078729282*iHeight);
  curveVertex(0.222222222*iWidth+q,0.075966851*iHeight);
  curveVertex(0.204545455*iWidth+q,0.080110497*iHeight);
  curveVertex(0.204545455*iWidth+q,0.080110497*iHeight);
  endShape(CLOSE);
  
  beginShape(); //glasses 2
  curveVertex(0.272727273*iWidth+q,0.085635359*iHeight);
  curveVertex(0.272727273*iWidth+q,0.085635359*iHeight);
  curveVertex(0.282828283*iWidth+q,0.095303867*iHeight);
  curveVertex(0.287878788*iWidth+q,0.100828729*iHeight);
  curveVertex(0.313131313*iWidth+q,0.102209945*iHeight);
  curveVertex(0.330808081*iWidth+q,0.100828729*iHeight);
  curveVertex(0.333333333*iWidth+q,0.087016575*iHeight);
  curveVertex(0.328282828*iWidth+q,0.081491713*iHeight);
  curveVertex(0.308080808*iWidth+q,0.080110497*iHeight);
  curveVertex(0.282828283*iWidth+q,0.080110497*iHeight);
  curveVertex(0.272727273*iWidth+q,0.084254144*iHeight);
  curveVertex(0.272727273*iWidth+q,0.084254144*iHeight);
  endShape(CLOSE);
  
  //glasses frame
  line(0.26010101*iWidth+q,0.085635359*iHeight,0.277777778*iWidth+q,0.087016575*iHeight);
  line(0.333333333*iWidth+q,0.085635359*iHeight,0.356060606*iWidth+q,0.085635359*iHeight);
  line(0.204545455*iWidth+q,0.084254144*iHeight,0.179292929*iWidth+q,0.075966851*iHeight);
  
  fill(245,246,250); //teeth
  beginShape();
  curveVertex(0.23989899*iWidth+q,0.127071823*iHeight);
  curveVertex(0.23989899*iWidth+q,0.127071823*iHeight);
  curveVertex(0.23989899*iWidth+q,0.122928177*iHeight);
  curveVertex(0.255050505*iWidth+q,0.121546961*iHeight);
  curveVertex(0.272727273*iWidth+q,0.121546961*iHeight);
  curveVertex(0.292929293*iWidth+q,0.122928177*iHeight);
  curveVertex(0.29040404*iWidth+q,0.127071823*iHeight);
  curveVertex(0.272727273*iWidth+q,0.128453039*iHeight);
  curveVertex(0.25*iWidth+q,0.128453039*iHeight);
  curveVertex(0.244949495*iWidth+q,0.128453039*iHeight);
  curveVertex(0.244949495*iWidth+q,0.128453039*iHeight);
  endShape(CLOSE);
  
  fill(174,174,176); //glasses
  beginShape();
  curveVertex(0.222222222*iWidth+q,0.071823204*iHeight);
  curveVertex(0.222222222*iWidth+q,0.071823204*iHeight);
  curveVertex(0.204545455*iWidth+q,0.075966851*iHeight);
  curveVertex(0.212121212*iWidth+q,0.069060773*iHeight);
  curveVertex(0.22979798*iWidth+q,0.067679558*iHeight);
  curveVertex(0.244949495*iWidth+q,0.069060773*iHeight);
  curveVertex(0.252525253*iWidth+q,0.074585635*iHeight);
  curveVertex(0.242424242*iWidth+q,0.071823204*iHeight);
  curveVertex(0.222222222*iWidth+q,0.071823204*iHeight);
  curveVertex(0.222222222*iWidth+q,0.071823204*iHeight);
  endShape(CLOSE);
  
  beginShape(); //glasses 2
  curveVertex(0.282828283*iWidth+q,0.078729282*iHeight);
  curveVertex(0.282828283*iWidth+q,0.078729282*iHeight);
  curveVertex(0.297979798*iWidth+q,0.07320442*iHeight);
  curveVertex(0.313131313*iWidth+q,0.07320442*iHeight);
  curveVertex(0.328282828*iWidth+q,0.075966851*iHeight);
  curveVertex(0.338383838*iWidth+q,0.081491713*iHeight);
  curveVertex(0.320707071*iWidth+q,0.077348066*iHeight);
  curveVertex(0.308080808*iWidth+q,0.077348066*iHeight);
  curveVertex(0.297979798*iWidth+q,0.077348066*iHeight);
  curveVertex(0.287878788*iWidth+q,0.078729282*iHeight);
  curveVertex(0.287878788*iWidth+q,0.078729282*iHeight);
  endShape(CLOSE);
  
  fill(218,208,216); //white eyes 1
  beginShape();
  curveVertex(0.224747475*iWidth+q,0.080110497*iHeight);
  curveVertex(0.224747475*iWidth+q,0.080110497*iHeight);
  curveVertex(0.207070707*iWidth+q,0.084254144*iHeight);
  curveVertex(0.227272727*iWidth+q,0.087016575*iHeight);
  curveVertex(0.242424242*iWidth+q,0.085635359*iHeight);
  curveVertex(0.22979798*iWidth+q,0.080110497*iHeight);
  curveVertex(0.22979798*iWidth+q,0.080110497*iHeight);
  endShape(CLOSE);
  
  beginShape(); //white eyes 2
  curveVertex(0.308080808*iWidth+q,0.082872928*iHeight);
  curveVertex(0.308080808*iWidth+q,0.082872928*iHeight);
  curveVertex(0.297979798*iWidth+q,0.082872928*iHeight);
  curveVertex(0.292929293*iWidth+q,0.08839779*iHeight);
  curveVertex(0.305555556*iWidth+q,0.08839779*iHeight);
  curveVertex(0.318181818*iWidth+q,0.089779006*iHeight);
  curveVertex(0.328282828*iWidth+q,0.089779006*iHeight);
  curveVertex(0.315656566*iWidth+q,0.084254144*iHeight);
  curveVertex(0.315656566*iWidth+q,0.084254144*iHeight);
  endShape(CLOSE);
  
  fill(44,34,42); //black eyes 1
  beginShape();
  curveVertex(0.222222222*iWidth+q,0.081491713*iHeight);
  curveVertex(0.222222222*iWidth+q,0.081491713*iHeight);
  curveVertex(0.224747475*iWidth+q,0.084254144*iHeight);
  curveVertex(0.237373737*iWidth+q,0.085635359*iHeight);
  curveVertex(0.237373737*iWidth+q,0.081491713*iHeight);
  curveVertex(0.237373737*iWidth+q,0.081491713*iHeight);
  endShape(CLOSE);
  
  beginShape(); //black eyes 2
  curveVertex(0.300505051*iWidth+q,0.084254144*iHeight);
  curveVertex(0.300505051*iWidth+q,0.084254144*iHeight);
  curveVertex(0.300505051*iWidth+q,0.08839779*iHeight);
  curveVertex(0.310606061*iWidth+q,0.089779006*iHeight);
  curveVertex(0.313131313*iWidth+q,0.085635359*iHeight);
  curveVertex(0.305555556*iWidth+q,0.084254144*iHeight);
  curveVertex(0.305555556*iWidth+q,0.084254144*iHeight);
  endShape(CLOSE);
  
  fill(44,35,40);//white interior eyes 1
  beginShape();
  curveVertex(0.227272727*iWidth+q,0.081491713*iHeight);
  curveVertex(0.227272727*iWidth+q,0.081491713*iHeight);
  curveVertex(0.227272727*iWidth+q,0.081491713*iHeight);
  endShape(CLOSE);
  
  beginShape();//white interior eyes 2
  curveVertex(0.305555556*iWidth+q,0.085635359*iHeight);
  curveVertex(0.305555556*iWidth+q,0.085635359*iHeight);
  curveVertex(0.305555556*iWidth+q,0.085635359*iHeight);
  endShape(CLOSE);
  
  fill(26,18,16); // bear mouth
  beginShape();
  curveVertex(0.659090909*iWidth+q,0.124309392*iHeight);
  curveVertex(0.659090909*iWidth+q,0.124309392*iHeight);
  curveVertex(0.633838384*iWidth+q,0.156077348*iHeight);
  curveVertex(0.641414141*iWidth+q,0.178176796*iHeight);
  curveVertex(0.661616162*iWidth+q,0.180939227*iHeight);
  curveVertex(0.691919192*iWidth+q,0.183701657*iHeight);
  curveVertex(0.72979798*iWidth+q,0.180939227*iHeight);
  curveVertex(0.744949495*iWidth+q,0.17679558*iHeight);
  curveVertex(0.744949495*iWidth+q,0.16160221*iHeight);
  curveVertex(0.752525253*iWidth+q,0.149171271*iHeight);
  curveVertex(0.752525253*iWidth+q,0.132596685*iHeight);
  curveVertex(0.757575758*iWidth+q,0.128453039*iHeight);
  curveVertex(0.742424242*iWidth+q,0.122928177*iHeight);
  curveVertex(0.742424242*iWidth+q,0.122928177*iHeight);
  endShape(CLOSE);
  
  fill(209,194,155); // bear teeth top
  beginShape();
  curveVertex(0.656565657*iWidth+q,0.124309392*iHeight);
  curveVertex(0.656565657*iWidth+q,0.124309392*iHeight);
  curveVertex(0.654040404*iWidth+q,0.143646409*iHeight);
  curveVertex(0.666666667*iWidth+q,0.154696133*iHeight);
  curveVertex(0.671717172*iWidth+q,0.153314917*iHeight);
  curveVertex(0.679292929*iWidth+q,0.136740331*iHeight);
  curveVertex(0.684343434*iWidth+q,0.120165746*iHeight);
  curveVertex(0.679292929*iWidth+q,0.133977901*iHeight);
  curveVertex(0.684343434*iWidth+q,0.138121547*iHeight);
  curveVertex(0.694444444*iWidth+q,0.133977901*iHeight);
  curveVertex(0.694444444*iWidth+q,0.122928177*iHeight);
  curveVertex(0.689393939*iWidth+q,0.135359116*iHeight);
  curveVertex(0.699494949*iWidth+q,0.132596685*iHeight);
  curveVertex(0.704545455*iWidth+q,0.125690608*iHeight);
  curveVertex(0.704545455*iWidth+q,0.132596685*iHeight);
  curveVertex(0.707070707*iWidth+q,0.133977901*iHeight);
  curveVertex(0.714646465*iWidth+q,0.125690608*iHeight);
  curveVertex(0.714646465*iWidth+q,0.136740331*iHeight);
  curveVertex(0.71969697*iWidth+q,0.140883978*iHeight);
  curveVertex(0.724747475*iWidth+q,0.136740331*iHeight);
  curveVertex(0.732323232*iWidth+q,0.125690608*iHeight);
  curveVertex(0.72979798*iWidth+q,0.136740331*iHeight);
  curveVertex(0.732323232*iWidth+q,0.151933702*iHeight);
  curveVertex(0.744949495*iWidth+q,0.147790055*iHeight);
  curveVertex(0.755050505*iWidth+q,0.138121547*iHeight);
  curveVertex(0.757575758*iWidth+q,0.128453039*iHeight);
  curveVertex(0.75*iWidth+q,0.121546961*iHeight);
  curveVertex(0.722222222*iWidth+q,0.121546961*iHeight);
  curveVertex(0.691919192*iWidth+q,0.11878453*iHeight);
  curveVertex(0.656565657*iWidth+q,0.124309392*iHeight);
  curveVertex(0.656565657*iWidth+q,0.124309392*iHeight);
  endShape(CLOSE);
  
  beginShape();  // bear teeth bottom
  curveVertex(0.654040404*iWidth+q,0.182320442*iHeight);
  curveVertex(0.654040404*iWidth+q,0.182320442*iHeight);
  curveVertex(0.671717172*iWidth+q,0.165745856*iHeight);
  curveVertex(0.681818182*iWidth+q,0.168508287*iHeight);
  curveVertex(0.679292929*iWidth+q,0.182320442*iHeight);
  curveVertex(0.684343434*iWidth+q,0.17679558*iHeight);
  curveVertex(0.686868687*iWidth+q,0.17679558*iHeight);
  curveVertex(0.686868687*iWidth+q,0.183701657*iHeight);
  curveVertex(0.691919192*iWidth+q,0.179558011*iHeight);
  curveVertex(0.696969697*iWidth+q,0.17679558*iHeight);
  curveVertex(0.699494949*iWidth+q,0.182320442*iHeight);
  curveVertex(0.704545455*iWidth+q,0.179558011*iHeight);
  curveVertex(0.707070707*iWidth+q,0.174033149*iHeight);
  curveVertex(0.707070707*iWidth+q,0.180939227*iHeight);
  curveVertex(0.717171717*iWidth+q,0.180939227*iHeight);
  curveVertex(0.717171717*iWidth+q,0.175414365*iHeight);
  curveVertex(0.722222222*iWidth+q,0.182320442*iHeight);
  curveVertex(0.727272727*iWidth+q,0.175414365*iHeight);
  curveVertex(0.734848485*iWidth+q,0.164364641*iHeight);
  curveVertex(0.744949495*iWidth+q,0.175414365*iHeight);
  curveVertex(0.744949495*iWidth+q,0.179558011*iHeight);
  curveVertex(0.732323232*iWidth+q,0.182320442*iHeight);
  curveVertex(0.694444444*iWidth+q,0.182320442*iHeight);
  curveVertex(0.664141414*iWidth+q,0.183701657*iHeight);
  curveVertex(0.664141414*iWidth+q,0.183701657*iHeight);
  endShape(CLOSE);
  
  fill(67,96,114);//bear nose
  beginShape();
  curveVertex(0.702020202*iWidth+q,0.085635359*iHeight);
  curveVertex(0.702020202*iWidth+q,0.085635359*iHeight);
  curveVertex(0.681818182*iWidth+q,0.080110497*iHeight);
  curveVertex(0.661616162*iWidth+q,0.069060773*iHeight);
  curveVertex(0.674242424*iWidth+q,0.05801105*iHeight);
  curveVertex(0.699494949*iWidth+q,0.055248619*iHeight);
  curveVertex(0.734848485*iWidth+q,0.056629834*iHeight);
  curveVertex(0.744949495*iWidth+q,0.069060773*iHeight);
  curveVertex(0.734848485*iWidth+q,0.078729282*iHeight);
  curveVertex(0.70959596*iWidth+q,0.084254144*iHeight);
  curveVertex(0.702020202*iWidth+q,0.085635359*iHeight);
  curveVertex(0.702020202*iWidth+q,0.085635359*iHeight);
  endShape(CLOSE);
  
  fill(38,31,38);//bear ears
  beginShape();
  curveVertex(0.52020202*iWidth+q,0.099447514*iHeight);
  curveVertex(0.52020202*iWidth+q,0.099447514*iHeight);
  curveVertex(0.502525253*iWidth+q,0.093922652*iHeight);
  curveVertex(0.512626263*iWidth+q,0.081491713*iHeight);
  curveVertex(0.53030303*iWidth+q,0.07320442*iHeight);
  curveVertex(0.550505051*iWidth+q,0.07320442*iHeight);
  curveVertex(0.563131313*iWidth+q,0.081491713*iHeight);
  curveVertex(0.537878788*iWidth+q,0.091160221*iHeight);
  curveVertex(0.522727273*iWidth+q,0.099447514*iHeight);
  curveVertex(0.522727273*iWidth+q,0.099447514*iHeight);
  endShape(CLOSE);
  
  //bear lines
  line(0.46969697*iWidth+q,0.772099448*iHeight,0.472222222*iWidth+q,0.832872928*iHeight);
  line(0.606060606*iWidth+q,0.850828729*iHeight,0.626262626*iWidth+q,0.825966851*iHeight);
  line(0.626262626*iWidth+q,0.814917127*iHeight,0.636363636*iWidth+q,0.767955801*iHeight);
  line(0.638888889*iWidth+q,0.756906077*iHeight,0.641414141*iWidth+q,0.675414365*iHeight);
  line(0.641414141*iWidth+q,0.672651934*iHeight,0.674242424*iWidth+q,0.69198895*iHeight);
  line(0.676767677*iWidth+q,0.690607735*iHeight,0.689393939*iWidth+q,0.689226519*iHeight);
  line(0.689393939*iWidth+q,0.689226519*iHeight,0.714646465*iWidth+q,0.67679558*iHeight);
  line(0.722222222*iWidth+q,0.678176796*iHeight,0.717171717*iWidth+q,0.701657459*iHeight);
  line(0.722222222*iWidth+q,0.703038674*iHeight,0.755050505*iWidth+q,0.798342541*iHeight);
  line(0.755050505*iWidth+q,0.799723757*iHeight,0.767676768*iWidth+q,0.856353591*iHeight);
  line(0.921717172*iWidth+q,0.841160221*iHeight,0.929292929*iWidth+q,0.769337017*iHeight);
  line(0.633838384*iWidth+q,0.756906077*iHeight,0.742424242*iWidth+q,0.761049724*iHeight);
  
  beginShape();
  curveVertex(0.828282828*iWidth+q,0.074585635*iHeight);
  curveVertex(0.828282828*iWidth+q,0.074585635*iHeight);
  curveVertex(0.853535354*iWidth+q,0.069060773*iHeight);
  curveVertex(0.883838384*iWidth+q,0.074585635*iHeight);
  curveVertex(0.891414141*iWidth+q,0.081491713*iHeight);
  curveVertex(0.893939394*iWidth+q,0.085635359*iHeight);
  curveVertex(0.893939394*iWidth+q,0.096685083*iHeight);
  curveVertex(0.873737374*iWidth+q,0.085635359*iHeight);
  curveVertex(0.838383838*iWidth+q,0.077348066*iHeight);
  curveVertex(0.838383838*iWidth+q,0.077348066*iHeight);
  endShape(CLOSE);
  
  beginShape(); //bear eyes 1
  curveVertex(0.643939394*iWidth+q,0.089779006*iHeight);
  curveVertex(0.643939394*iWidth+q,0.089779006*iHeight);
  curveVertex(0.628787879*iWidth+q,0.092541436*iHeight);
  curveVertex(0.626262626*iWidth+q,0.096685083*iHeight);
  curveVertex(0.631313131*iWidth+q,0.100828729*iHeight);
  curveVertex(0.638888889*iWidth+q,0.093922652*iHeight);
  curveVertex(0.643939394*iWidth+q,0.089779006*iHeight);
  curveVertex(0.643939394*iWidth+q,0.089779006*iHeight);
  endShape(CLOSE);
  
  beginShape(); //bear eyes 2
  curveVertex(0.767676768*iWidth+q,0.091160221*iHeight);
  curveVertex(0.767676768*iWidth+q,0.091160221*iHeight);
  curveVertex(0.772727273*iWidth+q,0.093922652*iHeight);
  curveVertex(0.777777778*iWidth+q,0.092541436*iHeight);
  curveVertex(0.775252525*iWidth+q,0.08839779*iHeight);
  curveVertex(0.77020202*iWidth+q,0.087016575*iHeight);
  curveVertex(0.767676768*iWidth+q,0.091160221*iHeight);
  curveVertex(0.767676768*iWidth+q,0.091160221*iHeight);
  endShape(CLOSE);
  
  beginShape(); //bear claws 1
  curveVertex(0.462121212*iWidth+q,0.559392265*iHeight);
  curveVertex(0.462121212*iWidth+q,0.559392265*iHeight);
  curveVertex(0.477272727*iWidth+q,0.592541436*iHeight);
  curveVertex(0.487373737*iWidth+q,0.589779006*iHeight);
  curveVertex(0.494949495*iWidth+q,0.578729282*iHeight);
  curveVertex(0.487373737*iWidth+q,0.562154696*iHeight);
  curveVertex(0.492424242*iWidth+q,0.58839779*iHeight);
  curveVertex(0.505050505*iWidth+q,0.595303867*iHeight);
  curveVertex(0.517676768*iWidth+q,0.591160221*iHeight);
  curveVertex(0.52020202*iWidth+q,0.580110497*iHeight);
  curveVertex(0.52020202*iWidth+q,0.563535912*iHeight);
  curveVertex(0.52020202*iWidth+q,0.587016575*iHeight);
  curveVertex(0.527777778*iWidth+q,0.596685083*iHeight);
  curveVertex(0.537878788*iWidth+q,0.591160221*iHeight);
  curveVertex(0.542929293*iWidth+q,0.574585635*iHeight);
  curveVertex(0.542929293*iWidth+q,0.562154696*iHeight);
  curveVertex(0.545454545*iWidth+q,0.578729282*iHeight);
  curveVertex(0.555555556*iWidth+q,0.596685083*iHeight);
  curveVertex(0.563131313*iWidth+q,0.595303867*iHeight);
  curveVertex(0.568181818*iWidth+q,0.577348066*iHeight);
  curveVertex(0.570707071*iWidth+q,0.567679558*iHeight);
  curveVertex(0.575757576*iWidth+q,0.577348066*iHeight);
  curveVertex(0.578282828*iWidth+q,0.595303867*iHeight);
  curveVertex(0.585858586*iWidth+q,0.596685083*iHeight);
  curveVertex(0.593434343*iWidth+q,0.582872928*iHeight);
  curveVertex(0.595959596*iWidth+q,0.560773481*iHeight);
  curveVertex(0.595959596*iWidth+q,0.560773481*iHeight);
  endShape(CLOSE);
  
  beginShape(); //bear claws 2
  curveVertex(0.797979798*iWidth+q,0.562154696*iHeight);
  curveVertex(0.797979798*iWidth+q,0.562154696*iHeight);
  curveVertex(0.815656566*iWidth+q,0.598066298*iHeight);
  curveVertex(0.830808081*iWidth+q,0.587016575*iHeight);
  curveVertex(0.828282828*iWidth+q,0.566298343*iHeight);
  curveVertex(0.830808081*iWidth+q,0.582872928*iHeight);
  curveVertex(0.835858586*iWidth+q,0.596685083*iHeight);
  curveVertex(0.843434343*iWidth+q,0.598066298*iHeight);
  curveVertex(0.851010101*iWidth+q,0.592541436*iHeight);
  curveVertex(0.861111111*iWidth+q,0.577348066*iHeight);
  curveVertex(0.861111111*iWidth+q,0.562154696*iHeight);
  curveVertex(0.861111111*iWidth+q,0.581491713*iHeight);
  curveVertex(0.868686869*iWidth+q,0.593922652*iHeight);
  curveVertex(0.876262626*iWidth+q,0.595303867*iHeight);
  curveVertex(0.883838384*iWidth+q,0.589779006*iHeight);
  curveVertex(0.886363636*iWidth+q,0.574585635*iHeight);
  curveVertex(0.891414141*iWidth+q,0.564917127*iHeight);
  curveVertex(0.888888889*iWidth+q,0.587016575*iHeight);
  curveVertex(0.898989899*iWidth+q,0.595303867*iHeight);
  curveVertex(0.906565657*iWidth+q,0.591160221*iHeight);
  curveVertex(0.916666667*iWidth+q,0.578729282*iHeight);
  curveVertex(0.916666667*iWidth+q,0.563535912*iHeight);
  curveVertex(0.921717172*iWidth+q,0.577348066*iHeight);
  curveVertex(0.919191919*iWidth+q,0.589779006*iHeight);
  curveVertex(0.926767677*iWidth+q,0.587016575*iHeight);
  curveVertex(0.929292929*iWidth+q,0.571823204*iHeight);
  curveVertex(0.931818182*iWidth+q,0.559392265*iHeight);
  curveVertex(0.936868687*iWidth+q,0.555248619*iHeight);
  curveVertex(0.936868687*iWidth+q,0.555248619*iHeight);
  endShape(CLOSE);

  beginShape(); //bear claws 3
  curveVertex(0.467171717*iWidth+q,0.825966851*iHeight);
  curveVertex(0.467171717*iWidth+q,0.825966851*iHeight);
  curveVertex(0.47979798*iWidth+q,0.848066298*iHeight);
  curveVertex(0.497474747*iWidth+q,0.870165746*iHeight);
  curveVertex(0.502525253*iWidth+q,0.854972376*iHeight);
  curveVertex(0.502525253*iWidth+q,0.824585635*iHeight);
  curveVertex(0.507575758*iWidth+q,0.859116022*iHeight);
  curveVertex(0.52020202*iWidth+q,0.86878453*iHeight);
  curveVertex(0.527777778*iWidth+q,0.864640884*iHeight);
  curveVertex(0.53030303*iWidth+q,0.841160221*iHeight);
  curveVertex(0.53030303*iWidth+q,0.821823204*iHeight);
  curveVertex(0.532828283*iWidth+q,0.83839779*iHeight);
  curveVertex(0.532828283*iWidth+q,0.860497238*iHeight);
  curveVertex(0.545454545*iWidth+q,0.870165746*iHeight);
  curveVertex(0.558080808*iWidth+q,0.866022099*iHeight);
  curveVertex(0.558080808*iWidth+q,0.846685083*iHeight);
  curveVertex(0.558080808*iWidth+q,0.821823204*iHeight);
  curveVertex(0.558080808*iWidth+q,0.846685083*iHeight);
  curveVertex(0.563131313*iWidth+q,0.864640884*iHeight);
  curveVertex(0.565656566*iWidth+q,0.867403315*iHeight);
  curveVertex(0.578282828*iWidth+q,0.856353591*iHeight);
  curveVertex(0.580808081*iWidth+q,0.841160221*iHeight);
  curveVertex(0.588383838*iWidth+q,0.82320442*iHeight);
  curveVertex(0.585858586*iWidth+q,0.843922652*iHeight);
  curveVertex(0.588383838*iWidth+q,0.861878453*iHeight);
  curveVertex(0.595959596*iWidth+q,0.859116022*iHeight);
  curveVertex(0.606060606*iWidth+q,0.849447514*iHeight);
  curveVertex(0.611111111*iWidth+q,0.835635359*iHeight);
  curveVertex(0.611111111*iWidth+q,0.824585635*iHeight);
  curveVertex(0.611111111*iWidth+q,0.824585635*iHeight);
  endShape(CLOSE);
  
  beginShape();//bear claws 4
  curveVertex(0.762626263*iWidth+q,0.83839779*iHeight);
  curveVertex(0.762626263*iWidth+q,0.83839779*iHeight);
  curveVertex(0.777777778*iWidth+q,0.874309392*iHeight);
  curveVertex(0.785353535*iWidth+q,0.878453039*iHeight);
  curveVertex(0.800505051*iWidth+q,0.852209945*iHeight);
  curveVertex(0.792929293*iWidth+q,0.835635359*iHeight);
  curveVertex(0.797979798*iWidth+q,0.860497238*iHeight);
  curveVertex(0.795454545*iWidth+q,0.88121547*iHeight);
  curveVertex(0.813131313*iWidth+q,0.88121547*iHeight);
  curveVertex(0.823232323*iWidth+q,0.861878453*iHeight);
  curveVertex(0.825757576*iWidth+q,0.841160221*iHeight);
  curveVertex(0.828282828*iWidth+q,0.83839779*iHeight);
  curveVertex(0.828282828*iWidth+q,0.85359116*iHeight);
  curveVertex(0.825757576*iWidth+q,0.872928177*iHeight);
  curveVertex(0.823232323*iWidth+q,0.885359116*iHeight);
  curveVertex(0.840909091*iWidth+q,0.886740331*iHeight);
  curveVertex(0.851010101*iWidth+q,0.872928177*iHeight);
  curveVertex(0.848484848*iWidth+q,0.839779006*iHeight);
  curveVertex(0.856060606*iWidth+q,0.839779006*iHeight);
  curveVertex(0.851010101*iWidth+q,0.866022099*iHeight);
  curveVertex(0.851010101*iWidth+q,0.882596685*iHeight);
  curveVertex(0.861111111*iWidth+q,0.886740331*iHeight);
  curveVertex(0.871212121*iWidth+q,0.882596685*iHeight);
  curveVertex(0.878787879*iWidth+q,0.861878453*iHeight);
  curveVertex(0.881313131*iWidth+q,0.843922652*iHeight);
  curveVertex(0.886363636*iWidth+q,0.841160221*iHeight);
  curveVertex(0.891414141*iWidth+q,0.86878453*iHeight);
  curveVertex(0.893939394*iWidth+q,0.888121547*iHeight);
  curveVertex(0.904040404*iWidth+q,0.885359116*iHeight);
  curveVertex(0.919191919*iWidth+q,0.861878453*iHeight);
  curveVertex(0.919191919*iWidth+q,0.842541436*iHeight);
  curveVertex(0.919191919*iWidth+q,0.842541436*iHeight);
  endShape(CLOSE);

  stroke(137,148,144); // pants wrinkles
  line(0.138888889*iWidth+q,0.832872928*iHeight,0.174242424*iWidth+q,0.828729282*iHeight);
  line(0.174242424*iWidth+q,0.828729282*iHeight,0.207070707*iWidth+q,0.803867403*iHeight);
  line(0.217171717*iWidth+q,0.796961326*iHeight,0.207070707*iWidth+q,0.720994475*iHeight);
  line(0.116161616*iWidth+q,0.846685083*iHeight,0.101010101*iWidth+q,0.817679558*iHeight);
  line(0.156565657*iWidth+q,0.820441989*iHeight,0.111111111*iWidth+q,0.816298343*iHeight);
  line(0.101010101*iWidth+q,0.846685083*iHeight,0.118686869*iWidth+q,0.850828729*iHeight);
  line(0.161616162*iWidth+q,0.854972376*iHeight,0.123737374*iWidth+q,0.85359116*iHeight);
  line(0.108585859*iWidth+q,0.716850829*iHeight,0.20959596*iWidth+q,0.696132597*iHeight);
  line(0.123737374*iWidth+q,0.71961326*iHeight,0.189393939*iWidth+q,0.727900552*iHeight);
  line(0.116161616*iWidth+q,0.726519337*iHeight,0.106060606*iWidth+q,0.773480663*iHeight);
  line(0.166666667*iWidth+q,0.79281768*iHeight,0.191919192*iWidth+q,0.763812155*iHeight);
  line(0.164141414*iWidth+q,0.747237569*iHeight,0.159090909*iWidth+q,0.79281768*iHeight);
  line(0.184343434*iWidth+q,0.837016575*iHeight,0.212121212*iWidth+q,0.835635359*iHeight);
  line(0.174242424*iWidth+q,0.651933702*iHeight,0.217171717*iWidth+q,0.632596685*iHeight);
  line(0.217171717*iWidth+q,0.685082873*iHeight,0.224747475*iWidth+q,0.647790055*iHeight);
  line(0.242424242*iWidth+q,0.595303867*iHeight,0.232323232*iWidth+q,0.642265193*iHeight);
  line(0.169191919*iWidth+q,0.613259669*iHeight,0.234848485*iWidth+q,0.593922652*iHeight);
  line(0.159090909*iWidth+q,0.589779006*iHeight,0.212121212*iWidth+q,0.592541436*iHeight);
  line(0.164141414*iWidth+q,0.577348066*iHeight,0.202020202*iWidth+q,0.567679558*iHeight);
  line(0.126262626*iWidth+q,0.650552486*iHeight,0.169191919*iWidth+q,0.657458564*iHeight);
  line(0.108585859*iWidth+q,0.611878453*iHeight,0.141414141*iWidth+q,0.624309392*iHeight);
  line(0.151515152*iWidth+q,0.535911602*iHeight,0.169191919*iWidth+q,0.566298343*iHeight);
  line(0.143939394*iWidth+q,0.523480663*iHeight,0.207070707*iWidth+q,0.541436464*iHeight);
  line(0.098484848*iWidth+q,0.5*iHeight,0.133838384*iWidth+q,0.498618785*iHeight);
  line(0.159090909*iWidth+q,0.491712707*iHeight,0.126262626*iWidth+q,0.519337017*iHeight);
  line(0.282828283*iWidth+q,0.570441989*iHeight,0.305555556*iWidth+q,0.560773481*iHeight);
  line(0.272727273*iWidth+q,0.540055249*iHeight,0.315656566*iWidth+q,0.516574586*iHeight);
  line(0.335858586*iWidth+q,0.490331492*iHeight,0.338383838*iWidth+q,0.535911602*iHeight);
  line(0.398989899*iWidth+q,0.551104972*iHeight,0.434343434*iWidth+q,0.531767956*iHeight);
  line(0.391414141*iWidth+q,0.55801105*iHeight,0.414141414*iWidth+q,0.600828729*iHeight);
  line(0.358585859*iWidth+q,0.607734807*iHeight,0.409090909*iWidth+q,0.606353591*iHeight);
  line(0.366161616*iWidth+q,0.61878453*iHeight,0.421717172*iWidth+q,0.679558011*iHeight);
  line(0.323232323*iWidth+q,0.629834254*iHeight,0.368686869*iWidth+q,0.621546961*iHeight);
  line(0.338383838*iWidth+q,0.672651934*iHeight,0.371212121*iWidth+q,0.665745856*iHeight);
  line(0.361111111*iWidth+q,0.690607735*iHeight,0.431818182*iWidth+q,0.693370166*iHeight);
  line(0.323232323*iWidth+q,0.685082873*iHeight,0.388888889*iWidth+q,0.720994475*iHeight);
  line(0.335858586*iWidth+q,0.730662983*iHeight,0.378787879*iWidth+q,0.723756906*iHeight);
  line(0.328282828*iWidth+q,0.796961326*iHeight,0.419191919*iWidth+q,0.787292818*iHeight);
  line(0.361111111*iWidth+q,0.801104972*iHeight,0.330808081*iWidth+q,0.82320442*iHeight);
  line(0.348484848*iWidth+q,0.830110497*iHeight,0.398989899*iWidth+q,0.831491713*iHeight);
  line(0.313131313*iWidth+q,0.839779006*iHeight,0.340909091*iWidth+q,0.75*iHeight);
  line(0.237373737*iWidth+q,0.490331492*iHeight,0.234848485*iWidth+q,0.559392265*iHeight);
  
  stroke(19,66,174); //shirt wrinkes
  line(0.282828283*iWidth+q,0.386740331*iHeight,0.277777778*iWidth+q,0.360497238*iHeight);
  line(0.300505051*iWidth+q,0.36878453*iHeight,0.356060606*iWidth+q,0.372928177*iHeight);
  line(0.363636364*iWidth+q,0.375690608*iHeight,0.454545455*iWidth+q,0.367403315*iHeight);
  line(0.439393939*iWidth+q,0.357734807*iHeight,0.363636364*iWidth+q,0.359116022*iHeight);
  line(0.318181818*iWidth+q,0.354972376*iHeight,0.361111111*iWidth+q,0.359116022*iHeight);
  line(0.406565657*iWidth+q,0.339779006*iHeight,0.462121212*iWidth+q,0.348066298*iHeight);
  line(0.179292929*iWidth+q,0.306629834*iHeight,0.212121212*iWidth+q,0.316298343*iHeight);
  line(0.214646465*iWidth+q,0.317679558*iHeight,0.22979798*iWidth+q,0.356353591*iHeight);
  line(0.212121212*iWidth+q,0.364640884*iHeight,0.224747475*iWidth+q,0.359116022*iHeight);
  line(0.146464646*iWidth+q,0.325966851*iHeight,0.151515152*iWidth+q,0.305248619*iHeight);
  line(0.103535354*iWidth+q,0.327348066*iHeight,0.118686869*iWidth+q,0.305248619*iHeight);
  line(0.088383838*iWidth+q,0.313535912*iHeight,0.113636364*iWidth+q,0.305248619*iHeight);
  line(0.055555556*iWidth+q,0.312154696*iHeight,0.111111111*iWidth+q,0.301104972*iHeight);
  line(0.436868687*iWidth+q,0.269337017*iHeight,0.48989899*iWidth+q,0.245856354*iHeight);
  line(0.45959596*iWidth+q,0.273480663*iHeight,0.497474747*iWidth+q,0.262430939*iHeight);
  line(0.45959596*iWidth+q,0.29558011*iHeight,0.47979798*iWidth+q,0.29281768*iHeight);
  line(0.457070707*iWidth+q,0.305248619*iHeight,0.505050505*iWidth+q,0.287292818*iHeight);
  line(0.434343434*iWidth+q,0.30801105*iHeight,0.467171717*iWidth+q,0.314917127*iHeight);
  line(0.320707071*iWidth+q,0.425414365*iHeight,0.363636364*iWidth+q,0.393646409*iHeight);
  line(0.255050505*iWidth+q,0.419889503*iHeight,0.328282828*iWidth+q,0.392265193*iHeight);
  line(0.202020202*iWidth+q,0.407458564*iHeight,0.255050505*iWidth+q,0.401933702*iHeight);
  line(0.123737374*iWidth+q,0.412983425*iHeight,0.169191919*iWidth+q,0.408839779*iHeight);
  line(0.136363636*iWidth+q,0.370165746*iHeight,0.103535354*iWidth+q,0.397790055*iHeight);
  line(0.452020202*iWidth+q,0.241712707*iHeight,0.497474747*iWidth+q,0.200276243*iHeight);
  line(0.472222222*iWidth+q,0.238950276*iHeight,0.494949495*iWidth+q,0.229281768*iHeight);
  line(0.452020202*iWidth+q,0.182320442*iHeight,0.434343434*iWidth+q,0.227900552*iHeight);
  line(0.426767677*iWidth+q,0.175414365*iHeight,0.421717172*iWidth+q,0.215469613*iHeight);
  line(0.391414141*iWidth+q,0.241712707*iHeight,0.378787879*iWidth+q,0.256906077*iHeight);
  line(0.393939394*iWidth+q,0.256906077*iHeight,0.393939394*iWidth+q,0.248618785*iHeight);
  line(0.282828283*iWidth+q,0.28038674*iHeight,0.303030303*iWidth+q,0.252762431*iHeight);
  line(0.28030303*iWidth+q,0.287292818*iHeight,0.303030303*iWidth+q,0.285911602*iHeight);
  line(0.143939394*iWidth+q,0.198895028*iHeight,0.181818182*iWidth+q,0.279005525*iHeight);
  line(0.126262626*iWidth+q,0.197513812*iHeight,0.138888889*iWidth+q,0.251381215*iHeight);
  line(0.065656566*iWidth+q,0.194751381*iHeight,0.133838384*iWidth+q,0.233425414*iHeight);
  line(0.161616162*iWidth+q,0.194751381*iHeight,0.169191919*iWidth+q,0.171270718*iHeight);
  line(0.075757576*iWidth+q,0.215469613*iHeight,0.118686869*iWidth+q,0.233425414*iHeight);
  line(0.068181818*iWidth+q,0.238950276*iHeight,0.103535354*iWidth+q,0.256906077*iHeight);
  line(0.439393939*iWidth+q,0.332872928*iHeight,0.411616162*iWidth+q,0.320441989*iHeight);
  line(0.234848485*iWidth+q,0.236187845*iHeight,0.212121212*iWidth+q,0.214088398*iHeight);
  line(0.103535354*iWidth+q,0.428176796*iHeight,0.242424242*iWidth+q,0.437845304*iHeight);
  line(0.313131313*iWidth+q,0.435082873*iHeight,0.23989899*iWidth+q,0.439226519*iHeight);
  line(0.310606061*iWidth+q,0.435082873*iHeight,0.444444444*iWidth+q,0.432320442*iHeight);

  stroke(154,126,114); // face outline
  line(0.265151515*iWidth+q,0.227900552*iHeight,0.272727273*iWidth+q,0.20718232*iHeight);
  line(0.27020202*iWidth+q,0.205801105*iHeight,0.287878788*iWidth+q,0.200276243*iHeight);
  line(0.277777778*iWidth+q,0.262430939*iHeight,0.26010101*iWidth+q,0.230662983*iHeight);
  line(0.26010101*iWidth+q,0.222375691*iHeight,0.255050505*iWidth+q,0.214088398*iHeight);
  line(0.308080808*iWidth+q,0.133977901*iHeight,0.315656566*iWidth+q,0.117403315*iHeight);
  line(0.313131313*iWidth+q,0.117403315*iHeight,0.287878788*iWidth+q,0.099447514*iHeight);
  line(0.212121212*iWidth+q,0.116022099*iHeight,0.244949495*iWidth+q,0.100828729*iHeight);
  line(0.217171717*iWidth+q,0.116022099*iHeight,0.227272727*iWidth+q,0.133977901*iHeight);
  line(0.242424242*iWidth+q,0.128453039*iHeight,0.242424242*iWidth+q,0.121546961*iHeight);
  line(0.244949495*iWidth+q,0.102209945*iHeight,0.242424242*iWidth+q,0.109116022*iHeight);
  line(0.23989899*iWidth+q,0.109116022*iHeight,0.267676768*iWidth+q,0.107734807*iHeight);
  line(0.267676768*iWidth+q,0.109116022*iHeight,0.285353535*iWidth+q,0.110497238*iHeight);
  line(0.295454545*iWidth+q,0.106353591*iHeight,0.29040404*iWidth+q,0.110497238*iHeight);
  line(0.277777778*iWidth+q,0.143646409*iHeight,0.297979798*iWidth+q,0.132596685*iHeight);
  line(0.20959596*iWidth+q,0.142265193*iHeight,0.242424242*iWidth+q,0.154696133*iHeight);
  line(0.242424242*iWidth+q,0.151933702*iHeight,0.27020202*iWidth+q,0.157458564*iHeight);
  line(0.27020202*iWidth+q,0.157458564*iHeight,0.323232323*iWidth+q,0.153314917*iHeight);
  line(0.323232323*iWidth+q,0.153314917*iHeight,0.338383838*iWidth+q,0.138121547*iHeight);
  line(0.308080808*iWidth+q,0.157458564*iHeight,0.285353535*iWidth+q,0.186464088*iHeight);
  line(0.244949495*iWidth+q,0.16160221*iHeight,0.265151515*iWidth+q,0.179558011*iHeight);
  line(0.267676768*iWidth+q,0.07320442*iHeight,0.275252525*iWidth+q,0.060773481*iHeight);
  line(0.287878788*iWidth+q,0.214088398*iHeight,0.287878788*iWidth+q,0.222375691*iHeight);
  line(0.146464646*iWidth+q,0.299723757*iHeight,0.118686869*iWidth+q,0.288674033*iHeight);
  line(0.159090909*iWidth+q,0.302486188*iHeight,0.143939394*iWidth+q,0.288674033*iHeight);
  line(0.143939394*iWidth+q,0.287292818*iHeight,0.108585859*iWidth+q,0.274861878*iHeight);
  line(0.118686869*iWidth+q,0.270718232*iHeight,0.148989899*iWidth+q,0.279005525*iHeight);
  line(0.151515152*iWidth+q,0.279005525*iHeight,0.174242424*iWidth+q,0.298342541*iHeight);
  line(0.303030303*iWidth+q,0.328729282*iHeight,0.340909091*iWidth+q,0.328729282*iHeight);
  line(0.396464646*iWidth+q,0.302486188*iHeight,0.373737374*iWidth+q,0.303867403*iHeight);
  line(0.378787879*iWidth+q,0.316298343*iHeight,0.404040404*iWidth+q,0.312154696*iHeight);
  line(0.358585859*iWidth+q,0.111878453*iHeight,0.351010101*iWidth+q,0.102209945*iHeight);
  line(0.366161616*iWidth+q,0.096685083*iHeight,0.363636364*iWidth+q,0.102209945*iHeight);
  line(0.181818182*iWidth+q,0.100828729*iHeight,0.181818182*iWidth+q,0.089779006*iHeight);

  stroke(86,47,32); //bear dark lines
  line(0.358585859*iWidth+q,0.111878453*iHeight,0.351010101*iWidth+q,0.102209945*iHeight);
  line(0.366161616*iWidth+q,0.096685083*iHeight,0.363636364*iWidth+q,0.102209945*iHeight);
  line(0.181818182*iWidth+q,0.100828729*iHeight,0.181818182*iWidth+q,0.089779006*iHeight);
  line(0.358585859*iWidth+q,0.111878453*iHeight,0.351010101*iWidth+q,0.102209945*iHeight);
  line(0.366161616*iWidth+q,0.096685083*iHeight,0.363636364*iWidth+q,0.102209945*iHeight);
  line(0.181818182*iWidth+q,0.100828729*iHeight,0.181818182*iWidth+q,0.089779006*iHeight);
  line(0.512626263*iWidth+q,0.317679558*iHeight,0.691919192*iWidth+q,0.447513812*iHeight);
  line(0.704545455*iWidth+q,0.44198895*iHeight,0.744949495*iWidth+q,0.410220994*iHeight);
  line(0.747474747*iWidth+q,0.410220994*iHeight,0.871212121*iWidth+q,0.317679558*iHeight);
  line(0.873737374*iWidth+q,0.316298343*iHeight,0.904040404*iWidth+q,0.277624309*iHeight);
  line(0.704545455*iWidth+q,0.371546961*iHeight,0.762626263*iWidth+q,0.30801105*iHeight);
  line(0.78030303*iWidth+q,0.288674033*iHeight,0.820707071*iWidth+q,0.261049724*iHeight);
  line(0.845959596*iWidth+q,0.243093923*iHeight,0.893939394*iWidth+q,0.197513812*iHeight);
  line(0.843434343*iWidth+q,0.243093923*iHeight,0.732323232*iWidth+q,0.26519337*iHeight);
  line(0.686868687*iWidth+q,0.266574586*iHeight,0.575757576*iWidth+q,0.256906077*iHeight);
  line(0.563131313*iWidth+q,0.251381215*iHeight,0.522727273*iWidth+q,0.230662983*iHeight);
  line(0.699494949*iWidth+q,0.374309392*iHeight,0.621212121*iWidth+q,0.321823204*iHeight);
  line(0.601010101*iWidth+q,0.309392265*iHeight,0.535353535*iWidth+q,0.256906077*iHeight);
  line(0.482323232*iWidth+q,0.375690608*iHeight,0.621212121*iWidth+q,0.522099448*iHeight);
  line(0.772727273*iWidth+q,0.505524862*iHeight,0.853535354*iWidth+q,0.407458564*iHeight);
  line(0.856060606*iWidth+q,0.401933702*iHeight,0.904040404*iWidth+q,0.342541436*iHeight);
  line(0.742424242*iWidth+q,0.658839779*iHeight,0.775252525*iWidth+q,0.512430939*iHeight);
  line(0.603535354*iWidth+q,0.591160221*iHeight,0.633838384*iWidth+q,0.657458564*iHeight);
  line(0.616161616*iWidth+q,0.125690608*iHeight,0.638888889*iWidth+q,0.093922652*iHeight);
  line(0.638888889*iWidth+q,0.093922652*iHeight,0.661616162*iWidth+q,0.077348066*iHeight);
  line(0.744949495*iWidth+q,0.078729282*iHeight,0.77020202*iWidth+q,0.092541436*iHeight);
  line(0.772727273*iWidth+q,0.095303867*iHeight,0.792929293*iWidth+q,0.121546961*iHeight);
  line(0.621212121*iWidth+q,0.153314917*iHeight,0.638888889*iWidth+q,0.122928177*iHeight);
  line(0.636363636*iWidth+q,0.151933702*iHeight,0.654040404*iWidth+q,0.124309392*iHeight);
  line(0.757575758*iWidth+q,0.150552486*iHeight,0.76010101*iWidth+q,0.128453039*iHeight);
  line(0.651515152*iWidth+q,0.116022099*iHeight,0.679292929*iWidth+q,0.113259669*iHeight);
  line(0.696969697*iWidth+q,0.110497238*iHeight,0.742424242*iWidth+q,0.113259669*iHeight);
  line(0.755050505*iWidth+q,0.114640884*iHeight,0.78030303*iWidth+q,0.11878453*iHeight);
  line(0.79040404*iWidth+q,0.124309392*iHeight,0.777777778*iWidth+q,0.143646409*iHeight);
  line(0.618686869*iWidth+q,0.157458564*iHeight,0.626262626*iWidth+q,0.200276243*iHeight);
  line(0.636363636*iWidth+q,0.211325967*iHeight,0.686868687*iWidth+q,0.216850829*iHeight);
  line(0.694444444*iWidth+q,0.214088398*iHeight,0.744949495*iWidth+q,0.209944751*iHeight);
  line(0.762626263*iWidth+q,0.201657459*iHeight,0.765151515*iWidth+q,0.178176796*iHeight);
  line(0.76010101*iWidth+q,0.169889503*iHeight,0.767676768*iWidth+q,0.147790055*iHeight);
  line(0.656565657*iWidth+q,0.190607735*iHeight,0.656565657*iWidth+q,0.203038674*iHeight);
  line(0.659090909*iWidth+q,0.10359116*iHeight,0.664141414*iWidth+q,0.087016575*iHeight);
  line(0.636363636*iWidth+q,0.180939227*iHeight,0.681818182*iWidth+q,0.183701657*iHeight);
  line(0.712121212*iWidth+q,0.186464088*iHeight,0.744949495*iWidth+q,0.183701657*iHeight);
  line(0.762626263*iWidth+q,0.102209945*iHeight,0.755050505*iWidth+q,0.096685083*iHeight);
  line(0.537878788*iWidth+q,0.165745856*iHeight,0.560606061*iWidth+q,0.209944751*iHeight);
  line(0.590909091*iWidth+q,0.223756906*iHeight,0.616161616*iWidth+q,0.218232044*iHeight);
  line(0.775252525*iWidth+q,0.220994475*iHeight,0.823232323*iWidth+q,0.218232044*iHeight);
  line(0.848484848*iWidth+q,0.193370166*iHeight,0.876262626*iWidth+q,0.125690608*iHeight);
  line(0.535353535*iWidth+q,0.124309392*iHeight,0.555555556*iWidth+q,0.100828729*iHeight);
  line(0.835858586*iWidth+q,0.087016575*iHeight,0.858585859*iWidth+q,0.104972376*iHeight);
  line(0.689393939*iWidth+q,0.552486188*iHeight,0.696969697*iWidth+q,0.651933702*iHeight);
  line(0.494949495*iWidth+q,0.821823204*iHeight,0.494949495*iWidth+q,0.791436464*iHeight);
  line(0.535353535*iWidth+q,0.817679558*iHeight,0.532828283*iWidth+q,0.791436464*iHeight);
  line(0.560606061*iWidth+q,0.816298343*iHeight,0.555555556*iWidth+q,0.791436464*iHeight);
  line(0.585858586*iWidth+q,0.824585635*iHeight,0.588383838*iWidth+q,0.791436464*iHeight);
  line(0.797979798*iWidth+q,0.831491713*iHeight,0.79040404*iWidth+q,0.79558011*iHeight);
  line(0.823232323*iWidth+q,0.834254144*iHeight,0.815656566*iWidth+q,0.798342541*iHeight);
  line(0.858585859*iWidth+q,0.832872928*iHeight,0.843434343*iWidth+q,0.798342541*iHeight);
  line(0.896464646*iWidth+q,0.83839779*iHeight,0.878787879*iWidth+q,0.799723757*iHeight);
  line(0.838383838*iWidth+q,0.555248619*iHeight,0.835858586*iWidth+q,0.531767956*iHeight);
  line(0.866161616*iWidth+q,0.560773481*iHeight,0.866161616*iWidth+q,0.534530387*iHeight);
  line(0.896464646*iWidth+q,0.560773481*iHeight,0.896464646*iWidth+q,0.537292818*iHeight);
  line(0.921717172*iWidth+q,0.535911602*iHeight,0.919191919*iWidth+q,0.559392265*iHeight);
  line(0.570707071*iWidth+q,0.560773481*iHeight,0.558080808*iWidth+q,0.529005525*iHeight);
  line(0.542929293*iWidth+q,0.559392265*iHeight,0.535353535*iWidth+q,0.533149171*iHeight);
  line(0.502525253*iWidth+q,0.535911602*iHeight,0.507575758*iWidth+q,0.560773481*iHeight);
  line(0.472222222*iWidth+q,0.529005525*iHeight,0.482323232*iWidth+q,0.555248619*iHeight);
  line(0.446969697*iWidth+q,0.821823204*iHeight,0.505050505*iWidth+q,0.907458564*iHeight);
  line(0.515151515*iWidth+q,0.907458564*iHeight,0.568181818*iWidth+q,0.922651934*iHeight);
  line(0.585858586*iWidth+q,0.922651934*iHeight,0.654040404*iWidth+q,0.922651934*iHeight);
  line(0.681818182*iWidth+q,0.914364641*iHeight,0.73989899*iWidth+q,0.933701657*iHeight);
  line(0.775252525*iWidth+q,0.92679558*iHeight,0.835858586*iWidth+q,0.922651934*iHeight);
  line(0.861111111*iWidth+q,0.918508287*iHeight,0.898989899*iWidth+q,0.899171271*iHeight);
  line(0.924242424*iWidth+q,0.879834254*iHeight,0.96969697*iWidth+q,0.841160221*iHeight);
  
  stroke(174,109,71); // bear light lines
  line(0.613636364*iWidth+q,0.197513812*iHeight,0.606060606*iWidth+q,0.111878453*iHeight);
  line(0.595959596*iWidth+q,0.113259669*iHeight,0.585858586*iWidth+q,0.197513812*iHeight);
  line(0.555555556*iWidth+q,0.182320442*iHeight,0.578282828*iWidth+q,0.120165746*iHeight);
  line(0.54040404*iWidth+q,0.120165746*iHeight,0.54040404*iWidth+q,0.165745856*iHeight);
  line(0.52020202*iWidth+q,0.128453039*iHeight,0.505050505*iWidth+q,0.183701657*iHeight);
  line(0.810606061*iWidth+q,0.117403315*iHeight,0.805555556*iWidth+q,0.169889503*iHeight);
  line(0.828282828*iWidth+q,0.122928177*iHeight,0.830808081*iWidth+q,0.172651934*iHeight);
  line(0.856060606*iWidth+q,0.111878453*iHeight,0.853535354*iWidth+q,0.189226519*iHeight);
  line(0.863636364*iWidth+q,0.113259669*iHeight,0.871212121*iWidth+q,0.186464088*iHeight);
  line(0.560606061*iWidth+q,0.100828729*iHeight,0.593434343*iWidth+q,0.093922652*iHeight);
  line(0.805555556*iWidth+q,0.092541436*iHeight,0.863636364*iWidth+q,0.099447514*iHeight);
  line(0.578282828*iWidth+q,0.227900552*iHeight,0.608585859*iWidth+q,0.255524862*iHeight);
  line(0.606060606*iWidth+q,0.229281768*iHeight,0.648989899*iWidth+q,0.26519337*iHeight);
  line(0.641414141*iWidth+q,0.225138122*iHeight,0.671717172*iWidth+q,0.256906077*iHeight);
  line(0.674242424*iWidth+q,0.226519337*iHeight,0.689393939*iWidth+q,0.256906077*iHeight);
  line(0.717171717*iWidth+q,0.222375691*iHeight,0.714646465*iWidth+q,0.256906077*iHeight);
  line(0.752525253*iWidth+q,0.230662983*iHeight,0.732323232*iWidth+q,0.261049724*iHeight);
  line(0.805555556*iWidth+q,0.230662983*iHeight,0.755050505*iWidth+q,0.25*iHeight);
  line(0.818181818*iWidth+q,0.227900552*iHeight,0.800505051*iWidth+q,0.263812155*iHeight);
  line(0.838383838*iWidth+q,0.232044199*iHeight,0.797979798*iWidth+q,0.259668508*iHeight);
  line(0.818181818*iWidth+q,0.186464088*iHeight,0.815656566*iWidth+q,0.211325967*iHeight);
  line(0.535353535*iWidth+q,0.20718232*iHeight,0.588383838*iWidth+q,0.218232044*iHeight);
  line(0.621212121*iWidth+q,0.270718232*iHeight,0.669191919*iWidth+q,0.298342541*iHeight);
  line(0.664141414*iWidth+q,0.269337017*iHeight,0.702020202*iWidth+q,0.296961326*iHeight);
  line(0.742424242*iWidth+q,0.269337017*iHeight,0.722222222*iWidth+q,0.291436464*iHeight);
  line(0.785353535*iWidth+q,0.273480663*iHeight,0.737373737*iWidth+q,0.299723757*iHeight);
  line(0.732323232*iWidth+q,0.303867403*iHeight,0.704545455*iWidth+q,0.330110497*iHeight);
  line(0.626262626*iWidth+q,0.291436464*iHeight,0.651515152*iWidth+q,0.319060773*iHeight);
  line(0.654040404*iWidth+q,0.328729282*iHeight,0.689393939*iWidth+q,0.345303867*iHeight);
  line(0.689393939*iWidth+q,0.357734807*iHeight,0.71969697*iWidth+q,0.335635359*iHeight);
  line(0.853535354*iWidth+q,0.25*iHeight,0.848484848*iWidth+q,0.316298343*iHeight);
  line(0.823232323*iWidth+q,0.270718232*iHeight,0.813131313*iWidth+q,0.32320442*iHeight);
  line(0.787878788*iWidth+q,0.301104972*iHeight,0.765151515*iWidth+q,0.346685083*iHeight);
  line(0.744949495*iWidth+q,0.350828729*iHeight,0.742424242*iWidth+q,0.383977901*iHeight);
  line(0.707070707*iWidth+q,0.371546961*iHeight,0.676767677*iWidth+q,0.404696133*iHeight);
  line(0.550505051*iWidth+q,0.272099448*iHeight,0.558080808*iWidth+q,0.324585635*iHeight);
  line(0.583333333*iWidth+q,0.302486188*iHeight,0.593434343*iWidth+q,0.343922652*iHeight);
  line(0.611111111*iWidth+q,0.321823204*iHeight,0.633838384*iWidth+q,0.364640884*iHeight);
  line(0.659090909*iWidth+q,0.345303867*iHeight,0.666666667*iWidth+q,0.385359116*iHeight);
  line(0.732323232*iWidth+q,0.435082873*iHeight,0.71969697*iWidth+q,0.477900552*iHeight);
  line(0.772727273*iWidth+q,0.407458564*iHeight,0.772727273*iWidth+q,0.443370166*iHeight);
  line(0.803030303*iWidth+q,0.389502762*iHeight,0.803030303*iWidth+q,0.422651934*iHeight);
  line(0.825757576*iWidth+q,0.374309392*iHeight,0.825757576*iWidth+q,0.407458564*iHeight);
  line(0.838383838*iWidth+q,0.35359116*iHeight,0.843434343*iWidth+q,0.392265193*iHeight);
  line(0.866161616*iWidth+q,0.342541436*iHeight,0.868686869*iWidth+q,0.372928177*iHeight);
  line(0.878787879*iWidth+q,0.321823204*iHeight,0.888888889*iWidth+q,0.348066298*iHeight);
  line(0.893939394*iWidth+q,0.316298343*iHeight,0.893939394*iWidth+q,0.342541436*iHeight);
  line(0.532828283*iWidth+q,0.350828729*iHeight,0.53030303*iWidth+q,0.389502762*iHeight);
  line(0.555555556*iWidth+q,0.367403315*iHeight,0.54040404*iWidth+q,0.408839779*iHeight);
  line(0.595959596*iWidth+q,0.388121547*iHeight,0.570707071*iWidth+q,0.435082873*iHeight);
  line(0.618686869*iWidth+q,0.410220994*iHeight,0.598484848*iWidth+q,0.450276243*iHeight);
  line(0.651515152*iWidth+q,0.432320442*iHeight,0.628787879*iWidth+q,0.473756906*iHeight);
  line(0.664141414*iWidth+q,0.44198895*iHeight,0.654040404*iWidth+q,0.483425414*iHeight);
  line(0.684343434*iWidth+q,0.455801105*iHeight,0.691919192*iWidth+q,0.5*iHeight);
  line(0.765151515*iWidth+q,0.483425414*iHeight,0.752525253*iWidth+q,0.523480663*iHeight);
  line(0.73989899*iWidth+q,0.494475138*iHeight,0.732323232*iWidth+q,0.537292818*iHeight);
  line(0.71969697*iWidth+q,0.504143646*iHeight,0.707070707*iWidth+q,0.560773481*iHeight);
  line(0.762626263*iWidth+q,0.551104972*iHeight,0.724747475*iWidth+q,0.596685083*iHeight);
  line(0.742424242*iWidth+q,0.548342541*iHeight,0.702020202*iWidth+q,0.598066298*iHeight);
  line(0.747474747*iWidth+q,0.609116022*iHeight,0.724747475*iWidth+q,0.645027624*iHeight);
  line(0.734848485*iWidth+q,0.607734807*iHeight,0.699494949*iWidth+q,0.628453039*iHeight);
  line(0.568181818*iWidth+q,0.455801105*iHeight,0.583333333*iWidth+q,0.488950276*iHeight);
  line(0.606060606*iWidth+q,0.48480663*iHeight,0.601010101*iWidth+q,0.53038674*iHeight);
  line(0.626262626*iWidth+q,0.502762431*iHeight,0.628787879*iWidth+q,0.54558011*iHeight);
  line(0.679292929*iWidth+q,0.519337017*iHeight,0.656565657*iWidth+q,0.555248619*iHeight);
  line(0.656565657*iWidth+q,0.517955801*iHeight,0.631313131*iWidth+q,0.574585635*iHeight);
  line(0.681818182*iWidth+q,0.564917127*iHeight,0.646464646*iWidth+q,0.602209945*iHeight);
  line(0.621212121*iWidth+q,0.578729282*iHeight,0.633838384*iWidth+q,0.617403315*iHeight);
  line(0.643939394*iWidth+q,0.571823204*iHeight,0.664141414*iWidth+q,0.625690608*iHeight);
  line(0.643939394*iWidth+q,0.638121547*iHeight,0.664141414*iWidth+q,0.624309392*iHeight);
  line(0.659090909*iWidth+q,0.656077348*iHeight,0.638888889*iWidth+q,0.629834254*iHeight);
  line(0.679292929*iWidth+q,0.654696133*iHeight,0.661616162*iWidth+q,0.624309392*iHeight);
  line(0.893939394*iWidth+q,0.38121547*iHeight,0.924242424*iWidth+q,0.42679558*iHeight);
  line(0.871212121*iWidth+q,0.39640884*iHeight,0.901515152*iWidth+q,0.450276243*iHeight);
  line(0.835858586*iWidth+q,0.414364641*iHeight,0.861111111*iWidth+q,0.470994475*iHeight);
  line(0.813131313*iWidth+q,0.453038674*iHeight,0.828282828*iWidth+q,0.5*iHeight);
  line(0.79040404*iWidth+q,0.483425414*iHeight,0.815656566*iWidth+q,0.517955801*iHeight);
  line(0.782828283*iWidth+q,0.524861878*iHeight,0.815656566*iWidth+q,0.540055249*iHeight);
  line(0.911616162*iWidth+q,0.46961326*iHeight,0.863636364*iWidth+q,0.504143646*iHeight);
  line(0.484848485*iWidth+q,0.41160221*iHeight,0.477272727*iWidth+q,0.458563536*iHeight);
  line(0.497474747*iWidth+q,0.432320442*iHeight,0.477272727*iWidth+q,0.475138122*iHeight);
  line(0.52020202*iWidth+q,0.453038674*iHeight,0.484848485*iWidth+q,0.502762431*iHeight);
  line(0.537878788*iWidth+q,0.473756906*iHeight,0.48989899*iWidth+q,0.519337017*iHeight);
  line(0.565656566*iWidth+q,0.491712707*iHeight,0.535353535*iWidth+q,0.523480663*iHeight);
  line(0.46969697*iWidth+q,0.488950276*iHeight,0.457070707*iWidth+q,0.520718232*iHeight);
  line(0.914141414*iWidth+q,0.595303867*iHeight,0.929292929*iWidth+q,0.66160221*iHeight);
  line(0.931818182*iWidth+q,0.599447514*iHeight,0.919191919*iWidth+q,0.667127072*iHeight);
  line(0.785353535*iWidth+q,0.599447514*iHeight,0.782828283*iWidth+q,0.651933702*iHeight);
  line(0.815656566*iWidth+q,0.595303867*iHeight,0.818181818*iWidth+q,0.683701657*iHeight);
  line(0.873737374*iWidth+q,0.609116022*iHeight,0.863636364*iWidth+q,0.678176796*iHeight);
  line(0.843434343*iWidth+q,0.617403315*iHeight,0.820707071*iWidth+q,0.696132597*iHeight);
  line(0.871212121*iWidth+q,0.689226519*iHeight,0.883838384*iWidth+q,0.737569061*iHeight);
  line(0.830808081*iWidth+q,0.70441989*iHeight,0.858585859*iWidth+q,0.745856354*iHeight);
  line(0.921717172*iWidth+q,0.686464088*iHeight,0.898989899*iWidth+q,0.745856354*iHeight);
  line(0.878787879*iWidth+q,0.767955801*iHeight,0.797979798*iWidth+q,0.783149171*iHeight);
  line(0.777777778*iWidth+q,0.741712707*iHeight,0.803030303*iWidth+q,0.78038674*iHeight);
  line(0.825757576*iWidth+q,0.752762431*iHeight,0.853535354*iWidth+q,0.785911602*iHeight);
  line(0.891414141*iWidth+q,0.767955801*iHeight,0.921717172*iWidth+q,0.801104972*iHeight);
  line(0.502525253*iWidth+q,0.606353591*iHeight,0.48989899*iWidth+q,0.683701657*iHeight);
  line(0.535353535*iWidth+q,0.621546961*iHeight,0.525252525*iWidth+q,0.696132597*iHeight);
  line(0.565656566*iWidth+q,0.622928177*iHeight,0.560606061*iWidth+q,0.701657459*iHeight);
  line(0.588383838*iWidth+q,0.624309392*iHeight,0.588383838*iWidth+q,0.718232044*iHeight);
  line(0.497474747*iWidth+q,0.714088398*iHeight,0.542929293*iWidth+q,0.75*iHeight);
  line(0.53030303*iWidth+q,0.697513812*iHeight,0.568181818*iWidth+q,0.748618785*iHeight);
  line(0.593434343*iWidth+q,0.718232044*iHeight,0.608585859*iWidth+q,0.761049724*iHeight);
  line(0.512626263*iWidth+q,0.754143646*iHeight,0.547979798*iWidth+q,0.78038674*iHeight);
  line(0.568181818*iWidth+q,0.759668508*iHeight,0.593434343*iWidth+q,0.784530387*iHeight);
  line(0.603535354*iWidth+q,0.763812155*iHeight,0.606060606*iWidth+q,0.783149171*iHeight);
  line(0.494949495*iWidth+q,0.769337017*iHeight,0.527777778*iWidth+q,0.796961326*iHeight);
  line(0.492424242*iWidth+q,0.708563536*iHeight,0.492424242*iWidth+q,0.743093923*iHeight);
  line(0.482323232*iWidth+q,0.604972376*iHeight,0.467171717*iWidth+q,0.66160221*iHeight);
  line(0.871212121*iWidth+q,0.519337017*iHeight,0.916666667*iWidth+q,0.524861878*iHeight);
  line(0.906565657*iWidth+q,0.498618785*iHeight,0.924242424*iWidth+q,0.531767956*iHeight);
  line(0.805555556*iWidth+q,0.102209945*iHeight,0.845959596*iWidth+q,0.114640884*iHeight);
  line(0.565656566*iWidth+q,0.106353591*iHeight,0.603535354*iWidth+q,0.107734807*iHeight);
  
  
  // Mooyoung's portrait; Moves around when mouse is clicked.
  if (mouseLeft == 1){
    makeCollage(imgPath, xStart, yStart);          // Background; picture collage w/ different filters
    portraitMooyoung(sizeRatio, xOffset, yOffset); // portrait
    
    // Moving portrait;  
      // k represent different quadrant from 2x2 collage sections
      // portrait move from one quadrant to another with 10 moving steps
      // portrait size changes according to the stepSize vector
    if (k == 0){
      xOffset += 36.9;
      yOffset += 5.2;
      constrain(xOffset, 784, 1153);
      constrain(yOffset, 112, 164);
      if ((xOffset < 800) && (stepSize[i]==0)){
        xOffset = 784; yOffset = 112;
      }
    }
    if (k == 1){
      xOffset += -41.9;
      yOffset += 30.4;
      constrain(xOffset, 734, 1153);
      constrain(yOffset, 164, 468);
    }
    if (k == 2){
      xOffset += 36.6;
      yOffset += 5.4;
      constrain(xOffset, 734, 1100);
      constrain(yOffset, 468, 523);
    }
    if (k == 3){
      xOffset += -31.6;
      yOffset += -41.0;
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

void makeCollage(String imgPath, int xStart, int yStart){
  // Function: take an image path and tile into 2x2 collage frame with four different filters
  //           the tile start from (xStart, yStart) pixel
  
  
  // Load image to work on
  PImage imgML = loadImage(imgPath);
  
  
  // Negative filter (Greenberg p.315)
  image(imgML, 0 + xStart, imgML.height + yStart);
  for (int x = 0 + xStart; x < imgML.width + xStart; x++){
    for (int y = imgML.height + yStart; y < imgML.height*2 +yStart; y++){
      color c = get(x,y);
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
    color c = imgML.pixels[i];
    imgML.pixels[i] = color(red(c)*0.3+green(c)*0.59+blue(c)*0.11);
  }
  imgML.updatePixels();
  image(imgML, imgML.width + xStart, imgML.height + yStart);
    
  // Obamicon (Greenberg p.387)
  color darkBlue = color(0, 51, 76);
  color red = color(217, 26, 33);
  color lightBlue = color(112, 150, 158);
  color yellow = color(252, 227, 166);

  imgML.loadPixels();
  for (int i = 0; i < imgML.pixels.length; i++) {
    color c = imgML.pixels[i];
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
void portraitMooyoung(float sizeRatio, float xOffset, float yOffset){
  // Function: draw a predefined portrait with given sizeRatio
  //           the drawing templet starts at (xOffset, yOffset) pixel
    
  float[] mouthCoords = {
  -0.205365178,  0.258484609,
  -0.102682589,  0.24269929,
  -0.044923633,  0.24269929,
  0,  0.24269929,
  0.077011942,  0.23875296,
  0.166859207,  0.24664562,
  0.121935575,  0.286108919,
  0.07059428,  0.305840568,
  -0.019252985,  0.317679558,
  -0.102682589,  0.310679558,
  -0.166859207,  0.287947908,
  -0.21178284,  0.258484609
  };
  
  float[] noseCoords = {
  -0.275959458,  0.179558011,
  -0.231035825,  0.159826361,
  -0.147606222,  0.120363062,
  -0.134770898,  0.120363062,
  -0.160441545,  0.128255722,
  -0.147606222,  0.163772691,
  -0.044923633,  0.199289661,
  -0.019252985,  0.203235991,
  0.044923633,  0.187450671,
  0.096264927,  0.175611681,
  0.128353236,  0.144041042,
  0.096264927,  0.120363062,
  0.205365178,  0.159826361,
  0.243871149,  0.183504341,
  0.256706473,  0.203235991
  };
  
  float[] shirtCoords = {
  -0.667436829,  0.751775848,
  -0.616095534,  0.708366219,
  -0.474906974,  0.657063931,
  -0.295212444,  0.621546961,
  -0.179694531,  0.589976322,
  -0.173276869,  0.570244672,
  -0.198947516,  0.530781373,
  -0.205365178,  0.503693765,
  -0.166859207,  0.550513023,
  -0.083429604,  0.629439621,
  -0.006417662,  0.6925809,
  0.121935575,  0.589976322,
  0.301630105,  0.463693765,
  0.404312694,  0.412391476,
  0.468489313,  0.341357537,
  0.474906974,  0.325572218,
  0.661019167,  0.443962115,
  0.686689814,  0.479479084,
  0.834296036,  0.503157064,
  1.007572905,  0.574191002,
  1.180849774,  0.649171271
  };
  
  float[] shirtCoords2 = {
  0.179694531,  0.818863457,
  0.506995283,  0.412391476,
  0.49415996,  0.337411208,
  0.667436829,  0.455801105,
  0.686689814,  0.491318074,
  0.63534852,  0.6925809,
  0.481324636,  0.747829519,
  0.571171902,  0.810970797
  };
  
  float[] tieCoords = {
  -0.314465429,  0.657063931,
  -0.179694531,  0.67679558,
  -0.044923633,  0.712312549,
  0.096264927,  0.67284925,
  0.160441545,  0.728097869,
  0.154023884,  0.810970797,
  0.064176618,  0.810970797,
  -0.038505971,  0.771507498,
  -0.077011942,  0.795185478,
  -0.3529714,  0.826756117,
  -0.378642047,  0.779400158,
  -0.314465429,  0.657063931
  };

  float[] hairCoords = {
  -0.5262,-0.0848,
  -0.5198,-0.2032,
  -0.4749,-0.3453,
  -0.4428,-0.4045,
  -0.3851,-0.4084,
  -0.3851,-0.4084,
  -0.3401,-0.4558,
  -0.3016,-0.4795,
  -0.3016,-0.515,
  -0.2118,-0.511,
  -0.1797,-0.5387,
  -0.1412,-0.5229,
  -0.1284,-0.5545,
  -0.0578,-0.5505,
  0.0128,-0.5702,
  0.1027,-0.5387,
  0.1348,-0.5426,
  0.2182,-0.5308,
  0.2567,-0.4834,
  0.3145,-0.4953,
  0.3658,-0.4716,
  0.3979,-0.4242,
  0.3915,-0.365,
  0.4942,-0.3729,
  0.4685,-0.3532,
  0.5391,-0.294,
  0.5712,-0.2348,
  0.5776,-0.1914,
  0.5776,-0.1243,
  0.5712,-0.073,
  0.4749,-0.0375,
  0.4364,-0.144,
  0.43,-0.2072,
  0.3722,-0.2861,
  0.2695,-0.3295,
  0.154,-0.3611,
  0.0513,-0.3611,
  -0.0128,-0.3493,
  -0.1284,-0.369,
  -0.2567,-0.3414,
  -0.3851,-0.2901,
  -0.4236,-0.2585,
  -0.4492,-0.1875,
  -0.4557,-0.1361,
  -0.4749,-0.073,
  -0.5006,-0.0691
  };

  pushMatrix();
  // transformation; Need to rotate the figures in order to match the original picture orientation
  rotate(-0.14);
  translate(xOffset - 50, yOffset - 8);  // (-50, -8) is an additional offset to match the original image
  //translate(xOffset, yOffset);  // (-50, -8) is an additional offset to match the original image
    
  // Size of portrait
  float newWidth = 371*sizeRatio;
  float newHeight = 362*sizeRatio;
  
  // head
  strokeWeight(3);
  float headWidth = newWidth * .42;
  float headHeight = newHeight * .7;
  noFill();
  stroke(50);
  ellipse(newWidth/2, newHeight/2, headWidth, headHeight); 
  
  // Eyes with pupil
  float eyeWidth = headWidth / 6;
  float eyeHeight = eyeWidth / 6;
  stroke(0);
  strokeWeight(1);
  ellipse(newWidth/2 - headWidth/4.5, newHeight/2, eyeWidth, eyeHeight); // eye LH
  ellipse(newWidth/2 + headWidth/5, newHeight/2, eyeWidth, eyeHeight);   // eye RH
  fill(51, 0, 0); noStroke();
  ellipse(newWidth/2 - headWidth/4.5, newHeight/2, eyeHeight, eyeHeight);  //pupill LH
  ellipse(newWidth/2 + headWidth/5, newHeight/2, eyeHeight, eyeHeight);    //pupill RH
    
  // Ears
  //fill(255, 255, 0,  0);
  noFill();
  stroke(96, 96, 96);
  strokeWeight(3);
  float x1 = newWidth/3.4;
  float y1 = newHeight/2 - eyeHeight;
  float x2 = newWidth/4.3;
  float y2 = newHeight/2 - eyeWidth * 1.5;
  float y3 = newHeight/2 + eyeWidth*2;
  float x4 = newWidth/3.25;
  bezier(x1, y1, x2, y2, x2, y3, x4, y3);
  bezier(newWidth - x1, y1, newWidth - x2 + eyeWidth*.5, y2, newWidth - x2 +eyeWidth*.5, y3, newWidth - x1*1.04, y3);
  
  // Glasses
  float glassWidth = eyeWidth * 2;
  float glassHeight = eyeHeight * 8;
  float lenseRadius = eyeHeight * 5;
  noFill();
  strokeWeight(3);
  rect(newWidth/2 - headWidth/4 - glassWidth/2, newHeight/1.95 - glassHeight/2, glassWidth, glassHeight, lenseRadius);
  rect(newWidth/2 + headWidth/5 - glassWidth/2, newHeight/1.95 - glassHeight/2, glassWidth, glassHeight, lenseRadius);
  line(newWidth/2 - headWidth/4 + eyeWidth, newHeight/2, newWidth/2 + headWidth/5 - eyeWidth, newHeight/2);  
  line(newWidth/2 - headWidth/5 - glassWidth/2, newHeight/2 - glassHeight/3, x1, y1);
  line(newWidth/2 + headWidth/5 + glassWidth/2, newHeight/2 - glassHeight/5, newWidth - x1, y1);
  
  // Left eyebrow
  fill(50, 175);
  noStroke();
  beginShape();
  vertex(newWidth/2 - 0.3273*headWidth, newHeight/2 -0.1085*headHeight);
  vertex(newWidth/2 - 0.1219*headWidth, newHeight/2 -0.0927*headHeight);
  vertex(newWidth/2 - 0.1412*headWidth, newHeight/2 -0.0730*headHeight);
  vertex(newWidth/2 - 0.3080*headWidth, newHeight/2 -0.0809*headHeight);
  vertex(newWidth/2 - 0.3722*headWidth, newHeight/2 -0.0769*headHeight);
  endShape(CLOSE);
  
  // Right eyebrow
  fill(50, 175);
  noStroke();
  beginShape();
  vertex(newWidth/2 + 0.2695*headWidth, newHeight/2 -0.1085*headHeight);
  vertex(newWidth/2 + 0.0706*headWidth, newHeight/2 -0.0927*headHeight);
  vertex(newWidth/2 + 0.0898*headWidth, newHeight/2 -0.0730*headHeight);
  vertex(newWidth/2 + 0.1861*headWidth, newHeight/2 -0.0769*headHeight);
  vertex(newWidth/2 + 0.3401*headWidth, newHeight/2 -0.0611*headHeight);
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