class Particle {
  PVector loc, spd;
  float r = 4;

  Particle() {
  }

  Particle(PVector loc, PVector spd) {
    this.loc = loc;
    this.spd = spd;
  }

  void move() {
    loc.add(spd);
  }

  void draw() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    sphere(r);
    popMatrix();
  }
}