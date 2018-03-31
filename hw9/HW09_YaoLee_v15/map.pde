class map
{
  String name;
  ArrayList<PVector> points = new ArrayList<PVector>();
  
  map()
  {
    this.name = "Default"; 
  }
  
  map(TableRow row)
  {
    this.name = row.getString("Name");
    float column = row.getColumnCount();
    
    for(int i=1;i<column;i+=2)
    { 
      if(!row.getString(i).equals("21"))
      {
        float x = map(Float.parseFloat(row.getString(i)),0,20,menuWidth+100,width-100);
        float y = map(Float.parseFloat(row.getString(i+1)),0,20,100,height-156);
          
        PVector p = new PVector(x,y);
        points.add(p);
      }
    }
  }
  
  void drawMap()
  {
    for(int i=0;i<points.size();i++)
    {
      float x1 = points.get(i).x;
      float y1 = points.get(i).y;
      float x2 = -1;
      float y2 = -1;
      
      if(i+1 < points.size())
      {
        x2 = points.get(i+1).x;
        y2 = points.get(i+1).y;
      }
      
      strokeWeight(1);
      stroke(255);
      
      if(i==0)
      {
        //noFill();
        //strokeWeight(5); 
        //stroke(255);
        image(eventHorizon,x1,y1,pathWidth*2,pathWidth*2);
        //ellipse(x1,y1,pathWidth,pathWidth*2);
      }
      
      if(i==points.size()-2)
      {
        //noFill();
        //strokeWeight(5);
        //stroke(255);
        image(eventHorizon,x2,y2,pathWidth*2,pathWidth*2);
        //ellipse(x2,y2,pathWidth,pathWidth*2);
      }
     
      if(x2 != -1 && y2 != -1)
      {
        noStroke();
        fill(41,132,192,150);
        quad(x1,y1-pathWidth/2,x2,y2-pathWidth/2,x2,y2+pathWidth/2,x1,y1+pathWidth/2);
      }
    }
  }
}
