class rocket extends tower
{
   PVector curr;
   PVector source;
   PVector forward;
   PVector blastLoc;
   float speed;
   boolean currSet;
   float AOE;
   boolean drawBlast;
   float pulse;
   boolean pulseCheck2;
  
  rocket()
  {
    super();
    damage = 100;
    rateOfFire = 0.25;
    towerColour = color(150,100,150);
    range =width/5;
    price = 450;
    speed = 6;
    currSet = true;
    AOE = 100;
    drawBlast = false;
    pulse = 0;
    theta = 0;
    pulseCheck2 = true;
    source = new PVector(0,0);
  }
  
  void drawTower()
  {
    strokeWeight(3);
    stroke(towerColour);
    noFill();

    pushMatrix();
    translate(pos.x,pos.y);
    //theta = degrees(atan2(mouseX-pos.x,mouseY-pos.y));


    if(target != null)
    {
      theta = degrees(atan2(target.curr.x+target.source.x-pos.x,target.curr.y+target.source.y-pos.y));   
    }

    rotate((-radians(theta-90)));
    strokeWeight(3);
    stroke(towerColour);
    noFill();
    ellipse(0,0,towerWidth,towerHeight);
    
    fill(0);
    
    rect(-towerWidth/4,-towerHeight/4,towerWidth,towerHeight/2);
    
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
    ArrayList<enemy> inRange = rangeCheck(pos,range);

    if(currSet == true)
    {
      curr = new PVector(pos.x,pos.y);
      currSet = false;
    }
    
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
      pulseCheck2 = true;
    }
    
    if(drawShot == true)
    {
      PVector dest = new PVector(target.curr.x+target.source.x,target.curr.y+target.source.y);
      fill(255,0,0);
      stroke(255,0,0);
      strokeWeight(10);
      point(dest.x,dest.y);
      forward = PVector.sub(dest,curr);
      forward.normalize();
        
      curr.add(PVector.mult(forward,speed)); 
              
      stroke(0,255,0);
      strokeWeight(10);
      fill(0,255,0);
      point(curr.x,curr.y);
    
      if(dist(curr.x,curr.y,dest.x,dest.y) < 10)
      {         
        blastLoc = new PVector(curr.x,curr.y);
        curr.x = source.x;
        curr.y = source.y;
        target = null;
        drawShot = false; 
        drawBlast = true;
      }
    }
    
    if(drawBlast == true)
    {
      ArrayList<enemy> inBlast = rangeCheck(blastLoc,AOE);
      
      if(sound == true)
      {
        launcherSound.play();
      
        if(launcherSound.position() == launcherSound.length())
        {
          launcherSound.rewind(); 
        }
      }
       
      stroke(0,255,0);
      strokeWeight(4);
      noFill();
      
      pulse = lerp(pulse,AOE*2,0.1);
      
      if(pulse > (AOE*2)-1)
      {
        pulse = 0;
        drawBlast = false;  
      }
      else if(pulse > AOE && inBlast != null)
      {
        if(pulseCheck2 == true)
        {
          for(int i=0;i<inBlast.size();i++)
          {
            inBlast.get(i).takeDamage(damage); 
          }  
          pulseCheck2 = false;
        }
      }
      
      ellipse(blastLoc.x,blastLoc.y,pulse,pulse);
    }
  }
}