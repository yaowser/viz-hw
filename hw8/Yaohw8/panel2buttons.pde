void panel2buttons(int married,int year,color select){
  
  stroke(2);
  
  if(married==-1){
    fill(select);
    rect(0,325,100,42);
    fill(255);
    rect(100,325,120,42);
  } else {
    fill(255);
    rect(0,325,100,42);
    fill(select);
    rect(100,325,120,42);
  }
  if(year==1){
    fill(select);
    rect(220,325,100,42);
    fill(255);
    rect(320,325,100,42);
  } else {
    fill(255);
    rect(220,325,100,42);
    fill(select);
    rect(320,325,100,42);
  }
  
  fill(0);
  textSize(30);
  text("Single",2,327);
  text("Married",102,327);
  text("2017",222,327);
  text("2018",323,327);
  
}