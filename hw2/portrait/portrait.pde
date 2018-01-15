PImage img;
PFont f;

void settings() {           
  img = loadImage("1.jpg");
  int iWidth = img.width;
  int iHeight = img.height;
  size(iWidth, iHeight);
}

void setup(){
  f = createFont("Arial",8,true);
}

void draw() {
  //background(100,135,185);
  image(img, 0, 0);
  
  stroke(1);
  fill(255, 255, 255);
  beginShape();
  curveVertex(38, 629);
  curveVertex(38, 629);
  curveVertex(11, 660);
  curveVertex(8, 670);
  curveVertex(31, 679);
  curveVertex(50, 671);
  curveVertex(63, 643);
  curveVertex(80, 626);
  curveVertex(80, 626);
  endShape();
  
beginShape();
curveVertex(132.0, 627.0);
curveVertex(132.0, 627.0);
curveVertex(137.0, 641.0);
curveVertex(137.0, 658.0);
curveVertex(143.0, 674.0);
curveVertex(161.0, 673.0);
curveVertex(170.0, 671.0);
curveVertex(178.0, 660.0);
curveVertex(176.0, 649.0);
curveVertex(174.0, 639.0);
curveVertex(164.0, 618.0);
curveVertex(164.0, 618.0);
endShape();
  
  fill(181,181,195);
  beginShape();
curveVertex(32.0, 343.0);
curveVertex(32.0, 343.0);
curveVertex(30.0, 349.0);
curveVertex(29.0, 369.0);
curveVertex(33.0, 380.0);
curveVertex(31.0, 419.0);
curveVertex(35.0, 436.0);
curveVertex(35.0, 459.0);
curveVertex(41.0, 481.0);
curveVertex(39.0, 491.0);
curveVertex(42.0, 506.0);
curveVertex(38.0, 517.0);
curveVertex(39.0, 524.0);
curveVertex(34.0, 553.0);
curveVertex(32.0, 590.0);
curveVertex(42.0, 609.0);
curveVertex(37.0, 612.0);
curveVertex(38.0, 629.0);
curveVertex(69.0, 632.0);
curveVertex(88.0, 615.0);
curveVertex(89.0, 604.0);
curveVertex(83.0, 589.0);
curveVertex(95.0, 541.0);
curveVertex(95.0, 478.0);
curveVertex(102.0, 472.0);
curveVertex(104.0, 433.0);
curveVertex(104.0, 417.0);
curveVertex(101.0, 408.0);
curveVertex(105.0, 417.0);
curveVertex(105.0, 433.0);
curveVertex(116.0, 465.0);
curveVertex(122.0, 487.0);
curveVertex(124.0, 527.0);
curveVertex(119.0, 563.0);
curveVertex(122.0, 575.0);
curveVertex(122.0, 600.0);
curveVertex(132.0, 627.0);
curveVertex(158.0, 623.0);
curveVertex(164.0, 619.0);
curveVertex(163.0, 603.0);
curveVertex(176.0, 567.0);
curveVertex(173.0, 510.0);
curveVertex(173.0, 492.0);
curveVertex(168.0, 480.0);
curveVertex(172.0, 468.0);
curveVertex(175.0, 388.0);
curveVertex(177.0, 379.0);
curveVertex(178.0, 368.0);
curveVertex(175.0, 358.0);
curveVertex(173.0, 352.0);
curveVertex(173.0, 352.0);
endShape();
  



line(29.0,653.0,40.0,647.0);
line(40.0,647.0,33.0,643.0);
line(33.0,643.0,43.0,638.0);
line(43.0,638.0,38.0,629.0);
line(38.0,629.0,49.0,633.0);
line(49.0,633.0,34.0,637.0);
line(34.0,637.0,40.0,642.0);
line(40.0,642.0,31.0,647.0);
line(31.0,647.0,36.0,656.0);
  
  line(157.0,649.0,163.0,640.0);
line(163.0,640.0,151.0,639.0);
line(151.0,639.0,159.0,630.0);
line(159.0,630.0,151.0,627.0);
line(151.0,627.0,159.0,622.0);
line(159.0,622.0,152.0,631.0);
line(152.0,631.0,160.0,635.0);
line(160.0,635.0,156.0,644.0);
line(156.0,644.0,164.0,645.0);
}