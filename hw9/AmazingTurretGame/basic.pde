class basic extends enemy
{
  basic()
  {
    super();
    entityColour = color(255,0,0);
    entityWidth = 25;
    entityHeight = 25;
    speed = 3;
    health = health2 = (100*diffMult)*(1+(currentRound+1+overtimeRound)/10);
    value = 20;
  }
  
  void drawEnemy()
  {
    stroke(entityColour);
    noFill();
    strokeWeight(3);
    pushMatrix();
    
    translate(source.x,source.y);
    ellipse(curr.x,curr.y,entityWidth,entityHeight);
    drawHealthBar();
    
    popMatrix();
  }
}