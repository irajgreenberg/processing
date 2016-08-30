void setup() {
  size(1000, 805, P3D);
  background(255);
  //ortho();
  hint(DISABLE_DEPTH_TEST);
  int ht = 10;
  int steps = (height-5)/ht;
  for (int h=0; h<=100; h++) {
    for (int i=0; i<=steps; i++) {
      stroke(random(200, 220));
      fill(200, 200, 200, random(2, 10));
      pushMatrix();
      translate(random(-1, 1) + ht*h, height - (ht/2) - (ht*(i)), random(-1200, 1200));
      //rotateY(random(TWO_PI));
      //rotateX(random(TWO_PI));
      rotateZ(random(PI/180*-5, PI/180*5));
      box(ht + random(-5, 0));

      popMatrix();
    }
  }
}