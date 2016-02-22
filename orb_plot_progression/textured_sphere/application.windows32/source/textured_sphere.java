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

public class textured_sphere extends PApplet {

IJGSphere s;

public void setup(){
  
   s = new IJGSphere(this, new RGBA(120, 120, 120, 255), "stone.jpg", 180, 16, 16);
   noStroke();
}


public void draw() {
  background(0);
  ambientLight(85, 85, 85);
  emissive(30, 0, 0);
  lightSpecular(255, 255, 255);
  pointLight(255, 255, 255, -100, -100, 800);
  pointLight(150, 150, 150, -100, 100, 800);
  specular(255, 255, 255);
  shininess(20);

  pushMatrix();
  translate(width/2, height/2, -1000);
  rotateX(PI/3);
  rotateZ(frameCount*PI/1360);
  scale(1.2f, 1.2f);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2.75f, 0);
  rotateY(frameCount*PI/520);
  rotateX(-frameCount*PI/720);
  s.display();
  popMatrix();
}

public void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      s.setSmooth(true);
    } else if (keyCode == DOWN) {
      s.setSmooth(false);
    }
  }
}
  public void settings() {  size(800, 800, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "textured_sphere" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
