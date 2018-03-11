void panel1(String city, String state, int listing){
  fill(255);
  stroke(2);
  rect(0,0,420,325);
  image(loadImage(city+".png"),2,88);
  fill(0);
  textSize(32);
  text("Data Scientist Salaries in\nthe "+city+", "+state+" area",2,0);
  text("from "+listing+"\nlistings",252,230);
}