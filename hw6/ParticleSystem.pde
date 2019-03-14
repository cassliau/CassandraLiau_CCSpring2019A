
class ParticleSystem {
  /* FIELDS */
  //particles of the system
    public ArrayList <Particle> particles = new ArrayList<Particle>();
  //position of particles
    public Vector2D position = new Vector2D(0, 0);
  
  /* CONSTRUCTORS */
  //blank 
    public ParticleSystem() {
    }
  //positions the particle system on vector
    public ParticleSystem(Vector2D o) {
      position.x = o.x;
      position.y = o.y;
    }
    
    public ParticleSystem (float x, float y) {
    position.x = x;
    position.y = y;
  }
    
//make shape following mouse
  public void ellipseNonCircleRun() {

    for (int i = 0; i < particles.size(); i++) {
      Particle p  = particles.get(i);

      p.show();
      p.move();

      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  public void rectNonCircleRun() {

    for (int i = 0; i < particles.size(); i++) {
      Particle p  = particles.get(i);

      p.show2();
      p.move();

      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
//make particles appear around shape
  public void rectCircleRun() {
    pushMatrix();
    translate(position.x, position.y);
    for (int i = 0; i < particles.size(); i++) {
      Particle p  = particles.get(i);

      p.show2();
      p.move();

      if (p.isDead()) {
        particles.remove(i);
      }
    }
    popMatrix();
  }

  public void ellipseCircleRun() {
    pushMatrix();
    
      translate(position.x, position.y);
      for (int i = 0; i < particles.size(); i++) {
        Particle p  = particles.get(i);
  
        p.show();
        p.move();
  
        if (p.isDead()) {
          particles.remove(i);
        }
      }
    popMatrix();
  }

  //draw more particles
  public void addParticle() {
    particles.add(new Particle(position));
  }
  
  
  //add another version of the add Particle which takes position relative to the center and polar 
  public void addParticle(Vector2D location) {
    //add the particle to the location relative to the origin
    particles.add(new Particle(location)); 
  }
  
 //particle direction depending on the mouse
  public void addParticleDirection(float mX, float mY){
    mX = mouseX - position.x;
    mY = mouseY - position.y;
    
    Vector2D direction = new Vector2D (mX, mY);
    
    direction.norm();
    direction.mult(10);
  }
}
