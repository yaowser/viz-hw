PImage img;

void settings() {           
  img = loadImage("1.jpg");
  int iWidth = img.width;
  int iHeight = img.height;
  size(iWidth, iHeight);
}

void draw() {
  image(img, 0, 0);
  if (mousePressed == true) {
    color c = get(mouseX, mouseY);
    int r = int(red(c));      // Extract red
    int g = int(green(c));    // Extract green
    int b = int(blue(c));     // Extract blue
    println("fill(" + r + "," + r + "," + b + ");");
  }
}