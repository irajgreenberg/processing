import processing.core.*;
import java.util.ArrayList;

public class IJGSphere extends Geom3 {

  private float radius;
  private int slices, stacks;
  
  Vertex top, bottom;

  public IJGSphere() {
  }

  public IJGSphere(PApplet p, RGBA col, String tex, float radius, 
    int slices, int stacks) {

    super(p, col, tex);
    this.radius = radius;
    this.slices = slices;
    this.stacks = stacks;

    _init();
  }

  public void _init() {
    verts = new ArrayList<Vertex>();
    inds = new ArrayList<Index>();
    faces = new ArrayList<Face>();

    // verts
    float theta = -p.PI/2.0f;
    top = new Vertex(new PVector(0, -radius, 0), new PVector(), col, new UV(.5f + p.atan2(0, 0)/p.TWO_PI, .5f - p.asin(-1)/p.PI*.1f));
    bottom = new Vertex(new PVector(0, radius, 0), new PVector(), col, new UV(.5f + p.atan2(0, 0)/p.TWO_PI, .5f - p.asin(1)/p.PI*.1f));

    for (int i=0, k=0; i<stacks; i++) {
      float phi = 0.0f;
      float x = p.cos(theta)*radius;
      float y = p.sin(theta)*radius;
      float z = 0;
      for (int j=0; j<slices; j++) {
        float pz = p.cos(phi)*z - p.sin(phi)*x;
        float px = p.sin(phi)*z + p.cos(phi)*x;
        if (i>0 && i< stacks-1) {
          float u = (float)((phi+1.0))*.75f;
          float v = (float)((theta+1.0))*.75f;
          verts.add(new Vertex(new PVector(px, y, pz), new PVector(), col, new UV(u, v)));
        }
        phi += p.TWO_PI/(slices-1);
      }
      theta += p.PI/(stacks-1);
    }

    // faces
    for (int i=0, ii=0; i<stacks-3; i++) {
      for (int j=0; j<slices; j++) {
        int k = i*slices+j;
        int l = (i+1)*slices+j;
        int m = (i+1)*slices+j+1;
        int n = i*slices+j+1;
        // for closing seam
        int o = (i+1)*slices;
        int p = i*slices;

        if (j<slices-1) {
          // top cap
          if (i==0) {
            faces.add(new Face(verts.get(k), top, verts.get(n)));
          }
          // body
          faces.add(new Face(verts.get(k), verts.get(l), verts.get(m)));
          faces.add(new Face(verts.get(k), verts.get(m), verts.get(n)));
          // bottom cap
          if (i==stacks-4) {
            faces.add(new Face(verts.get(m), bottom, verts.get(l)));
          }
        } else {
          // top cap 
          if (i==0) {
            faces.add(new Face(verts.get(k), top, verts.get(p)));
          }
          // body
          faces.add(new Face(verts.get(k), verts.get(l), verts.get(o)));
          faces.add(new Face(verts.get(k), verts.get(o), verts.get(p)));
          // bottom cap 
          if (i==stacks-4) {
            faces.add(new Face(verts.get(o), bottom, verts.get(l)));
          }
        }
      }
    }

    calcVertNorms();
  }
}