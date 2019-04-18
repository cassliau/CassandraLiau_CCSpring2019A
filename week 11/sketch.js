/*
Week 11
Author: Cassandra Liau
Summary: Physics Engine
*/

var Engine = Matter.Engine;
var World = Matter.World;
var Bodies = Matter.Bodies;
var Mouse = Matter.Mouse;
var MouseConstraint = Matter.MouseConstraint;
var Composites = Matter.Composites;

var engine;
var balls;
var canvas;
var platform, platform2, platform3;

function setup() {
  canvas = createCanvas(500, 500);

  //create engine
  engine = Engine.create();

  //create and add balls
  balls = Composites.stack(100, 10, 10, 10, 0, 0, function(x, y) {
    return Bodies.circle(x, y, 10);
  });
  World.add(engine.world, [balls]);

  //platform
  platform = Bodies.rectangle(100, height - 100, width/2, 5, {isStatic: true});
  platform2 = Bodies.rectangle(150, height - 350, 100, 5, {isStatic: true, angle: PI/4});
  platform3 = Bodies.rectangle(300, height - 350, 100, 5, {isStatic: true, angle: -PI/4});

  World.add(engine.world, [platform, platform2, platform3]);


  //mouse controls
  var mouse = Mouse.create(canvas.elt);
  var mouseParams = {
    mouse: mouse,
    constraint: {stiffness: 0.5}
  }
  mouseConstraint = MouseConstraint.create(engine, mouseParams);
  mouseConstraint.mouse.pixelRatio = pixelDensity();
  World.add(engine.world, mouseConstraint);

  //run engine
  Engine.run(engine);
}

function draw(){
//draw background
  background(245, 197, 183);

//draw balls
  noStroke();
  fill(255);
  drawBodies(balls.bodies);

//draw platform
  noStroke();
  fill(0);

  drawVertices(platform.vertices);
  drawVertices(platform2.vertices);
  drawVertices(platform3.vertices);


//mouse controls
  drawMouse(mouseConstraint);

}

//function for bodies
function drawBodies(bodies){
  for(var i = 0; i < bodies.length; i++){
    drawVertices(bodies[i].vertices);
  }
}

//function for mouse constraint
function drawMouse(mouseConstraint){
  if(mouseConstraint.body){
    var pos = mouseConstraint.body.position;
    var offset = mouseConstraint.constraint.pointB;
    var m = mouseConstraint.mouse.position;

    stroke(0, 0, 0);
    strokeWeight(1);
    line(pos.x + offset.x, pos.y + offset.y, m.x, m.y);
  }
}

//function for vertices
function drawVertices(vertices){
  beginShape();
  for (var i = 0; i < vertices.length; i++) {
    vertex(vertices[i].x, vertices[i].y);
  }
  endShape(CLOSE);
}
