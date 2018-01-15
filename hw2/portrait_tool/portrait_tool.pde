PImage myBackground;
ArrayList<PVector> points = new ArrayList<PVector>();
int l =4;

void settings() {
  myBackground = loadImage("1.jpg");
  int myWidth = myBackground.width;
  int myHeight = myBackground.height;
  size(myWidth, myHeight);
}

void draw() {
  background(myBackground);
  if(l == 1){ //curveVertex
    beginShape();
    for(int i = 0; i < points.size(); i++) {
      if(i == 0 || i == points.size() - 1) {
        curveVertex(points.get(i).x, points.get(i).y);
      }
      curveVertex(points.get(i).x, points.get(i).y);
    }
    endShape();
  } else if(l == 2){ //curve
    if(points.size() != 0 && points.size() % 4 == 0){
      for(int i = 0; i < points.size()-3; i+=4){
        curve(points.get(i+2).x, points.get(i+2).y, points.get(i).x, points.get(i).y,
        points.get(i+1).x, points.get(i+1).y,points.get(i+3).x, points.get(i+3).y);
      }
    }
  } else if(l == 3){ //lines connected
    for(int i = 0; i < points.size()-1; i+=1){
       line(points.get(i).x,points.get(i).y,points.get(i+1).x,points.get(i+1).y);
    }
  } else if(l == 4){ //lines discrete
    for(int i = 0; i < points.size()-1; i+=2){
       line(points.get(i).x,points.get(i).y,points.get(i+1).x,points.get(i+1).y);
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    points.add(new PVector(mouseX, mouseY));
  } else if(mouseButton == RIGHT) { //get fill color
    color c = get(mouseX, mouseY);
    println("fill(" + int(red(c)) + "," + int(green(c)) + "," + int(blue(c)) + ");");
  }
}

void keyPressed() {
  if(key == ' ') { //curveVertex
    l=1;
    println("beginShape();");
    println("curveVertex(" + points.get(0).x + ", " + points.get(0).y + ");");
    for(int i = 0; i < points.size(); i++) {
      println("curveVertex(" + points.get(i).x + ", " + points.get(i).y + ");");
    }
    println("curveVertex(" + points.get(points.size()-1).x + ", " + points.get(points.size()-1).y + ");");
    println("endShape();");
  }
  if(key == '2') { //curve
    l=2;
    for(int i = 0; i < points.size()-3; i+=4){
      println("curve("+ points.get(i+2).x + ","+ points.get(i+2).y + ","+ 
      points.get(i).x + ","+ points.get(i).y + ","+ points.get(i+1).x + ","+
      points.get(i+1).y + ","+ + points.get(i+3).x + ","+ points.get(i+3).y + ");");
    }
  }
  if(key == '3') { //lines connected
    l=3;
    for(int i = 0; i < points.size()-1; i+=1){
       println("line("+points.get(i).x + ","+ points.get(i).y + ","+ 
       points.get(i+1).x + ","+ points.get(i+1).y + ");");
    }
  }
  if(key == '4') { //lines discrete
    l=4;
    for(int i = 0; i < points.size()-1; i+=2){
       println("line("+points.get(i).x + ","+ points.get(i).y + ","+ 
       points.get(i+1).x + ","+ points.get(i+1).y + ");");
    }
  }
}