float EPSILON = 0.0000001;
//boolean rayIntersectsTriangle(PVector rayOrigin, PVector rayVector, Triangle inTriangle, PVector outIntersectionPoint) {

PVector p, p_Origin;
PVector spd;
Triangle t;
PVector outIntersectionPoint;
MollerTrumbore mt;
int ORBS = 10000;
Orb[] orbs = new Orb[ORBS];

void setup() {
  size(1024, 768, P3D);
  sphereDetail(2);
  //frameRate(24);
  for (int i=0; i<ORBS; i++) {
    orbs[i] = new Orb(5, new PVector(random(180, 240), random(-230, -180), random(-230, -180)), new PVector(random(-4.9, -2.3), random(1.5, 3.1), random(2.25, 3.75)));
  }

  t = new Triangle(new PVector(cos(0)*200, sin(0)*200, 0), new PVector(cos(TWO_PI/3)*200, sin(TWO_PI/3)*200, 0), new PVector(cos(TWO_PI/3*2)*200, sin(TWO_PI/3*2)*200, 0));
  println(t.getCentroid());
  outIntersectionPoint = new PVector();

  mt = new MollerTrumbore();
}


void draw() {
  background(255);
  translate(width/2, height/2);
  //rotateY(PI/2+frameCount*PI/360);
  rotateY(mouseX*PI/180);
  t.draw();

  for (int i=0; i<ORBS; i++) {
  // pushMatrix();
   // translate( orbs[i].pos.x, orbs[i].pos.y, orbs[i].pos.z);
    orbs[i].move();
    orbs[i].draw();
   
    if (mt.rayIntersectsTriangle(orbs[i].pos_start, orbs[i].pos, t, outIntersectionPoint)) {
      orbs[i].setCol(color(0, 45, 255));
      orbs[i].spd.mult(0);
    }
   //  popMatrix();
  }
}
