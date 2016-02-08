import processing.core.*;
//import java.awt.Color;

public class Planet {
  public PVector loc;
  public float radius;
  //public Color col, origCol; 
  public int id;
  public String composition, textureURL;
  public PApplet p;
  IJGSphere s;


  public Planet() {
  }

  public Planet(PApplet p, PVector loc, float radius, int id, String composition) {
    this.p = p;
    this.loc = loc;
    this.radius = radius;
    //origCol = this.col = col;
    this.id = id;
    this.composition = composition;
    textureURL = composition+".jpg";

    s = new IJGSphere(this.p, new RGBA(120, 120, 120, 255), textureURL, radius, 16, 16);
    
    // enable vertex normals for smoohing
    s.setSmooth(true);
  }

  public void display() {
    //p.fill(col.getRed(), col.getGreen(), col.getBlue());
    p.pushMatrix();
   // p.translate(loc.x, loc.y, loc.z);
    //p.sphere(radius);
    s.display();
    p.popMatrix();
  }

  public boolean isHit() {
    if (p.dist(p.mouseX, p.mouseY, loc.x, loc.y) < radius) {
      return true;
    } 
    return false;
  }

  //public void resetCol() {
  //  col = origCol;
  //}
}