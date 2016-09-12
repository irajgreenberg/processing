Plane p;

void setup() {
  size(1200, 900, P3D);
  PVector[] vecs = poly3D(4, 210, new PVector(PI/2, PI/5, PI/7));
  p = new Plane(vecs);
  
  PVector x = p.vx;
  PVector y = p.vy;
  PVector z = p.n;
  
  Mat4 m = new Mat4(x, y, z, new PVector());
  m.inv();
  m.mult(p.vecs);
  
  m.inv();
  m.mult(p.vecs);
}


void draw() {
  background(255);
  translate(width/2, height/2);
  //rotateY(frameCount*PI/180*.25);
  //rotateX(frameCount*PI/180*.45);
  noFill();
  p.display();
}

PVector[] poly3D(int sides, float radius, PVector rot) {
  float theta = 0.0;
  PVector[] vecs = new PVector[sides];
  for (int i=0; i<sides; i++) {
    vecs[i] = new PVector(cos(theta)*radius, sin(theta)*radius, 0);
    theta += TWO_PI/sides;

    // y rot
    float x = sin(rot.y)*vecs[i].z + cos(rot.y)*vecs[i].x;
    float y = vecs[i].y;
    float z = cos(rot.y)*vecs[i].z - sin(rot.y)*vecs[i].x;
    vecs[i].x = x; 
    vecs[i].y = y; 
    vecs[i].z = z;

    // x rot
    x = vecs[i].x;
    y = sin(rot.x)*vecs[i].z + cos(rot.x)*vecs[i].y;
    z = cos(rot.x)*vecs[i].z - sin(rot.x)*vecs[i].y;
    vecs[i].x = x; 
    vecs[i].y = y; 
    vecs[i].z = z;

    // z rot
    x = cos(rot.x)*vecs[i].x - sin(rot.x)*vecs[i].y;
    y = sin(rot.x)*vecs[i].x + cos(rot.x)*vecs[i].y;
    z = vecs[i].z;
    vecs[i].x = x; 
    vecs[i].y = y; 
    vecs[i].z = z;
  }
  return vecs;
}