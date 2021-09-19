class Plane {
  PVector loc;
  PVector dim;
  int colSegs;
  int  rowSegs;

  //internals
  PVector[][] verts;
  PVector[] verts1D;
  Quad[] quads;

  Plane() {
  }

  Plane(PVector loc, PVector dim, int colSegs, int  rowSegs) {
    this.loc = loc;
    this.dim = dim;
    this.colSegs = colSegs; // vertex edges (1 more than gaps)
    this.rowSegs = rowSegs;
    float colGap = dim.x/(this.colSegs-1); // x-axis
    float rowGap = dim.z/(this.rowSegs-1); // z-axis
    verts = new PVector[colSegs][rowSegs];
    quads = new Quad[(colSegs-1)*(rowSegs-1)];
    // println(quads.length);
    for (int i=0, k=0; i<rowSegs; i++) {
      for (int j=0; j<colSegs; j++) {
        verts[i][j] = new PVector(-dim.x/2 + colGap*j, random(-5, 5), -dim.z/2+rowGap*i);
        if (i>0 && j>0) {
          quads[k] = new Quad(new PVector[]{verts[i-1][j-1], verts[i-1][j], verts[i][j], verts[i][j-1]});
          k++;
        }
      }
    }
  }

  void draw() {
    fill(190);
    stroke(100);
    for (Quad q : quads) {
      q.draw();
      q.drawNormal(90);
    }
    for (int i=0; i<rowSegs; i++) {
      for (int j=0; j<colSegs; j++) {
        pushMatrix();
        translate(verts[i][j].x, verts[i][j].y, verts[i][j].z);
        noStroke();
        fill(60, 60, 255);
        sphere(2);
        popMatrix();
      }
    }
  }
}
