import processing.core.*;
import java.util.ArrayList;

public abstract class Geom3 {
  protected PApplet p;
  protected PVector pos;
  protected RGBA col;
  
  protected ArrayList<Vertex> verts;
  protected ArrayList<Index> inds;
  protected ArrayList<Face> faces;
  
  public Geom3() {
  }
  
  public Geom3(PApplet p, PVector pos, RGBA col) {
    this.p = p;
    this.pos = pos;
    this.col = col;
  }
  
  protected abstract void _init();
  protected abstract void display();
}