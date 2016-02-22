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

public class spherePlot001 extends PApplet {

/*
Sphere Plot 001 - Procedural plot
No data
*/

int orbCount = 700;
PVector[] orbs = new PVector[orbCount];
float[]radii = new float[orbCount];
int[]cols = new int[orbCount]; 

public void setup() {
  
  noStroke();
  
  for (int i=0; i<orbs.length; i++) {
    // start all orbsin the middle
    orbs[i] = new PVector(width/2, height/2);
    radii[i] = random(4, 15);
    // color based on radius size
    cols[i] = color(225-radii[i]*radii[i], abs(sin(i*PI/180)*radii[i]*radii[i]), abs(cos(i*PI/180)*radii[i]+175), 255);
  }
}

public void draw() {
  background(25);
  for (int i=0; i<orbs.length; i++) {
    // draw orbs 
    fill(cols[i]);
    pushMatrix();
    translate(orbs[i].x, orbs[i].y);
    ellipse(0, 0, radii[i]*2, radii[i]*2);
    popMatrix();

    // orb-orb collision
    for (int j=1+1; j<orbs.length; j++) {
      float r2 =  radii[i] + radii[j];
      float d = dist(orbs[i].x, orbs[i].y, orbs[j].x, orbs[j].y);
      if (d < r2) {
        if (d==0) { // avoid dist of 0
          orbs[i].add(new PVector(random(-.1f, .1f), random(-.1f, .1f)));
        }
        PVector axis = PVector.sub(orbs[i], orbs[j]);
        float m = axis.mag();
        float m2 =  radii[i] + radii[j] - m;
        axis.normalize();
        PVector temp = new PVector();
        temp.set(orbs[i]);
        orbs[i].x = orbs[j].x + axis.x*r2;
        orbs[i].y = orbs[j].y + axis.y*r2;
        orbs[j].x = temp.x - axis.x*r2;
        orbs[j].y = temp.y - axis.y*r2;
      }
    }

    // boundary collison
    if (orbs[i].x > width-radii[i]) {
      orbs[i].x = width-radii[i];
    } else if (orbs[i].x < radii[i]) {
      orbs[i].x = radii[i];
    } 

    if (orbs[i].y > height-radii[i]) {
      orbs[i].y = height-radii[i];
    } else if (orbs[i].y < radii[i]) {
      orbs[i].y = radii[i];
    }
  }
}
  public void settings() {  size(700, 700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "spherePlot001" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
