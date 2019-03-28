class Me {
  float meSize;
  private PVector pos;
  private PVector speed;
  private float health;

  Me() {
    meSize = 60; // user cursor size
    pos = new PVector(mouseX, height - (meSize/2)); //user cursor position
    speed = new PVector(2, 0); //user cursor speed
    health = 800; //set constant health duration
  }

//draw user
  void drawMe() {
    fill(color(random(0,255),random(0,255),random(0,255)));
    rect(pos.x, pos.y, meSize, meSize);
  }
  
//if user hits right edge
  boolean hitREdge() { 
    if (pos.x > (width - (meSize/2))) {
      return true;
    } else {
      return false;
    }
  }

//if user hits left edge
  boolean hitLEdge() {
    if (pos.x < (0 + (meSize/2))) {
      return true;
    } else {
      return false;
    }
  }
  
  //user cursor movement
  void move() {
    pos = new PVector(mouseX, height - (meSize/2));
  }

//funtion that computes user movement
  void update() {
    move();
    drawMe();
    drawHealth();
    death();
  }
}
