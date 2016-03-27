void setup() {
  size(1000, 800, P3D);
  background(255);
ortho();
  hint(DISABLE_DEPTH_TEST);

  for (int i=0; i<650; i++) {
    stroke(random(200, 220));
    fill(200, 200, 200, random(2, 10));
    pushMatrix();
    translate(random(width), random(height), random(-2300, 300));
    rotateY(random(TWO_PI));
    rotateX(random(TWO_PI));
    rotateZ(random(TWO_PI));
    box(random(5, 40));

    popMatrix();
  }
}