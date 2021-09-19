/*
3D transformations
 https://www.cs.helsinki.fi/group/goa/mallinnus/3dtransf/3drota.htm
 */

//Quad q;

Plane p;
Engine e;

void setup() {
  size(800, 800, P3D);
  //PVector[] verts = new PVector[4];
  //float w = 200;
  //float h = 150;
  //float d = 0;
  //float theta = PI/4;
  //for (int i=0; i<4; i++) {
  //  verts[i] = new PVector(cos(theta)*w, sin(theta)*h, d);
  //  theta += TWO_PI/4;
  //}
  //q = new Quad(verts);
  //Plane(PVector loc, PVector dim, int colSegs, int  rowSegs)
  stroke(8);
  p = new Plane(new PVector(), new PVector(500, 0, 700), 20, 20);
  e = new Engine(p);
  
  frameRate(1);
}


void draw() {
  background(255);
  lights();
  translate(width/2, height/1.5);
 // rotateY(frameCount*PI/180);
 // rotateX(PI/-30);
  //q.draw();
  //q.drawNormal(30);
  // p.draw();
  e.collide();
  e.draw();
}
