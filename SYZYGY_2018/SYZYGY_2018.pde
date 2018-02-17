import java.awt.Color;

PVector[] vecs = new PVector[900];
PVector[] rotAngs = new PVector[900];
PVector[] rots = new PVector[900];
Color[] cols = new Color[900];
void setup() {
  sphereDetail(5);
  size(1800, 950, P3D);
  for (int i=0; i<vecs.length; i++) {
    vecs[i] = new PVector(random(-700, 700), random(-400, 400), random(-300, 300));
    rotAngs[i] = new PVector(random(-PI/90, PI/90), random(-PI/90, PI/90), random(-PI/90, PI/90));
    rots[i] = new PVector();
    cols[i] = new Color((int)random(255), (int)random(255), (int)random(255), 20);
  }
  stroke(200, 90);
}

void draw() {
  background(50);
  translate(width/2, height/2);
  for (int i=0; i<vecs.length; i++) {
    pushMatrix();
    translate(vecs[i].x, vecs[i].y, vecs[i].z);
    rotateX(rots[i].x);
    rotateY(rots[i].y);
    rotateZ(rots[i].z);
    fill(cols[i].getRed(), cols[i].getGreen(), cols[i].getBlue(), 20);
    sphere(20);
    popMatrix();
    rots[i].add(rotAngs[i]);
  }
}