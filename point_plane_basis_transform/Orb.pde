class Orb {
  PVector pos, pos_start, spd;
  float r;
  color c = color(255, 45, 25);

  Orb() {
  }

  Orb(float r, PVector pos, PVector spd) {
    this.r = r;
    this.pos = pos;
    this.spd = spd;
    pos_start = new PVector();
    pos_start.set(pos);
  }

  void move() {
    pos.add(spd);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(c);
    sphere(r);
    popMatrix();
  }
  
  void setCol(color c){
    this.c = c;
  }
}
