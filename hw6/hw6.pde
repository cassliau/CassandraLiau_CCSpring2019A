/*hw6.pde
Author: Cassandra Liau
Summary: Bird sketch with particles bursting from mouse in circular motion*/

ParticleSystem ellipseParticle;
ParticleSystem rectParticle;
ParticleSystem mouseParticle;

boolean Rect = true;
boolean Ellipse = true;
boolean stop = false;

float maxAngle = 0.0; //starts at 0;

void setup(){
  size(1600, 1050);
  background(255);
  
  Vector2D origin = new Vector2D (width/2, height/2);

  ellipseParticle = new ParticleSystem (origin);
  rectParticle = new ParticleSystem (origin);
  mouseParticle = new ParticleSystem (new Vector2D(width/2, height/2));
}

void draw(){
  background(255);
  bird();
  
  //radius
  float r = 500; 
  //x on polar coordinate
  float x = r * cos(maxAngle); 
  //y on polar coordinate
  float y = r * sin(maxAngle); 

  //new vector to the computed in x,y coordinates
  Vector2D particleLocation = new Vector2D(x, y); 
  
  /* RECTANGLE */
  if (Rect) {
    rectParticle.position = new Vector2D(width/2, height/2);
    rectParticle.addParticle(particleLocation);

    if (!stop) {
      rectParticle.rectCircleRun();
      mouseParticle.ellipseNonCircleRun();
    }

    mouseParticle.position = new Vector2D(mouseX, mouseY);

    if (frameCount % 4 == 0) {
      mouseParticle.addParticle();
    }
  }
  
  /* ELLIPSE */
  if (Ellipse) {

    ellipseParticle.position = new Vector2D(width/2, height/2);
    ellipseParticle.addParticle(particleLocation);
    
    if (!stop) {
      ellipseParticle.ellipseCircleRun();
      mouseParticle.rectNonCircleRun();
    }

    mouseParticle.position = new Vector2D(mouseX, mouseY);
    
    if (frameCount % 4 == 0) {
      mouseParticle.addParticle();
    }
   
  }
  
  maxAngle += 0.1;
  
}
