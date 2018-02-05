void windyTree(int x, int y, float theta) {
  // Windy Day; 2/4/2018 Mooyoung Lee
  // Function: draw a tree that is shaking by wind
  // Reference: Resursive Tree <https://processing.org/examples/tree.html>

  stroke(255);
  pushMatrix();
  translate(150+x, 150+y);  // translate to a desired location
  scale(.8);
  line(0, 0, 0, 120);

  strokeWeight(2);
  branch(80, theta);
  popMatrix();
}

void branch(float h, float theta) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;


  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {

    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta*1.2);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h, theta);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta*.6);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h, theta);
    popMatrix();
  }
}