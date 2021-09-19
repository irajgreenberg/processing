class Engine {

  Orb[] orbs;
  Plane p;

  //precalculate orthogonal vectors
  PVector xAxis  = new PVector (1, 0, 0);
  PVector yAxis  = new PVector (0, 1, 0);
  PVector zAxis  = new PVector (0, 0, 1);

  Engine() {
  }

  Engine(Plane p) {
    this.p = p;
  }

  Engine(Orb[] orbs, Plane p) {
    this.orbs = orbs;
    this.p = p;
  }

  void draw() {
    p.draw();
  }

  void collide() {
    for (Quad q : p.quads) {
      PVector n = q.getNormal();
      n.normalize();

      PVector c = q.getCentroid();

      // find thetas of quad normals relative to orthogonal axes
      float theta1 = acos(n.dot(yAxis));
      float theta2 = acos(n.dot(xAxis));

      for (int j=0; j<4; j++) {
        // y-axis
        float z = q.verts[j].z*cos(theta1) - q.verts[j].x*sin(theta1);
        float x = q.verts[j].z*sin(theta1) + q.verts[j].x*cos(theta1);
        float y = q.verts[j].y;

        //Z-axis
        //q.verts[j].x= x*cos(theta2+PI/2) - y*sin(theta2+PI/2);
        //q.verts[j].y = x*sin(theta2+PI/2) + y*sin(theta2+PI/2);
        //q.verts[j].z = z;

        q.verts[j].x= x;
        q.verts[j].y = y;
        q.verts[j].z = z;

       // noLoop();
      }
    }
  }
}
