void setup() {
  size(1000, 800);
}

void draw() {
  background(255);
  //printMatrix();

  float w = 300;
  float h = 300;

  pushMatrix();
  translate(frameCount, height/2);
  rotate(frameCount*PI/180); // radians(frameCount)
  rect(-w/2, -h/2, w, h);
  popMatrix();

  translate(width/2, height/2);
  rotate(-frameCount*PI/180); // radians(frameCount)
  rect(-w/2, -h/2, w, h);
  
  
  //poly(float radius, int sides)
  noFill();
  poly(sin(frameCount*PI/30)*100, 3);
}
