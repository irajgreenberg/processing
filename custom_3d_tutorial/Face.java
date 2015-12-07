import processing.core.*;

public class Face {
  private Vertex v0, v1, v2;

  public Face() {
  }
  
  public Face(Vertex v0, Vertex v1, Vertex v2) {
    this.v0 = v0;
    this.v1 = v1;
    this.v2 = v2;
  }
  
  public Vertex getV0() {
    return v0;
  }
  
  public Vertex getV1() {
    return v1;
  }
  
  public Vertex getV2() {
    return v2;
  }

  public void setV0(Vertex v0) {
    this.v0 = v0;
  }
  
  public void setV1(Vertex v1) {
    this.v1 = v1;
  }
  
  public void setV2(Vertex v2) {
    this.v2 = v2;
  }

  public PVector getNorm() {

    // clone v1
    PVector a = new PVector();
    a.set(v1.pos);

    // clone v2
    PVector b = new PVector();
    b.set(v2.pos);

    // make a and b relative to v0
    a.sub(v0.pos);
    b.sub(v0.pos);

    // make unit len
    a.normalize();
    b.normalize();

    // return surface normal
    return a.cross(b);
  }
}