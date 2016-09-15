// only uses atan2 instead of Law of Cosines
// so initial joint gets elongated
// for LoC apparoch see Keith Peters explanation: http://flylib.com/books/en/4.261.1.96/1/

PVector j0, j1, j2, j3;
float len = 100.0;
float armDist = 300.0;
boolean isDraggable;
float mx, my;

void setup() {
  size(800, 600);
  j0 = new PVector();
  j1 = new PVector(len, 0);
  j2 = new PVector(len*2, 0);
  j3 = new PVector(len*3, 0);
}

void draw() {
  background(255);
  mx = mouseX - width/2;
  my = mouseY - height/2;
  translate(width/2, height/2);
  float theta = atan2(j3.y-j2.y, j3.x-j2.x);
  j2.x = j3.x - cos(theta)*len;
  j2.y = j3.y - sin(theta)*len;

  theta = atan2(j2.y-j1.y, j2.x-j1.x);
  j1.x = j2.x - cos(theta)*len;
  j1.y = j2.y - sin(theta)*len;

  //uncomment to untether
  //theta = atan2(j1.y-j0.y, j1.x-j0.x);
  //j0.x = j1.x - cos(theta)*len;
  //j0.y = j1.y - sin(theta)*len;
  
  beginShape();
  vertex(j0.x, j0.y);
  vertex(j1.x, j1.y);
  vertex(j2.x, j2.y);
  vertex(j3.x, j3.y);
  endShape();
  ellipse(j0.x, j0.y, 5, 5);
  ellipse(j1.x, j1.y, 5, 5);
  ellipse(j2.x, j2.y, 5, 5);
  ellipse(j3.x, j3.y, 5, 5);

  if (isDraggable) {
    j3.x = mx;
    j3.y = my;
  }
}

void mousePressed() {
  if (dist(mx, my, j3.x, j3.y) < 5) {
    isDraggable = true;
  }
}

void mouseReleased() {
  isDraggable = false;
}