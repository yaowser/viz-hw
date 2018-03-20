boolean mouseOver(int x, int y, int w, int h, color highlight) {

  if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
    fill(highlight);
    noStroke();
    rect(x,y,w,h);
    return true;
  } else {
    return false;
  }
}