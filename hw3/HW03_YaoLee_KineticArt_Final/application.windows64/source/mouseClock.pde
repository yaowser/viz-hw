void mouseClock(color Col){
  stroke(Col);
  strokeWeight(2);
  noFill();
    for (int i = 0; i<12; i++) {
    pushMatrix();
    rotate(PI/6*i + rot2);
    arc(100, 0, 100, 100, 1, 4.13);
    arc(0, -70, 280, 280, 2, 3);
    popMatrix();
  }
  rot2 += PI/180;
}