
class Particle {
  public Vector2D position = new Vector2D(0, 0);
  public Vector2D velocity = new Vector2D(random(-1, 1), random(-1, 1));
  public Vector2D acceleration = new Vector2D(random (-0.05, 0.05), random (-0.05, 0.05));

  public float radius = random (10, 100); 
  public float lifespan = 255;
  public color pColor = color(random(0,255), random(0,255), random(0,255));

  /* CONSTRUCTORS */
    //blank constructor
    public Particle () {
    }
  
    //takes a position vector
    public Particle(Vector2D origin) {
      this.position.x = origin.x;
      this.position.y = origin.y;
    }
  
  /* NON-STATIC */
  
    //move particle
    void move() {
      position.add(velocity);
      velocity.add(acceleration);
      lifespan -= 1.0; //die a little inside
    }
  
    //draw particle
    
      //ellipse
    void show() {
      noStroke();
      fill (pColor, lifespan);
      ellipse(position.x, position.y, radius, radius);
    }
    
      //rectangle
    void show2() {
      noStroke();
      fill (pColor, lifespan); 
      rect(position.x, position.y, radius, radius);
    }
    
  //check if particle is dead
  boolean isDead() {
    return (lifespan < 0.0);
  }
  
}
