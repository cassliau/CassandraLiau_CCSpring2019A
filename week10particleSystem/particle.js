class Particle{
    /* CONSTRUCTOR */
    constructor(vecPos = new Vector2D(0,0), vel = new Vector2D(random(-1, 1), random(-1, 1)), accel = new Vector2D(random (-0.05, 0.05), random (-0.05, 0.05)),pcolor = color(random(255),random(255),random(255))){
    this.position = vecPos;
    this.velocity = vel;
    this.accerleration = accel;
    this.radius = random (10, 100); 
    this.lifespan = 255;
    this.color = pcolor;
    }
    
    //move particle
    move(){
        this.position.add(this.velocity); //add velocity to position
        this.velocity.add(this.accerleration); //add accerleration to velocity
        this.lifespan -= 1.0; //decrease lifespan

    }

    //draw particle

    show(){
        //draw ellipse
        noStroke; //no stroke 
        var c = color (random(255),random(255),random(255), this.lifespan);
        fill (c); //fill color and give a lifespan
        ellipse(this.position.x, this.position.y, this.radius, this.radius);
    }

    show2(){
        //draw rectangle
        noStroke; //no stroke 
        var c = color (random(255),random(255),random(255), this.lifespan);
        fill (c); //fill color and give a lifespan
        rect(this.position.x, this.position.y, this.radius, this.radius);

    }
    
    //check if particle is dead
    isDead(){
        return this.lifespan < 0.0;

    }
}