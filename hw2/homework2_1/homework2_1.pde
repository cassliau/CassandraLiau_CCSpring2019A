/*Homework2.1.pde
Author: Cassandra Liau
Summary: solving sol #17- Four-part drawing with a different line direction in each part.
*/
//assign floats to 4 sections with different direction of line
float x = 0; //section 1
float y = 0; //section 2
float z = 0; //section 3
float i = 0; //section 4
float slant = 100; //how slant the diagonal line is
float spacing = 20; //spacing of each line

void setup(){
  size(1600, 1050);
  background(250);
  stroke(0);
}

void draw(){
  //section 1: vertical lines
while(x < width/4){
  line(x, 0, x, height);
  x = x + spacing;
}
  //section 2: horizontal lines
while(y < height){
  line(width/4, y, width/2, y);
  y = y + spacing;      
}
  //section 3: left to right diagonal lines
while(z < 3*width/4){
  line(width/2, z, 3*width/4, z+slant);
  z = z + spacing;
}
  //section 4: left to right diagonal lines
while(i < 4*width/4){
  line(width, i, 3*width/4, i+slant);
  i = i + spacing;
}
}
