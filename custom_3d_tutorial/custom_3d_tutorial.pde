// 3D Geom Tutorial in Java mode
// Construct a lit and textured smooth Toroid
// texture from: http://img09.deviantart.net/5cd4/i/2009/173/9/f/seamless_wall_texture_06_by_caym.jpg

// Ira Greenberg, 2015

/*** Data Structures ***/
// Vertex: PVector(x, y, z), PVector(nx, ny, nz), RGBA(r, g, b, a), UV(u, v)
// Index: elem0, elem1, elem2
// Face: v0, v1, v2
// abstract Geom3

/*** Instructions ***/
// Up arrow for smooth render
// Down arrow for faceted render (default)

Toroid t;

void setup() {
  size(800, 600, P3D);
  t = new Toroid(this, new RGBA(120, 120, 120, 255), "stone.jpg", 130, 45, 18, 18);
  noStroke();
}
void draw() {
  background(0);
  ambientLight(85, 85, 85);
  emissive(30, 0, 0);
  lightSpecular(255, 255, 255);
  pointLight(255, 255, 255, -100, -100, 800);
  pointLight(150, 150, 150, -100, 100, 800);
  specular(255, 255, 255);
  shininess(20);
  translate(width/2, height/2, 0);
  rotateY(frameCount*PI/720);
  rotateX(-frameCount*PI/720);
  t.display();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      t.setSmooth(true);
    } else if (keyCode == DOWN) {
      t.setSmooth(false);
    }
  }
}