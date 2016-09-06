int pts = 4;
PVector[] vs = new PVector[pts];
void setup() {
  size(1000, 800, P3D);
  float t = -PI/pts;
  float r = 200;
  for (int i=0; i<pts; i++) {
    vs[i] = new PVector(cos(t)*r, sin(t)*r, 0);
    float z = cos(23*PI/180)*vs[i].z - sin(23*PI/180)*vs[i].x;
    float y = vs[i].y;
    float x = sin(23*PI/180)*vs[i].z + cos(23*PI/180)*vs[i].x;
    vs[i] = new PVector(x, cos(63*PI/180)*y - sin(63*PI/180)*z, sin(63*PI/180)*y + cos(63*PI/180)*z);
    t += TWO_PI/pts;
  }
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/4, height/2);

  beginShape();
  for (int i=0; i<pts; i++) {
    vertex(vs[i].x, vs[i].y, vs[i].z);
  }
  endShape(CLOSE);
  popMatrix();

  // align poly with axis
  // Step I. calculate local coordinate system as transformed orthogonal basis axes
  // A. use 3 corner vecs to calculate 2 axes (note:, NOT necessarily at right angles)
  PVector locX = PVector.sub(vs[3], vs[0]);
  PVector tempY = PVector.sub(vs[1], vs[0]);
  PVector norm = locX.cross(tempY);
  // 1. cross axes to find 3rd orthogonal axis
  PVector locY = locX.cross(norm);
  // now locX, locY, norm are orthoganal local coordinate axes

  // 2. normalize local x and y axes
  locX.normalize();
  locY.normalize();
  norm.normalize();

  translate(width - width/4, height/2);
  //rotateY(frameCount*PI/180);
  line(vs[0].x, vs[0].y, vs[0].z, vs[0].x + locX.x*100, vs[0].y + locX.y*100, vs[0].z + locX.z*100);
  line(vs[0].x, vs[0].y, vs[0].z, vs[0].x + locY.x*100, vs[0].y + locY.y*100, vs[0].z + locY.z*100);
  line(vs[0].x, vs[0].y, vs[0].z, vs[0].x + norm.x*100, vs[0].y + norm.y*100, vs[0].z + norm.z*100);

  //local_coords = [(dot(p - loc0, locx),  # local X coordinate
  //                 dot(p - loc0, locy))  # local Y coordinate
  //                for p in points]

  beginShape();
  for (int i=0; i<pts; i++) {
    PVector p = new PVector(vs[i].x, vs[i].y, vs[i].z);
    float x = p.sub(vs[0]).dot(locX);
    float y = p.sub(vs[0]).dot(locY);
    
    p.set(vs[0]);
    p.add(locX.mult(x).add(locY.mult(y)));
    
    
    vertex(p.x, p.y, vs[i].z);
  }
  endShape(CLOSE);
}