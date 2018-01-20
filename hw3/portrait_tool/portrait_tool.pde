PImage myBackground;
ArrayList<PVector> points = new ArrayList<PVector>();
int l =3; //manual change

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
        curveVertex(int(points.get(i).x), int(points.get(i).y));
      }
      curveVertex(int(points.get(i).x), int(points.get(i).y));
    }
    endShape();
  } else if(l == 2){ //curve
    if(points.size() != 0 && points.size() % 4 == 0){
      for(int i = 0; i < points.size()-3; i+=4){
        curve(int(points.get(i+2).x), int(points.get(i+2).y), int(points.get(i).x), int(points.get(i).y),
        int(points.get(i+1).x), int(points.get(i+1).y),int(points.get(i+3).x), int(points.get(i+3).y));
      }
    }
  } else if(l == 3){ //lines connected
    for(int i = 0; i < points.size()-1; i+=1){
       line(int(points.get(i).x),int(points.get(i).y),int(points.get(i+1).x),int(points.get(i+1).y));
    }
  } else if(l == 4){ //lines discrete
    for(int i = 0; i < points.size()-1; i+=2){
       line(int(points.get(i).x),int(points.get(i).y),int(points.get(i+1).x),int(points.get(i+1).y));
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
    println("curveVertex(" + int(points.get(0).x) + ", " + int(points.get(0).y) + ");");
    for(int i = 0; i < points.size(); i++) {
      println("curveVertex(" + int(points.get(i).x) + ", " + int(points.get(i).y) + ");");
    }
    println("curveVertex(" + int(points.get(points.size()-1).x) + ", " + int(points.get(points.size()-1).y) + ");");
    println("endShape(CLOSE);");
  }
  if(key == '2') { //curve
    l=2;
    for(int i = 0; i < points.size()-3; i+=4){
      println("curve("+ int(points.get(i+2).x) + ","+ int(points.get(i+2).y) + ","+ 
      int(points.get(i).x) + ","+ int(points.get(i).y) + ","+ int(points.get(i+1).x) + ","+
      int(points.get(i+1).y) + ","+ + int(points.get(i+3).x) + ","+ int(points.get(i+3).y) + ");");
    }
  }
  if(key == '3') { //lines connected
    l=3;
    for(int i = 0; i < points.size()-1; i+=1){
       println("line("+int(points.get(i).x) + ","+ int(points.get(i).y) + ","+ 
       int(points.get(i+1).x) + ","+ int(points.get(i+1).y) + ");");
    }
  }
  if(key == '4') { //lines discrete
    l=4;
    for(int i = 0; i < points.size()-1; i+=2){
       println("line("+int(points.get(i).x) + ","+ int(points.get(i).y) + ","+ 
       int(points.get(i+1).x) + ","+ int(points.get(i+1).y) + ");");
    }
  }
}