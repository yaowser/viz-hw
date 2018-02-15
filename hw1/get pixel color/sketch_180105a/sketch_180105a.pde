PImage img;

void setup() {
  size(500, 380);                
  img = loadImage("olympics.jpg");
  img.resize(493, 380);
}

void draw() {
  image(img, 0, 0);
  if (mousePressed == true) {
    color c = get(mouseX, mouseY);
    float r = red(c);      // Extract red
    float g = green(c);    // Extract green
    float b = blue(c);     // Extract blue
    println("red", r, "green", g, "blue", b);
  }
}