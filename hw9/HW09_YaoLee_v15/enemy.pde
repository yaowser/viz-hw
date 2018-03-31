abstract class enemy
{
  PVector source;
  PVector dest;
  PVector forward;
  PVector curr;
  float speed;
  float theta;
  color entityColour;
  float entityWidth;
  float entityHeight;
  float health;
  float health2;
  int destIndex;
  int value;
  
  enemy()
  {
    source = new PVector(0,0);
    dest  = new PVector(0,0);
    forward = new PVector(0,0);
    curr = new PVector(0,0);
    destIndex = 1;
    theta = 0;
  }
  
  //move enemies from point to point of the map
  void moveEnemy()
  {
    map selected = new map();
    
    for(int i=0;i<maps.size();i++)
    {
      if(maps.get(i).name.equals(selectedMap))
      {
        selected = maps.get(i);
        source = new PVector(maps.get(i).points.get(destIndex-1).x,maps.get(i).points.get(destIndex-1).y);
        dest = new PVector(maps.get(i).points.get(destIndex).x-source.x,maps.get(i).points.get(destIndex).y-source.y);
      }
    }

    pushMatrix();
    
    translate(source.x,source.y);
    theta = atan2(dest.x,dest.y);
    
    popMatrix();
    
    forward.x = sin(theta);
    forward.y = -cos(theta);
         
    if(curr.x < dest.x-10 || curr.x > dest.x + 10 || curr.y < dest.y-10 || curr.y >dest.y+10)
    {      
      curr.x += forward.x * speed;
      curr.y -= forward.y * speed; 
    }
    else if(destIndex+1 < selected.points.size())
    {          
      destIndex +=1;
      
      for(int i=0;i<maps.size();i++)
      {
        if(maps.get(i).name.equals(selectedMap))
        {
          selected = maps.get(i);
          source = new PVector(maps.get(i).points.get(destIndex-1).x,maps.get(i).points.get(destIndex-1).y);
          dest = new PVector(maps.get(i).points.get(destIndex).x-source.x,maps.get(i).points.get(destIndex).y-source.y);
        }
      }

      curr.x = 0;
      curr.y = 0;
    }
    else if(destIndex == selected.points.size()-1)
    {
      activeEnemies.remove(this);       
      enemyTotal--;
      limit--;
    } 
    
  } 
  
  void takeDamage(float damage)
  {
    health -= damage;
  }
  
  boolean deadCheck()
  {
    if(health <= 0)
    {
      money += value;
      score += value*2;
      return true;
    }
    else
    {
      return false; 
    }
  }
 
  void drawHealthBar()
  {
    float barWidth = entityWidth*2;
    float barHeight = entityHeight/3;
    float barX = curr.x - entityWidth;
    float barY = curr.y + entityHeight;
    float innerBar = 0;
    
    if(health >= 0)
    {
      innerBar = map(health,0,health2,0,barWidth);
    }
    
    noStroke();
    fill(0,255,0);
    rect(barX,barY,innerBar,barHeight);
    
    
    noFill();
    stroke(255);
    strokeWeight(1);
    
    rect(barX,barY,barWidth,barHeight);  
  }
}



class EnemyBlockies extends enemy {

  VerletBlock blockies = new VerletBlock(new PVector(40, 40, 40), random(.003, .1));

  EnemyBlockies() {
    super();
    entityColour = color(255, 0, 0);
    entityWidth = 25;
    entityHeight = 25;
    speed = 3;
    health = health2 = (100*diffMult)*(1+(currentRound+1+overtimeRound)/10);
    value = 20;
  }

  void drawEnemy()
  {
    // verlet block
    stroke(entityColour);
    noFill();
    strokeWeight(3);
    pushMatrix();
    translate(source.x, source.y);
    blockies.move(curr.x, curr.y);
    blockies.verlet();
    blockies.display();
    drawHealthBar();
    popMatrix();
  }
}




class EnemyKinArt extends enemy {

  BossKinArt boss = new BossKinArt();


  EnemyKinArt() {

    super();
    entityColour = color(255, 255, 0);
    entityWidth = 25;
    entityHeight = 25;
    speed = 1;
    health = health2 = (8000*diffMult)*(1+(currentRound+1+overtimeRound)/10);
    value = 1000;
  }

  void drawEnemy()
  {
    // Kinematic Art Piece
    stroke(entityColour);
    noFill();
    strokeWeight(3);
    pushMatrix();
    translate(source.x, source.y);
    boss.display(curr.x, curr.y, millis()/PI/100);
    drawHealthBar();
    popMatrix();
  }
}




class EnemyRay extends enemy {

  VerletRay rays = new VerletRay(38, random(20, 50), random(.03, .3));

  EnemyRay()
  {
    super();
    entityColour = color(0, 255, 0);
    entityWidth = 25;
    entityHeight = 25;
    speed = 1.5;
    health = health2 = (200*diffMult)*(1+(currentRound+1+overtimeRound)/10);
    value = 60;
  }

  void drawEnemy()
  {
    // verlet ray
    stroke(entityColour);
    noFill();
    strokeWeight(3);
    pushMatrix();
    translate(source.x, source.y);
    rays.move(curr.x, curr.y);
    rays.verlet();
    rays.display();
    drawHealthBar();
    popMatrix();
  }
}




class EnemySpider extends enemy
{

  VerletSpider spider =  new VerletSpider(int(random(6, 10)), int(random(6, 10)), 50, random(.3, .3));
  float size;

  EnemySpider()
  {
    super();
    entityColour = color(0, 0, 255);
    entityWidth = 25;
    entityHeight = 25;
    speed = 4.5;
    health = health2 = (70*diffMult)*(1+(currentRound+1+overtimeRound)/10);
    size = 20;
    value = 40;
  }

  void drawEnemy()
  {
    // verlet spider
    stroke(entityColour);
    noFill();
    strokeWeight(3);
    pushMatrix();
    translate(source.x, source.y);
    spider.move(curr.x, curr.y);
    spider.verlet();
    spider.display();
    drawHealthBar();
    popMatrix();
  }
}
