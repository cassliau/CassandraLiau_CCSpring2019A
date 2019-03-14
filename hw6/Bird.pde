
//global variables
  float x = width/2;
  float y = height/2;
  int w = 500;
  int h = 500;
  
  //bird colors
  color bodyColor = color(230, 255, 253);
  color beakColor = color(92, 179, 150);
 
void bird(){
        //center rectangle
      rectMode(CENTER);
      stroke(0);
    //translate shape
    pushMatrix();
      translate(width/2, height/2);
      //draw bird's body
      fill(bodyColor);
      rect(x, y, w, h);
      //eyes
      fill(0);
      noStroke();
      ellipse(x - 200, y - 200, 40, 40);   
      //wings
      rotate(5*PI/3);
      noFill();
      stroke(0);
      arc(50, 140, 100, 100, 0, PI);
      rotate(PI/2);
      arc(0 + 90, 0, 100, 100, 0, PI);
      rotate(PI);
      arc(-90, 100, 100, 100, 0, PI);
    popMatrix();
      //feet
        //leg 1
        beginShape();
          vertex(width/2 - 50, height/2 + 300);
          vertex(width/2 - 100, height/2 + 350);
        endShape();
        //leg 2
        beginShape();
          vertex(width/2 + 200, height/2 + 300);
          vertex(width/2 + 250, height/2 + 350);
          endShape();
        //beak
        fill(beakColor);
        triangle(x + width/3, y + height/3, x + width/3, height/3 - 24, width/3 - 24, height/3 - 24); 
}
