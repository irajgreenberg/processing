class Wedge {
  final int ARC_COUNT = 24;
  final int POINT_COUNT = ARC_COUNT*2 + 2;
  PVector[] vecs = new PVector[POINT_COUNT];
  int[] indices = new int[POINT_COUNT];

  float percent;
  float radius;
  float depth;
  color col;

  Wedge() {
  }

  Wedge(float percent, float radius, float depth, color col) {
    this.percent = percent;
    this.radius = radius;
    this.depth = depth;
    this.col = col;

    // vertices for top of wedge arc
    float theta = 0;
    for (int i=0; i<ARC_COUNT; i++) {
      vecs[i] = new PVector(cos(theta)*radius, sin(theta)*radius, 0);
      vecs[ARC_COUNT+i] = new PVector(cos(theta)*radius, sin(theta)*radius, depth);
      theta += TWO_PI/(ARC_COUNT-1)*percent;
    }
    vecs[ARC_COUNT*2] = new PVector(0, 0, depth);
    vecs[ARC_COUNT*2+1] = new PVector(0, 0, 0);
  }

  void display() {

    fill(col);
    // top of wedge
    beginShape();
    for (int i=0; i<ARC_COUNT; i++) {
      vertex(vecs[i].x, vecs[i].y, vecs[i].z);
    }
    vertex(vecs[ARC_COUNT*2+1].x, vecs[ARC_COUNT*2+1].y, vecs[ARC_COUNT*2+1].z);
    endShape(CLOSE);

    // bottem of wedge
    beginShape();
    for (int i=ARC_COUNT; i<ARC_COUNT*2; i++) {
      vertex(vecs[i].x, vecs[i].y, vecs[i].z);
    }
    vertex(vecs[ARC_COUNT*2].x, vecs[ARC_COUNT*2].y, vecs[ARC_COUNT*2].z);
    endShape(CLOSE);

    // right side
    beginShape();
    vertex(vecs[ARC_COUNT-1].x, vecs[ARC_COUNT-1].y, vecs[ARC_COUNT-1].z);
    vertex(vecs[ARC_COUNT*2-1].x, vecs[ARC_COUNT*2-1].y, vecs[ARC_COUNT*2-1].z);
    vertex(vecs[ARC_COUNT*2].x, vecs[ARC_COUNT*2].y, vecs[ARC_COUNT*2].z);
    vertex(vecs[ARC_COUNT*2+1].x, vecs[ARC_COUNT*2+1].y, vecs[ARC_COUNT*2+1].z);
    endShape(CLOSE);

    // left side
    beginShape();
    vertex(vecs[0].x, vecs[0].y, vecs[0].z);
    vertex(vecs[ARC_COUNT].x, vecs[ARC_COUNT].y, vecs[ARC_COUNT].z);
    vertex(vecs[ARC_COUNT*2].x, vecs[ARC_COUNT*2].y, vecs[ARC_COUNT*2].z);
    vertex(vecs[ARC_COUNT*2+1].x, vecs[ARC_COUNT*2+1].y, vecs[ARC_COUNT*2+1].z);
    endShape(CLOSE);

    // arc faces
    for (int i=0; i<ARC_COUNT; i++) {
      beginShape();
      vertex(vecs[i].x, vecs[i].y, vecs[i].z);
      vertex(vecs[ARC_COUNT+i].x, vecs[ARC_COUNT+i].y, vecs[ARC_COUNT+i].z);
      vertex(vecs[ARC_COUNT+i+1].x, vecs[ARC_COUNT+i+1].y, vecs[ARC_COUNT+i+1].z);
      vertex(vecs[i+1].x, vecs[i+1].y, vecs[i+1].z);
      endShape(CLOSE);
    }
  }
}