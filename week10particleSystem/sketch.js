/* WEEK 10 HOMEWORK
Author: Cassandra Liau
Summary: Processing sketch translate from week 6 homework to p5js
 */
 
//particle systems
var ellipseParticle;
var rectParticle;
var mouseParticle;

var Rect = true;
var Ellipse = true;
var stop = false;

//starts at 0
var maxAngle = 0.0;

function setup(){
    createCanvas(1500, 1060);
    background(255);
    
    var origin = new Vector2D (1500/2, 1060/2);

    ellipseParticle = new particleSystem(origin);
    rectParticle = new particleSystem(origin);
    mouseParticle = new particleSystem(new Vector2D(width/2, height/2));
}

function draw(){
    background(255);
    
    //radius 
    var r = 500;

    //x on polar coordinate
    var x = r * cos(maxAngle);

    //y on polar coordinate
    var y = r * sin(maxAngle);

    //new vector for x,y coordinates
    var particleLocation = new Vector2D(x, y);

    /* RECTANGLE */
    if (Rect) {
        rectParticle.position = new Vector2D(width/2, height/2);
        rectParticle.addParticle(particleLocation);
    
        if (!stop) {
          rectParticle.rectCircleRun();
          mouseParticle.ellipseNotCircleRun();
        }
    
        mouseParticle.position = new Vector2D(width/2, height/2);
    
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
          console.log(Ellipse)
          mouseParticle.rectNotCircleRun();
        }
    
        mouseParticle.position = new Vector2D(mouseX, mouseY);
        
        if (frameCount % 4 == 0) {
          mouseParticle.addParticle();
        }
       
      }

    maxAngle += 0.1;
}
