/*Homework 2_2.pde
Author: Cassandra Liau
Summary: solving sol #56- A square is divided horizontally and vertically into four equal parts, 
each with lines in four directions superimposed progressively.
*/
float x = 0; //horizontal lines
float y = 0; //vertical lines
float z = 0; //left to right diagonal line
float i = 0; //right to left diagonal line
float slant = 100; //how slanted the diagonal lines are 
float spacing = 10; //spacing within each line
void setup(){
  size(1600, 1050);
  background(250);
  stroke(0);
}

void draw(){
  //vertical line across middle of canvas
  line(width/2, 0, width/2, height);
  
  //horizontal lines across half of the canvas
  while(x < height/2){
    line(0, x, width, x);
    x = x + spacing;
  }
  //vertical lines across 1/4 of canvas
  while(y < width/2){
    line(y, 0, y, height/2);
    y = y + spacing;
  }
  //left to right diagonal lines
  while(z < width){
    line(z, height/2, z + slant, height);
    z = z + spacing;
  }
  //right to left diagonal lines
  while(i < width){
    line(i, height, i + slant, height/2);
    i = i + spacing;
  }
  }
