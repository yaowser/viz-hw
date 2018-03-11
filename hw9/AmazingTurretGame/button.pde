class button
{
 String label;
 boolean clicked;
 PVector pos;
 float buttonWidth;
 float buttonHeight;
 
 button()
 {
    label = "Default";
    clicked = false;
    pos = new PVector(0,0);
    buttonWidth = 0;
    buttonHeight = 0;
 }
 
 button(String label, boolean clicked,float x, float y, float buttonWidth, float buttonHeight)//Assigning values
 {
   this.label = label;
   this.clicked = clicked;
   pos = new PVector(x,y);
   this.buttonWidth = buttonWidth;
   this.buttonHeight = buttonHeight;
 }
 
 //used to draw all buttons
 void drawButton()
 { 
   noFill();
   stroke(255);
   
   textSize(buttonHeight/4);
   
   //check if clicked before drawing
   isClicked();
  
   //if clicked reduce size
   if(clicked == true)
   {
     buttonWidth = buttonWidth*0.95;
     buttonHeight = buttonHeight*0.95;
     pos.x = pos.x +(buttonWidth*0.025);
     pos.y = pos.y +(buttonHeight*0.025);
     textSize((buttonHeight/4)*0.95);
   }
   
   strokeWeight(2);
   rect(pos.x,pos.y,buttonWidth,buttonHeight);
      
   fill(255);
   
   text(label,(pos.x+(buttonWidth/2))-(textWidth(this.label)/2),pos.y+buttonHeight*.75);
 }
 
 void isClicked()//if clicked change appearance
 {  
   if(mouseX>pos.x && mouseX<(pos.x+buttonWidth) && mouseY>pos.y && mouseY<pos.y+buttonHeight)
   { 
     if(mousePressed)
     {
      clicked = true;
     }
     else
     {
      clicked = false;
     }
   }
 }
 
 String toString()
 {
  return label + "\t" + clicked; 
 }
 
}