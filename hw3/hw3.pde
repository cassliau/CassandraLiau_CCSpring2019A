/*Homework 3.pde
Author: Cassandra Liau
Summary: bouncing balls with user-input including arrays & for loop
*/
//declaring variables

  //number of balls in the sketch
    int numBalls = 30; 
    
//define array containers for ball parameters
  //arrays to hold x,y positions
    float[] xPos = new float[numBalls];
    float[] yPos = new float[numBalls]; 
  //arrays to hold x,y speeds
    float[] xSpeed = new float[numBalls];
    float[] ySpeed = new float[numBalls]; 
  //arrays to hold circle size
    float[] circleSize = new float[numBalls];
  //arrays to hold RGB color
    float [] colorR = new float[numBalls];
    float [] colorG = new float[numBalls];
    float [] colorB = new float[numBalls];
    
//state that determines whether the balls should be moving
  boolean play = true; 

void setup(){
  //canvas setup
    size(1600, 1050);
    background(250);
    noStroke();
  //for loop for speed & position & size
    for(int i = 0; i < numBalls; i++){
    //random positions
      xPos[i] = random(100, width);
      yPos[i] = random(100, height);
    //random speeds
      xSpeed[i] = random(-10, 10);
      ySpeed[i] = random(-10, 10); 
    //random sizes
      circleSize[i] = random(20,300);
    //random RGB colors
      colorR[i] = random(1,255);
      colorG[i] = random(1,255);
      colorB[i] = random(1,255);

    }
}

void draw(){
  //reset background
    background(0);  
    
  //draw ellipses in for loop
   for(int i = 0; i < numBalls; i++){
     ellipse(xPos[i], yPos[i], circleSize[i], circleSize[i]);
     //fill in different color for each circle
       fill(colorR[i],colorG[i],colorB[i]);
        //bounces when it touches the walls of canvas
          if(xPos[i] > width || xPos[i] < 0.0){
            xSpeed[i] *= -1.0;
          }
          if(yPos[i] > height || yPos[i] < 0.0){
            ySpeed[i] *= -1.0;
          }
        //move the ellipse if play is true
          if(play){
            xPos[i] += xSpeed[i];
            yPos[i] += ySpeed[i];
          }
   }
} 
    
void keyPressed(){
  //plays and stops while space bar is pressed
    if(key == ' '){
      play = !play;
    }
}
