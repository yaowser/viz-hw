void drawCircle(float x, float y, float radius, float social) {
  noFill();
  strokeWeight(1);
  stroke(random(255),random(255),random(255));
  ellipse(x, y, radius, radius);
  if (radius > social/6) {
    // Four circles! left right, up and down
    drawCircle(x + radius/2, y, radius/2, social);
    drawCircle(x - radius/2, y, radius/2, social);
    drawCircle(x, y + radius/2, radius/2, social);
    drawCircle(x, y - radius/2, radius/2, social);
  }
}