/*
3D transformations
https://www.cs.helsinki.fi/group/goa/mallinnus/3dtransf/3drota.htm
*/

Quad q;

void setup() {
  size(800, 800, P3D);
  PVector[] verts = new PVector[4];
  float w = 200;
  float h = 150;
  float d = 0;
  float theta = PI/4;
  for (int i=0; i<4; i++) {
    verts[i] = new PVector(cos(theta)*w, sin(theta)*h, d);
    theta += TWO_PI/4;
  }
  q = new Quad(verts);
}


void draw() {
  background(255);
  translate(width/2, height/2);
  q.draw();
  q.drawNormal(30);
}
