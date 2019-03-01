/*Homework 4.pde
Author: Cassandra Liau
Summary: 4 rectangles formed together with the control 
of the mouse and pulsing in size
*/

float angle = 0.0; //angle of the rectangle
float angleStep = 2.0; //speed of the rotation

float scaleFactor = 1; //scale of the rectangle
float scaleStep = 0.1; //1% increase every frame

color c1; //set up color
color c2; 

void setup(){
  size(1600, 1050);
  rectMode(CENTER); //center the rectangle
  colorMode(HSB, 360, 100, 100); //change color mode
}

void draw(){
  //set up hue & sat using the mouse as the control
  float hue = map(mouseX, 0, width, 20, 360);
  float sat = map(mouseY, 0, height, 20, 100);
  
  //set up colors
  color c1 = color(hue, sat, 100); 
  color c2 = color(hue, sat, 100);
  
  noStroke();
  
  //background color changes relative to the mouse
  background(color((hue(c1)+100) % 360, sat, 100)); 
  
  //start a transformation set
  pushMatrix(); 
    //translate to mouse position
    translate(mouseX, mouseY);
    //rotate the rectangle in degree angle in radians
    rotate(radians(angle));
    //scale by scaleFactor
    scale(scaleFactor);
    //for loop for the rectangle
    for(float radius = 200; radius > 0; radius --){
      //lerping the color of the rectangle
      color rectColor = lerpColor(c1, c2, radius/200); 
      fill(rectColor);
      rect(150, 50, radius, radius);
      rect(250, 150, radius, radius);
      rect(350, 250, radius, radius);
      rect(450, 350, radius, radius);
      
    }
  popMatrix(); //end a transformation set
  
  //increment angle and scale
  angle += angleStep;
  scaleFactor += scaleStep;
  
  if(scaleFactor < 1.0 || scaleFactor > 2.0){
    scaleStep *= -1;
  }
}
