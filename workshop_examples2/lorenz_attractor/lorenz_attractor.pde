// Lorenze System// chaotic system

// known inputs but not deterministic behavior
float a = 10, b = 28, c = 8/3; 
PVector p = new PVector(.1, 0, 0);
PVector temp;
int lim = 100000;
int counter = 0;
int counterMax = 0;
ArrayList<PVector> verts = new ArrayList<PVector>();
float h = .01;

void setup() {
  size(800, 600, P3D);
  background(0);
  temp = new PVector();


  for (int i=0; i<lim; ++i) {
    //verts.add(new PVector(p.x, p.y, p.z));
    temp.x = p.x + h * a * (p.y - p.x);

    temp.y = p.y + h * (p.x*(b-p.z) - p.y);
    temp.z = p.z + h * (p.x * p.y - c * p.z);

    verts.add(new PVector(temp.x, temp.y, temp.z));
    // println(verts.get(i));
    p.set(temp);
  }

  stroke(255, 175);
  strokeWeight(2.5);
}

void draw() {
  fill(0, 20);
  rect(-1, -1, width+1, height+1);
  translate(width/2, height/2, 150);
  noFill();
  scale(3.75, 3.75, 3.75);
  rotateX(frameCount*PI/1780.0);
  rotateY(frameCount*PI/580.0);
  rotateZ(frameCount*PI/3080.0);

  beginShape(LINE_STRIP);
  //vertex(verts.get(0).x, verts.get(0).y, verts.get(0).z);
  for (int i=0; i<counterMax; i++) {
    vertex(verts.get(i).x, verts.get(i).y, verts.get(i).z);
  }
  endShape();
  if (counterMax < lim) {
    counterMax += 1;
  }
}

