class AOE extends tower
{
  float pulse;
  boolean pulseCheck;
  
  AOE()
  {
    super();
    damage = 100;
    rateOfFire = 0.25;
    towerColour = color(0,255,255);
    range = width/12;
    pulse = towerWidth/2;
    price = 200;
    pulseCheck = true;
  }
  
  void drawTower()
  {
    stroke(towerColour);
    noFill();
    strokeWeight(3);
    
    ellipse(pos.x,pos.y,towerWidth,towerHeight);
    ellipse(pos.x,pos.y,towerWidth/2,towerHeight/2);
    
    //if clicked draw range
    if(pos.x > menuWidth && clicked == true)
    {
      strokeWeight(1);
      ellipse(pos.x,pos.y,range*2,range*2);
    } 
  }
  
  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(pos,range);
    
    if(inRange != null)
    {
      if(millis()-timeDamage >= 1000/rateOfFire && moving == false)
      {
        timeDamage = millis();
        drawShot = true;
        pulseCheck = true;
      }
    }
      
    if(drawShot == true)
    {
      if(sound == true)
      {
        AOESound.play();
      
        if(AOESound.position() == AOESound.length())
        {
          AOESound.rewind();
        }        
      }
 
      stroke(towerColour);
      strokeWeight(2);
      noFill();
      
      pulse = lerp(pulse,range*2,0.1);
      ellipse(pos.x,pos.y,pulse,pulse);
    
      if(pulse > range*2-1)
      {
        pulse = towerWidth/2;
        drawShot = false;
      }
      else if( pulse > range && inRange != null)
      {
        if(pulseCheck == true)
        {
          for(int i=0;i<inRange.size();i++)
          {
            inRange.get(i).takeDamage(damage); 
          }      
          pulseCheck = false;
        }
      }
    }
  }
}