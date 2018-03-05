class boss extends enemy
{
  boss()
  {
    super();
    entityColour = color(255,255,100);
    entityWidth = 25;
    entityHeight = 25;
    speed = 1;
    health = health2 = (5000*diffMult)*(1+(currentRound+1+overtimeRound)/10);
    value = 1000;
  } 
  
  void drawEnemy()
  {
    stroke(entityColour);
    noFill();
    strokeWeight(3);
    
    pushMatrix();
    translate(source.x,source.y);
    
    pushMatrix();
    translate(curr.x,curr.y);
    
    rotate(frameCount*0.5);
    ellipse(0,0,entityWidth*2,entityHeight*2);
    line(-entityWidth,0,entityWidth,0);
    line(0,-entityHeight,0,entityHeight);
    
    popMatrix();
    drawHealthBar();
 
    popMatrix();
  }
}