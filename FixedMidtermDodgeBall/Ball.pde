class Ball{
  float ballSize;
  PVector pos;
  PVector speed;
  int circleColor = color(random(0,255),random(0,255),random(0,255));
  
  Ball(){
    ballSize = 40; //ballsize
    pos = new PVector(random(0 + (ballSize/2), width - (ballSize)), 0); //give random position to ball
    speed = new PVector(0, random(6,12)); //give random falling speed to ball 
  }
//draw ball
  void drawBall(){
    fill(circleColor);
    ellipse(pos.x, pos.y, ballSize, ballSize);
  }

//resets ball
  void resetBall() {
    pos.set(random(0+(ballSize/2), width - (ballSize/2)), 0);
  }
  
//let ball move
  void move(){
    pos.add(speed);

    if (pos.y > height){
      resetBall();
    }
  }

//function that makes the ball fall
  void update(){
    drawBall();
    move();
  }
}
