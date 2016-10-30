class Poly {
  PVector[] vecs;
  PVector ctr, edge1, edge2;
  float normLen = 150;

  Poly() {
  }

  Poly(PVector[] vecs) {
    this.vecs = vecs;
    ctr = new PVector();
    for (int i=0; i<vecs.length; i++) {
      ctr.x += vecs[i].x;
      ctr.y += vecs[i].y;
      ctr.z += vecs[i].z;
    }
    ctr.div(vecs.length);
    edge1 = PVector.sub(vecs[1], vecs[0]);
    edge2 = PVector.sub(vecs[2], vecs[0]);
  }

  PVector norm() {
    PVector n = edge1.cross(edge2);
    return n.normalize();
  }

  void draw() {
    beginShape();
    for (int i=0; i<vecs.length; i++) {
      vertex(vecs[i].x, vecs[i].y, vecs[i].z);
    }
    endShape(CLOSE);
  }

  void draw(boolean showNormal) {
    noStroke();
    draw();
    stroke(255, 127, 0);
    strokeWeight(4);
    if (showNormal) {
      PVector n = norm();
      line(ctr.x, ctr.y, ctr.z, ctr.x+n.x*normLen, ctr.y+n.y*normLen, ctr.z+n.z*normLen);
    }
  }
}