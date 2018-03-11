class sniper extends tower
{
  PVector curr;
  PVector source;
  PVector forward;
  boolean currSet;
  float speed;
  
  sniper()
  {
    super();
    damage = 100;
    rateOfFire = 0.5;
    towerColour = color(255,100,100);
    range = width/3;
    price = 350;
    currSet = true;
    speed = 100;
    source = new PVector(0,0);
    
  }
  
  void drawTower()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    
    if(target != null)
    {
      theta = degrees(atan2(target.curr.x+target.source.x-pos.x,target.curr.y+target.source.y-pos.y));   
    }

    
    rotate(-radians(theta-90));
    strokeWeight(3);
    stroke(towerColour);
    noFill();
    
    ellipse(0,0,towerWidth,towerHeight);
    
    strokeWeight(5);
    line(0,0,(towerWidth*0.75),0);
    
    if(pos.x > menuWidth && clicked == true)
    {
      strokeWeight(1);
      noFill();
      ellipse(0,0,range*2,range*2);
      
      source = new PVector(pos.x,pos.y);
    } 
    
    popMatrix();
  }
  
  void fire()
  {
    if(currSet == true)
    {
      curr = new PVector(pos.x,pos.y);
      currSet = false;
    }
    
    ArrayList<enemy> inRange = rangeCheck(pos,range);
    
    if(inRange != null && drawShot == false)
    {
        super.choose(inRange);
    }
    
    if(!(activeEnemies.contains(target)))
    {
      target = null;
      drawShot = false;
      curr.x = source.x;
      curr.y = source.y;
    }
    
    if(target != null && millis() - timeDamage  >= 1000/rateOfFire && moving == false)
    {
      timeDamage = millis();
      drawShot = true;
    }
    
    if(drawShot == true)
    {
      if(sound == true)
      {
        sniperSound.play();
      
        if(sniperSound.position() == sniperSound.length())
        {
          sniperSound.rewind(); 
        }
      }
      
      PVector dest = new PVector(target.curr.x+target.source.x,target.curr.y+target.source.y);
      
      float theta = atan2(dest.y - curr.y, dest.x - curr.x) + HALF_PI;
      forward = new PVector(sin(theta), -cos(theta));    
      forward.normalize();
      curr.add(PVector.mult(forward, speed));
      
      pushMatrix();
      translate(curr.x,curr.y);
      
      rotate(theta);
      strokeWeight(3);
      stroke(0,255,0);
      line(0,-20,0,20);
      
      popMatrix();
    
      if(dist(curr.x,curr.y,dest.x,dest.y) < 50)
      {
        target.takeDamage(damage);  
        curr.x = source.x;
        curr.y = source.y;
        target = null;
        drawShot = false; 
      }
    }
  }
}