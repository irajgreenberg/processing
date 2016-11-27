Poly p;
int partCount = 200;
Particle[] particles = new Particle[partCount];

void setup() {
  size(1400, 1000, P3D);
  float theta = 0;
  float r = 0.0;
  int ptCount = 9;
  PVector[] vecs = new PVector[ptCount];
  for (int i=0; i<vecs.length; i++) {
    r = random(195, 255);

    // rotate points
    float ry = 135*PI/680;
    float rx = -65*PI/580;

    // around z-axis
    float x = cos(theta)*r;
    float y = sin(theta)*r;
    float z = 0;

    // y-axis
    float _z = cos(ry)*z-sin(ry)*x;
    float _x = sin(ry)*z+cos(ry)*x;
    float _y = y;

    // x-axis
    y = cos(rx)*_y-sin(rx)*_z;
    z = sin(rx)*_y+cos(rx)*_z;
    x = _x;

    vecs[i] = new PVector(x, y, z);
    theta += TWO_PI/ptCount;
  }
  p = new Poly(vecs);
  float boost = 1.5;
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle(new PVector(width/2, height/2, 200), 
    new PVector(random(-17.2*boost, -4.45*boost), random(-4.85*boost, -4.15*boost), random(-1.84*boost, -1.75*boost)));
  }
}

void draw() {
  background(255);
  fill(200, 200, 175);
  translate(width/2, height/2, -500);
  p.draw(true);

  for (int i=0; i<particles.length; i++) {
    particles[i].move();
    particles[i].draw();
    checkCollision( particles[i]);
  }
}

void checkCollision(Particle pt) {
  PVector r = new PVector();
  r.set(pt.loc);
  r.normalize();

  if (p.norm().dot(r) < 0) {
    pt.spd.mult(0);
  }
}

