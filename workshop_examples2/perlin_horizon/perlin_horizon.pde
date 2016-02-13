// Perlin noise example
float detail = 200.0;
float noiseFactor = .045;
float noiseSpace = 0;


void setup() {
  size(1800, 200);
  background(0);
  noFill();
  stroke(255);
  strokeWeight(4);
  float xStep = width/(detail);
  float y = 0;
  float x = 0;
  beginShape();
  for (int i=0; i<=detail; i++) {
    x = i*xStep;
    noiseSpace += noiseFactor;
    y = noise(noiseSpace)*height/2;
    vertex(x, y);
  }
  endShape();
}

