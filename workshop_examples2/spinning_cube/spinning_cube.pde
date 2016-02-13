Cube c;
void setup() {
  size(800, 800, P3D);
  background(0);
  fill(195);
  noStroke();
  c = new Cube(new PVector(0, 0, 0), new Dimension(60, 60, 60));
 
}

void draw(){
  //fill(0, 40);
  background(0);
  rect(-1, -1, width+1, height+1);
  noFill();
  lights();
  translate(width/2, height/2, -200);
//  rotateX(frameCount*PI/780.0);
//  rotateY(frameCount*PI/180.0);
//  rotateZ(frameCount*PI/1080.0);
  c.display();
}

