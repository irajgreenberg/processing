Poly p;
int partCount = 100;
Particle[] particles = new Particle[partCount];

void setup() {
  size(1400, 1000, P3D);
  float theta = 0;
  float r = 0.0;
  int ptCount = 9;
  PVector[] vecs = new PVector[ptCount];
  for (int i=0; i<vecs.length; i++) {
    r = random(195, 255);
    vecs[i] = new PVector(cos(theta)*r, sin(theta)*r, 0);
    theta += TWO_PI/ptCount;
  }
  p = new Poly(vecs);

  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle(new PVector(width, height, 400), 
      new PVector(random(-7.2, -4.45), random(-4.85, -4.15), random(-1.84, -1.75)));
  }
}

void draw() {
  background(255);
  fill(200, 200, 175);
  translate(width/2, height/2);
  //rotateY(frameCount*PI/680);
  //rotateX(-frameCount*PI/580);
  rotateY(135*PI/680);
  rotateX(-65*PI/580);
  p.draw(true);

  for (int i=0; i<particles.length; i++) {
    particles[i].move();
    particles[i].draw();
  }
}