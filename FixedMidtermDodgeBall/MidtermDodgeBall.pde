/* DODGE THE BALLS 
  by: Cassandra Liau
  
  How to play:
  - Use your mouse to control the panel and dodge the falling balls
  - Top of the screen shows your remaining health
  - If the your panel touches the balls, your health decreases
  
*/

//limit screen to number amount of balls
int numBalls = 8;
int level = 0;
int levelUp;

//array of balls
Ball[] bs = new Ball[numBalls];
Me player = new Me();
Timer startTimer;

float gameState = 0;
ArrayList stars;

void setup() {
  size(800, 800);
  noStroke();
  
  //timer
  startTimer = new Timer(30);
  
  //star background
  stars = new ArrayList();
  for(int i = 1; i <= 300; i++){
    stars.add(new star());
  }
  
  //falling balls in a for loop
  for (int i = 0; i < numBalls; i++) {
    bs[i] = new Ball();
  }
  
}

void draw() {
  background(0);
  
  //space background 
  for(int i = 0; i <= stars.size()-1; i++){
    star starUse = (star) stars.get(i);
    starUse.display();
  }
  
  //game title
  textSize(20);
  fill(255);
  text("DODGE THE BALLS", 300, 770);
  
  //display timer
  startTimer.display();

  //check user life
  checkGame(); 
  
  //run game 
  if(gameState == 0) { //update ball setting to keep user playing
    for (Ball b : bs) {
      b.update();
    }
    player.update();
  }else if (gameState == 1) {  //if gameState equals 1, GAME OVER
    textSize(60);
    text("GAME OVER ! !", 220, 150);
    noLoop();
  }
  
  //winner screen
   if(startTimer.getTime() <= startTimer.stopTime()){
     textSize(60);
     text("YOU WON ! !", 220, 150);
     noLoop();
    } 
  }
  
  //draw life bar on top 
  void drawHealth() {
    fill(232, 44, 12);
    rect(0, 0, player.health, height * 0.05);
  }
  
  //let the bar decrease as user fail to dodge the ball
  void death() {
    for (int i = 0; i < numBalls; i++) {
      if (dist(bs[i].pos.x, bs[i].pos.y, player.pos.x, player.pos.y) < (bs[i].ballSize/2) + (player.meSize/2)) {
        bs[i].resetBall(); //resets ball
        player.health -= 100; //decreases every 100 when ball collides
      }
    }
  }
  
  //if health reaches 0, set gameState to 1
  void checkGame() {
    if (player.health <= 0) {
      gameState = 1;
    }
  }
  
