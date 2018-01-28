/* Analog Clock
Ira Greenberg, October 9, 2006 */

void clock(color Col){
noFill();
  stroke(0);
  float px, py, angle = -60;
  pushMatrix();
  strokeWeight(4);

  for (int i=1; i<13; i++){
    px = x+cos(radians(angle))*(r*.8);
    py = y+sin(radians(angle))*(r*.8);
    fill(0);
    // need to subtract 1/2 text width/height
    // to align center
    
    float textW = textWidth(str(i));
    text(i, px-textW/2, py+textH/2);
    angle+=360/12;
  }
  /*Subtract 90 degs. from each trig function, since 12
  is at top of clock (not at 0 postion on unit circle).
  Other numeric value is calculated by 360/number of units.*/
  //hour hand
  stroke(Col);
  noFill();
  ellipse(x, y, r*2, r*2);
  strokeWeight(4);
  
  float h = hour();
  float hourHandX = x+cos(radians(30*h-90))*(r*.5);
  float hourHandY = y+sin(radians(30*h-90))*(r*.5);
  line(x, y, hourHandX, hourHandY);
  //minute hand
  strokeWeight(2);
  
  float m = minute();
  float minuteHandX = x+cos(radians(6*m-90))*(r*.7);
  float minuteHandY = y+sin(radians(6*m-90))*(r*.7);
  line(x, y, minuteHandX, minuteHandY);
  //second hand
  strokeWeight(2);
  
  float s = second();
  float secondHandX = x+cos(radians(6*s-90))*(r*.9);
  float secondHandY = y+sin(radians(6*s-90))*(r*.9);
  line(x, y, secondHandX, secondHandY);
  popMatrix();
}