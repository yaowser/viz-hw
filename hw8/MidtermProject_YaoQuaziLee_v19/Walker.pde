// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// A random walker object

class Walker {
  PVector position;
  ArrayList<PVector> history = new ArrayList<PVector>();
  Walker() {
    //int whichCity = map.getCityNum();
    position = new PVector(1390, 720); //mooyoung change this for merge
  }

  void render(color colors) {
    stroke(colors);
    strokeWeight(3);
    beginShape();
    for (PVector v : history) {
      curveVertex(v.x, v.y);
    }
    endShape();
    noFill();
    stroke(0);
    strokeWeight(1);
  }

  // Randomly move up, down, left, right, or stay in one place
  void step() {
    position.x += random(-100, 100);
    position.y += random(-100, 100);
    position.x = constrain(position.x, 1150, 1500); //mooyoung change this for merge
    position.y = constrain(position.y, 577, 800); //mooyoung change this for merge
    history.add(position.get());
  }
}