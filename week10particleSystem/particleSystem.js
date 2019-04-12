class particleSystem{
    /* CONSTRUCTOR */
    constructor(position = new Vector2D(0, 0)){
        this.particles = []; //particles of particle system
        this.position = position; //position of the particles
}

    /* PARTICLES FOLLOWING MOUSE */

    //ellipse follows motion of mouse
    ellipseNotCircleRun(){
        for(let i = 0; i < this.particles.length; i++){
            var particleP = this.particles [i];

            particleP.show(); //show circles
            particleP.move(); //move circles 
        
        if(particleP.isDead()){
            this.particles.splice(i,1); //remove particle from array list
        }
        }
    }

    //rectangle follows motion of mouse
    rectNotCircleRun(){
        for(let i = 0; i < this.particles.length; i++){
            var particleP = this.particles [i];

            particleP.show2(); //show circles
            particleP.move(); //move circles 
        
        if(particleP.isDead()){
            this.particles.splice(i,1); //remove particle from array list
        }
        }
    }

    /* PARTICLES AROUND SHAPE */
    
    //rectangle
    rectCircleRun(){
        push();
        translate(this.position.x, this.position.y);
        for(let i = 0; i < this.particles.length; i++){
            var particleP = this.particles[i];
            particleP.show2(); //show circles
            particleP.move(); //move circles
        
        if(particleP.isDead()){
            this.particles.splice(i,1); //remove particle from array list
        }
        }
        pop();
    }

    //ellipse
    ellipseCircleRun(){
        push();
        translate(this.position.x, this.position.y);
        for(let i = 0; i < this.particles.length; i++){
            var particleP = this.particles[i];
            particleP.show(); //show circles
            particleP.move(); //move circles
        
        if(particleP.isDead()){
            this.particles.splice(i,1); //remove particle from array list
        }
        }
        pop();
    }

    /* ADD PARTICLE */
    addParticle(){
        this.particles.push(new Particle(this.position));
    }
    
    /* ADD PARTICLE ACCORDING TO POSITION */
    addParticle(location){
        this.particles.push(new Particle(location));
    }

    /* ADD PARTICLE ACCORDING TO MOUSE */
    addparticleDirection(mX, mY){
        this.mX = mouseX.x;
        this.mY = mouseY.y;

        var direction = new Vector2D(mX,mY);

        direction.norm();
        direction.mult(10);

    }
    
}