
/*
Class.pde
Author: Cassandra Liau
Summary: first homework assignment- recreating https://artsandculture.google.com/asset/lozenge-composition-with-yellow-black-blue-red-and-gray/hwEjfk4TcjZwgQ
*/

void setup(){
  size(800,800);
  background(217,221,224);
  
  stroke(0);
  strokeWeight(6);
  quad(400, 0, 800, 400, 400, 800, 0, 400);
  
  fill(217,221,224);
  beginShape();
    vertex(400,10);
    vertex(790,400);
    vertex(400,790);
    vertex(10,400);
  endShape(CLOSE);
  
  fill(76,71,68);
  noStroke();
  rect(353, 60, 90, 7);
  rect(40, 380, 735, 7);
  rect(260, 640, 280, 7);
  rect(300, 120, 7, 565);
  rect(160, 380, 7, 160);
  rect(640, 265, 7, 277);
  
  fill(240,219,120);
    beginShape();
      vertex(300, 380);
      vertex(300, 113);
      vertex(40, 380);
    endShape(CLOSE);
  fill(0);
  rect(167,387, 133, 143);
  fill(13,46,150);
    beginShape();
      vertex(647, 387);
      vertex(780, 387);
      vertex(790, 400);
      vertex(647, 540);
    endShape(CLOSE);
  fill(233,111,72);
    beginShape();
      vertex(260, 647);
      vertex(300, 647);
      vertex(300, 690);
    endShape(CLOSE);
  
  noFill();
  stroke(190,187,174);
  strokeWeight(7);
  beginShape();
    vertex(400,10);
    vertex(790,400);
    vertex(400,790);
    vertex(10,400);
  endShape(CLOSE);
}
