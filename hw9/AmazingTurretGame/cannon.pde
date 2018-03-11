class cannon extends tower
{  
  cannon()
  {
    super();
    damage = 40;
    rateOfFire = 1;
    towerColour = color(255,0,255);
    range = width/8;
    priority = "Heavy";
    price = 100;
  }
  
  void drawTower()
  {
    pushMatrix();
    translate(pos.x,pos.y);
      
    //if tower has a target calculate the angle between them
    if(target != null)
    {
      theta = degrees(atan2(target.curr.x+target.source.x-pos.x,target.curr.y+target.source.y-pos.y));   
    }
    
    //point towards target
    rotate(-radians(theta-90));
      
    stroke(towerColour);
    noFill();
    strokeWeight(3);
      
    ellipse(0,0,towerWidth,towerHeight);
    triangle(towerWidth/4,0,-towerWidth/4,towerHeight/4,-towerWidth/4,-towerHeight/4);  
    
    //if clicked draw range
    if(pos.x > menuWidth && clicked == true)
    {
      strokeWeight(1);
      ellipse(0,0,range*2,range*2);
    } 
    
    popMatrix();
  }
  
  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(pos,range);
    
    if(inRange != null )
    {
      super.choose(inRange);
     
      if(millis()-timeDamage >= 1000/rateOfFire && target != null && moving == false)  
      {    
        target.takeDamage(damage);
        timeDamage = millis();
        drawShot = true;
      } 
      
      if(drawShot == true)
      {
        if(sound == true)
        {
          laserCannonSound.play();
        
          if(laserCannonSound.position() == laserCannonSound.length())
          {
            laserCannonSound.rewind(); 
          }
        }
        
        pushMatrix();
        translate(target.source.x,target.source.y);
        strokeWeight(5);
        stroke(255,0,0);
        line(pos.x-target.source.x,pos.y-target.source.y,target.curr.x,target.curr.y);
        popMatrix();
        
        if(millis()-timeDraw > (1000/rateOfFire)/3)
        {
          drawShot = false;
          timeDraw = millis();
        } 
      }
    }
    else
    {
     target = null; 
    }
  }
}