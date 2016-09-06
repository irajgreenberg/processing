PVector[] vs = new PVector[4];
void setup() {
  size(1000, 800, P3D);
  float t = -PI/4.0;
  float r = 200;
  for (int i=0; i<4; i++) {
    vs[i] = new PVector(cos(t)*r, sin(t)*r, 0);
    float z = cos(23*PI/180)*vs[i].z - sin(23*PI/180)*vs[i].x;
    float y = vs[i].y;
    float x = sin(23*PI/180)*vs[i].z + cos(23*PI/180)*vs[i].x;
    vs[i] = new PVector(x, cos(63*PI/180)*y - sin(63*PI/180)*z, sin(63*PI/180)*y + cos(63*PI/180)*z);
    t += TWO_PI/4.0;
  }
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/4, height/2);

  beginShape();
  for (int i=0; i<4; i++) {
    vertex(vs[i].x, vs[i].y, vs[i].z);
  }
  endShape(CLOSE);
  popMatrix();

  // align poly with axis
  // Step I. calculate local coordinate system as transformed orthogonal basis axes
  // A. use 3 corner vecs to calculate 2 axes (note:, NOT necessarily at right angles)
  PVector locX = new PVector(vs[2].x-vs[0].x, vs[2].y-vs[0].y, vs[2].z-vs[0].z);
  PVector tempY = new PVector(vs[1].x-vs[0].x, vs[1].y-vs[0].y, vs[1].z-vs[0].z);
  PVector norm = locX.cross(tempY);
  // 1. cross axes to fine 3rd axis
  PVector locY = locX.cross(norm);
  // now locX, locY, norm are orthoganal local coordinate axes

  // 2. normalize local x and y axes
  locX.normalize();
  locY.normalize();
  norm.normalize();



  // 2. 


  translate(width - width/4, height/2);
  rotateY(frameCount*PI/180);
  line(vs[0].x, vs[0].y, vs[0].z, vs[0].x + locX.x*100, vs[0].y + locX.y*100, vs[0].z + locX.z*100);
  line(vs[0].x, vs[0].y, vs[0].z, vs[0].x + locY.x*100, vs[0].y + locY.y*100, vs[0].z + locY.z*100);
  line(vs[0].x, vs[0].y, vs[0].z, vs[0].x + norm.x*100, vs[0].y + norm.y*100, vs[0].z + norm.z*100);



  beginShape();
  for (int i=0; i<4; i++) {
    vertex(vs[i].x, vs[i].y, vs[i].z);
  }
  endShape(CLOSE);
}