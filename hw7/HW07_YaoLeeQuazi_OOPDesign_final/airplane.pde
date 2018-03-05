PImage aerop;

airplane[] aero= new airplane[2];
class airplane{
  // fields
  float sun;
  float qua;
  float diameter;
  
  PVector loc;
  PVector velocity;
  float scl;
  PImage p;
  
  // cstrs
  airplane(float tempX, float tempY, float tempD){
    sun=tempX;
    qua=tempY;
    diameter=tempD;
  }

  airplane(){
  }
  
  void ascend(){
    qua=qua-5;
    sun=sun+8;
  }
  
  void display(){
  image(aerop, sun, qua, diameter, diameter);
}
    
}