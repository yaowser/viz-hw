class fast extends enemy
{
  float size;
  
  fast()
  {
    super();
    entityColour = color(0,0,255);
    entityWidth = 25;
    entityHeight = 25;
    speed = 4.5;
    health = health2 = (70*diffMult)*(1+(currentRound+1+overtimeRound)/10);
    size = 20;
    value = 40;
  }
  
  void drawEnemy()
  {
    stroke(entityColour);
    noFill();
    strokeWeight(3);
    pushMatrix();
    
    translate(source.x,source.y);
    triangle(curr.x,curr.y-size,curr.x+size,curr.y+size,curr.x-size,curr.y+size);
    drawHealthBar();
 
    popMatrix();
  }
}