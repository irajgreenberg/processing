Branch b;
int counter = 0;

void setup() {
  size(800, 800);
  b = new Branch(new PVector(width/2, height), 3, 200, 90);
  b.draw();
 grow(b);
}

//void draw() {
//  background(255);
//  b.draw();
//}


void grow(Branch b) {
  for (PVector loc : b.getStems()) {
     b = new Branch(loc, 3, 200, 90);
     b.draw();
  }
}