import processing.core.*;
import java.util.ArrayList;

public class Toroid extends Geom3 {

  private float outerRadius, ringRadius;
  private int outerDetail, ringDetail;

  PImage tex;

  public Toroid() {
  }

  public Toroid(PApplet p, PVector pos, RGBA col, float outerRadius, 
    float ringRadius, int outerDetail, int ringDetail) {

    super(p, pos, col);
    this.outerRadius = outerRadius;
    this.ringRadius = ringRadius;
    this.outerDetail = outerDetail;
    this.ringDetail = ringDetail;

    _init();
  }

  public void _init() {

    tex = p.loadImage("stone.jpg");

    verts = new ArrayList<Vertex>();
    inds = new ArrayList<Index>();
    faces = new ArrayList<Face>();


    // verts
    float theta = 0.0f;
    for (int i=0; i<ringDetail; i++) {
      float phi = 0.0f;
      float x = outerRadius + p.cos(theta)*ringRadius;
      float y = p.sin(theta)*ringRadius;
      float z = 0;
      for (int j=0; j<outerDetail; j++) {
        float pz = - p.sin(phi)*x;
        float px = p.cos(phi)*x;

        // vertices
        verts.add(new Vertex(new PVector(px, y, pz), new PVector(), col, new UV((float)((theta+1.0))*.75f, (float)((phi+1.0))*1.35f)));
        // overlap 1st and last pt to avoid seams
        phi += p.TWO_PI/(outerDetail-1);
      }
      // overlap 1st and last pt to avoid seams
      theta += p.TWO_PI/(ringDetail-1);
    }

    // indices
    for (int i=0; i<ringDetail; i++) {
      for (int j=0; j<outerDetail; j++) {
        int k0 = i*outerDetail + j;
        int k1 = (i+1)*outerDetail + j;
        int k2 = (i+1)*outerDetail + j+1;
        int k3 = i*outerDetail + j+1;
        if (i<ringDetail-1 && j<outerDetail-1) {
          // tri 1
          inds.add(new Index(k0, k1, k2));
          // tri 2
          inds.add(new Index(k0, k2, k3));
        }
      }
    }

    // faces
    for (Index i : inds) {
      faces.add(new Face(verts.get(i.getElem0()), verts.get(i.getElem1()), verts.get(i.getElem2())));
    }
  }

  public void display() {
    p.fill(col.r, col.g, col.b, col.a);
    p.beginShape(p.TRIANGLES);
    p.textureMode(p.NORMAL);
    p.textureWrap(p.REPEAT);
    p.texture(tex);
    for (Face f : faces) {
      // p.normal(f.getNorm().x, f.getNorm().y, f.getNorm().z);
      p.vertex(f.getV0().pos.x, f.getV0().pos.y, f.getV0().pos.z, f.getV0().uv.v, f.getV0().uv.u);
      // p.normal(f.getNorm().x, f.getNorm().y, f.getNorm().z);
      p.vertex(f.getV1().pos.x, f.getV1().pos.y, f.getV1().pos.z, f.getV1().uv.v, f.getV1().uv.u);
      // p.normal(f.getNorm().x, f.getNorm().y, f.getNorm().z);
      p.vertex(f.getV2().pos.x, f.getV2().pos.y, f.getV2().pos.z, f.getV2().uv.v, f.getV2().uv.u);
    }
    p.endShape();
  }
}