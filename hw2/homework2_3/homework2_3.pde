/*Homework 2_3.pde
Author: Cassandra Liau
Summary: bouncing balls with user-input
*/

//define variables 
float xPos = 0.0; //x position
float yPos = 0.0; //y position
float xSpeed = 10.0; //x speed
float ySpeed = 10.0; //y speed
boolean play = true; //states whether the ball should be moving

void setup(){
  size(1600, 1050);
  background(250);
  noStroke();
}

void draw(){
background(0);
  
  //draw ellipse
  ellipse(xPos, yPos, 500, 500);
  
  //bounces when it touches the walls of canvas
  if(xPos > width || xPos < 0.0){
    xSpeed *= -1.0;
  }
  if(yPos > height || yPos < 0.0){
    ySpeed *= -1.0;
  }
  
  //move the ellipse if play is true
  if(play){
    xPos += xSpeed;
    yPos += ySpeed;
  }
} 
void keyPressed(){
  if (keyCode == UP) {
    fill(180, 175, 214); //changes color when presses up key
  }else if (keyCode == DOWN) {
    fill(214, 175, 175); //changes color when presses down key
  }else if (keyCode == LEFT){
    fill(175, 206, 214); //changes color when presses left key
  }else{ //changes color when presses right key
    fill(175, 214, 177);
  }
}
