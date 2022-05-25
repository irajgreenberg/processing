float spd = 1;
void setup() {
  size(800, 800);
}

void draw() {
  background(255);

  // in general tranformation order is translate first
  //you must use both push and pop
  pushMatrix();
  translate(width/2+frameCount, height/2);
  rotate(spd*PI/180); //radians(value in degs)
  rect(-50, -50, 100, 100);
  popMatrix();

  // pushMatrix();
  //rotate(spd*PI/180*5); //radians(value in degs)
  triangle(new PVector(300, 300), 150);
  popMatrix();
  translate(width/2-frameCount, height/2);
  rotate(-frameCount*PI/180);
  rect(-50, -50, 100, 100);
  spd +=1;
}
