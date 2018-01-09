PImage img;
PFont f;

void setup() {
  size(1000, 380);                
  img = loadImage("637.jpg");
  img.resize(493, 380);
  f = createFont("Arial",8,true);
}

void draw() {
  background(100,135,185);
  image(img, 493, 0);
  
  textFont(f,10);
  fill(10);
  text("Yao",17,360);
  
  stroke(1);
  fill(220,180,60); //yellow square and triangle
  rect(25,24,65,13);
  triangle(370,210,400,210,370,230);
  
  fill(250,250,250); //white square
  rect(371,196,95,9);
  
  fill(200,75,41); //orange large triangle
  triangle(297,250,473,245,383,338);
  
  fill(10,10,10); //all black shapes
  triangle(215,180,189,233,243,233);
  triangle(215,231,196,283,243,283);
  triangle(215,286,201,335,236,335);
  triangle(408,215,444,215,428,248);
  triangle(371,146,371,189,442,189);
  ellipse(119,178,165,165);
  ellipse(383,380,165,165);
  triangle(50,75,190,75,120,183);
  
  fill(40,40,70); //blue triangle path
  triangle(120,183,80,350,160,350);
  
  stroke(255); // white spokes of inner circle
  for (int i=0;i<49;i++) {
    fill(250,250,250);
    pushMatrix();
    translate(119,178);
    rotate(radians(i * 10));
    line(0, 0, 70, 20);
    popMatrix();
  }

  stroke(1);
  fill(40,22,85); //navy blue inner circle
  ellipse(119,178,65,65);
  
  fill(180,30,42); //red thorn
  ellipse(403,53,125,125);
  
  fill(100,135,185); //background blue to hide red thorn
  noStroke();
  ellipse(403,50,115,115);
  
  stroke(1);
  fill(200,75,41);//orange thorn
  ellipse(371,43,114,80);
  
  fill(100,135,185); //background blue to hide orange thorn
  noStroke();
  ellipse(383,380,170,122);
  ellipse(371,43,117,65);
  rect(297,0,74,140);
  rect(297,0,140,43);
  
  fill(100,135,185); //background blue to hide red thorn
  pushMatrix();
  translate(415, -40);
  rotate(radians(23));
  rect(0, 0, 80, 80);
  popMatrix();
  
  stroke(1);
  fill(180,30,42); //remaining red shapes
  pushMatrix();
  translate(280, 60);
  rotate(radians(23));
  rect(0, 0, 40, 40);
  popMatrix();
  triangle(371,24,371,241,254,241);
  triangle(371,241,371,228,390,228);
  triangle(371,146,442,189,442,146);
  
  stroke(1);
  fill(200,75,41);//orange small triangle
  triangle(365,320,400,320,383,338); 

}