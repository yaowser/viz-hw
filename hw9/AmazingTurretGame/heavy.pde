class heavy extends enemy
{
  heavy()
  {
    super();
    entityColour = color(0,255,0);
    entityWidth = 25;
    entityHeight = 25;
    speed = 1.5;
    health = health2 = (200*diffMult)*(1+(currentRound+1+overtimeRound)/10);
    value = 60;
  }
  
  void drawEnemy()
  {
    stroke(entityColour);
    noFill();
    strokeWeight(3);
    pushMatrix();
    
    translate(source.x,source.y);
    rect(curr.x-entityWidth/2,curr.y-entityHeight/2,entityWidth,entityHeight);
    drawHealthBar();

    popMatrix();
  }
}