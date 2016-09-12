class Plane {
  PVector[] vecs;
  PVector c, n, vx, vy;
  float normLen = 225.0;

  Plane() {
  }

  Plane(PVector[] vecs) {
    this.vecs = vecs;
    _init();
  }

  void _init() {

    vx = new PVector();
    vx.set(vecs[1]);

    PVector tempY = new PVector();
    tempY.set(vecs[2]);

    vx.sub(vecs[0]);
    tempY.sub(vecs[0]);
    
    vx.normalize();
    tempY.normalize();

    // centroid
    c = new PVector();
    for (int i=0; i<vecs.length; ++i) {
      c.x += vecs[i].x;
      c.y += vecs[i].y;
      c.z += vecs[i].z;
    }
    c.normalize();

    n = vx.cross(tempY);  
    n.normalize();
    vy = vx.cross(n);
    
    // basis  = vx, vy, norm
  }

  void display() {
   
    // draw plane
    stroke(0, 0, 255);
    beginShape();
    for (int i=0; i<vecs.length; ++i) {
      vertex(vecs[i].x, vecs[i].y, vecs[i].z);
    }
    endShape(CLOSE);

    //draw basis normal
    stroke(200, 160, 30);
    beginShape(LINES);
    
    stroke(255, 0, 0);
    vertex(c.x, c.y, c.z);
    vertex(c.x+n.x*normLen, c.y+n.y*normLen, c.z+n.z*normLen);
    
    vertex(c.x, c.y, c.z);
    vertex(c.x+vx.x*normLen, c.y+vx.y*normLen, c.z+vx.z*normLen);
    
    vertex(c.x, c.y, c.z);
    vertex(c.x+vy.x*normLen, c.y+vy.y*normLen, c.z+vy.z*normLen);
    endShape();

  }
}