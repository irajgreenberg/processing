/*
 * Verlet Integration - stable Form
 * Pos  = pos + (pos-posOld)
 * alternative to  x += speed
 */

int particles = 20;
VerletNode[] nodes = new VerletNode[particles];

int bonds = particles + particles/2;
ArrayList<VerletStick>sticks = new ArrayList<VerletStick>();

VerletOrg org;

void setup() {
  size(900, 900, P3D);
  
  org = new VerletOrg(1, 200, color(200, 100, 15), color(1, 100, 200), true);
  float theta = PI/4.0;
  float shapeR = 100;
  float tension = .8;
  // balls
  for (int i=0; i<particles; i++) {
    PVector push = new PVector(1+random(1.6), .2);
    PVector p = new PVector(cos(theta)*shapeR, sin(theta)*shapeR);
    nodes[i] = new VerletNode(p,.2);
    theta += TWO_PI/particles;
  }

  // sticks
  for (int i=0; i<particles; i++) {
    if (i>0) {
      sticks.add(new VerletStick(nodes[i-1], nodes[i], tension, true));
    } 
    if (i==particles-1) {
      sticks.add(new VerletStick(nodes[i], nodes[0], tension, true));
    }
  }

  // internal sticks for stability
  for (int i=particles; i<bonds; i++) {
    if (i%2==0) {
      sticks.add(new VerletStick(nodes[i-particles], nodes[i-particles/2], tension, true));
    }
  }
}

void draw() {
  background(255);
  //fill(255, 10);
  //rect(-1, -1, width+1, height+1);
  
  org.draw();
  strokeWeight(2);
  translate(width/2, height/2);
  stroke(0);
  for (int i=0; i<sticks.size(); i++) {
    sticks.get(i).render();
    sticks.get(i).constrainLen();
  }

  for (int i=0; i<particles; i++) {
    nodes[i].verlet();
    nodes[i].render();
    nodes[i].boundsCollision();
  }
}
