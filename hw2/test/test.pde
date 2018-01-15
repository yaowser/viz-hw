PImage myBackground;
ArrayList<PVector> points = new ArrayList<PVector>();

void settings() {
  myBackground = loadImage("1.jpg");
  int myWidth = myBackground.width;
  int myHeight = myBackground.height;
  size(myWidth, myHeight);
}

void draw() {
  background(myBackground);
  if (points.size() > 3);
    curve(points.get(1).x, points.get(1).y, points.get(2).x, points.get(2).y,
    points.get(0).x, points.get(0).y,points.get(3).x, points.get(3).y);
}

void mousePressed() {
  points.add(new PVector(mouseX, mouseY));
}

void keyPressed() {
  if(key == ' ') {  
    println("curve("+ points.get(1).x + ","+ points.get(1).y + ","+ 
    points.get(2).x + ","+ points.get(2).y + ","+ points.get(0).x + ","+ 
    points.get(0).y + ","+ points.get(3).x + ","+ points.get(3).y + ");");
  }
}