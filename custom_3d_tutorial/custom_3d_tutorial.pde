// 3D Geom Tutorial in Java mode
// Construct a properly lit and textured Toroid
// texture from: http://img09.deviantart.net/5cd4/i/2009/173/9/f/seamless_wall_texture_06_by_caym.jpg

// Ira Greenberg, 2015

// Data Structures
// Vertex: (x, y, z), (nx, ny, nz), (r, g, b, a), (u, v)
// Index: elem0, elem1, elem2
// Face: v0, v1, v2
// Super abstract class Geom3

Toroid t;
void setup() {
  size(800, 600, P3D);
  // PApplet p, PVector pos, RGBA col, float outerRadius, float ringRadius, 
  // int outerDetail, int ringDetail
  t = new Toroid(this, new PVector(width/2, height/2), new RGBA(120, 120, 120, 255), 130, 45, 24, 24);
  noStroke();
}
void draw() {
  background(0);
  lightSpecular(255, 255, 255);
  directionalLight(255, 255, 255, -.25, .25, -1);
  specular(255, 255, 255);
  shininess(8);
  translate(width/2, height/2);
  rotateY(frameCount*PI/720);
  rotateX(-frameCount*PI/720);
  t.display();
}