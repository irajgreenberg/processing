// Quick 3D Pie Example
// note: values passed to pie must add up to 1.0
// Ira Greenberg
// 2017
Wedge w;
Pie p;
void setup() {
  size(1000, 700, P3D);
  background(255);
  p = new Pie(new float[]{.04, .075, .15, .2, .215, .320}, 200, 250, color(255, 127, 0));
}

void draw() {
  background(255);
  lights();
  translate(width/2, height/2);
  rotateY(frameCount*PI/180.0);
  rotateX(PI/4.5);
  p.display();
}