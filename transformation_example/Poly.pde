void poly(float radius, int sides) {
  float x = 0;
  float y = 0;
  float theta = 0;

  beginShape();// starts recording internally
  for (int i=0; i<sides; i++) {
    x = cos(theta)*radius;
    y = sin(theta)*radius;
    vertex(x, y); // recorded coords
    theta += TWO_PI/sides;
  }
  endShape(CLOSE); // end record and draw to screen
}
