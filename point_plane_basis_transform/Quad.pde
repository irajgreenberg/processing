class Quad {
  PVector[] verts;

  Quad(PVector[] verts) {
    this.verts = verts;
  }

  PVector getNormal() {
    PVector u = new PVector();
    PVector v = new PVector();
    PVector.sub(verts[1], verts[0], u);
    PVector.sub(verts[2], verts[0], v);
    return u.cross(v);
  }

  PVector getCentroid() {
    PVector u = new PVector();
    for (int i=0; i<4; i++) {
      u.add(verts[i]);
    }
    return u.div(4);
  }
  

  void draw() {
    beginShape();
     for (int i=0; i<4; i++) {
      vertex(verts[i].x, verts[i].y, verts[i].z);
    }
    endShape(CLOSE);
  }

  void drawNormal(int len) {
    beginShape();
    PVector n = getNormal();
    PVector c = getCentroid();
    n.normalize();
    line(c.x, c.y, c.z, c.x + n.x*len, c.y + n.y*len, c.z+n.z*len);
    endShape();
  }
}
