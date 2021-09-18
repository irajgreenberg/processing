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
    this.colSegs = colSegs;
    this.rowSegs = rowSegs;
    float colGap = dim.x/this.colSegs;
    float rowGap = dim.z/this.rowSegs;
    verts = new PVector[colSegs+1][rowSegs+1];
    for (int i=0; i<=rowSegs; i++) {
      for (int j=0; j<=colSegs; j++) {
        verts[i][j] = new PVector(-dim.x/2+colGap*j, 0, -dim.z/2+rowGap*i);
      }
    }
  }

  void draw() {
    for (int i=0; i<=rowSegs; i++) {
      for (int j=0; j<=colSegs; j++) {
        pushMatrix();
        translate(verts[i][j].x, verts[i][j].y, verts[i][j].z);
        sphere(2);
        popMatrix();
      }
    }
  }
}
