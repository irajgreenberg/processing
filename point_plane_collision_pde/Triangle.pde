class Triangle {
  
  PVector v0;
  PVector v1;
  PVector v2;
  
  PVector[] unitizedVerts = new PVector[3];
  
PVector offset;
  Triangle() {
  }
  
  Triangle(PVector v0, PVector v1, PVector v2) {
    this.v0 = v0;
    this.v1 = v1;
    this.v2 = v2;
    
    //PVector max = new PVector(0,0,0);
    //max.x = max(v0.x, v1.x, v2.x);
    //max.y = max(v0.y, v1.y, v2.y);
    //max.z = max(v0.z, v1.z, v2.z);
    offset = getCentroid();
    
   // unitizedVerts[0] = new PVector(v0.div(max).sub(offset));
  }
  PVector getCentroid(){
    PVector c = new PVector(0,0,0);
    c.set(v0);
    c.add(v1);
    c.add(v2);
    c.div(3);
    return c;
  }
    
  void draw(){
    fill(145);
    beginShape();
    translate(offset.x, offset.y, offset.z);
    vertex(v0.x-offset.x, v0.y-offset.y, v0.z-offset.z);
    vertex(v1.x-offset.x, v1.y-offset.y, v1.z-offset.z);
    vertex(v2.x-offset.x, v2.y-offset.y, v2.z-offset.z);
    endShape(CLOSE);
  }
}
