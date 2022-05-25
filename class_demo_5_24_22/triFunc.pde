void triangle(PVector pos, float radius) {
  float theta = 0.0;
  pushMatrix();
  translate(pos.x, pos.y);
  
  beginShape();
  float x = cos(theta)*radius;
  float y = sin(theta)*radius;
  vertex(x, y);
  theta += TWO_PI/3;
  
  x = cos(theta)*radius;
  y = sin(theta)*radius;
  vertex(x, y);

  theta += TWO_PI/3;
  
  x = cos(theta)*radius;
  y = sin(theta)*radius;
  vertex(x, y);
  endShape(CLOSE);

  popMatrix();
}
