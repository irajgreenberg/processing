import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class pie_chart3D extends PApplet {

// Quick 3D Pie Example
// note: values passed to pie must add up to 1.0
// Ira Greenberg
// 2017
Wedge w;
Pie p;
public void setup() {
  
  background(255);
  p = new Pie(new float[]{.04f, .075f, .15f, .2f, .215f, .320f}, 200, 250, color(255, 127, 0));
}

public void draw() {
  background(255);
  lights();
  translate(width/2, height/2);
  rotateY(frameCount*PI/180.0f);
  rotateX(PI/4.5f);
  p.display();
}
class Pie {

  float[] vals;
  float radius;
  float depth;
  int col;
  Wedge[] wedges;

  Pie() {
  }

  Pie(float[] vals, float radius, float depth, int col) {
    this.vals = vals;
    this.radius = radius;
    this.depth = depth;
    this.col = col;
    float r = red(col);
    float g = green(col);
    float b = blue(col);
    wedges = new Wedge[vals.length];

    for (int i=0; i<wedges.length; i++) {
      wedges[i] = new Wedge(vals[i], radius, depth*vals[i], color(r*(vals[i]*wedges.length), g*(vals[i]*wedges.length), b*(vals[i]*wedges.length)));
    }
  }

  public void display() {
    float theta = 0;
    noStroke();
    for (int i=0; i<wedges.length; i++) {
      pushMatrix();
      rotateZ(theta);
      wedges[i].display();
      theta+=vals[i]*TWO_PI;
      popMatrix();
    }
  }
}
class Wedge {
  final int ARC_COUNT = 24;
  final int POINT_COUNT = ARC_COUNT*2 + 2;
  PVector[] vecs = new PVector[POINT_COUNT];
  int[] indices = new int[POINT_COUNT];

  float percent;
  float radius;
  float depth;
  int col;

  Wedge() {
  }

  Wedge(float percent, float radius, float depth, int col) {
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

  public void display() {

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
  public void settings() {  size(1000, 700, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pie_chart3D" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
