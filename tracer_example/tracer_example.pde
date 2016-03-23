Tracer t;
void setup(){
  size(800, 600);
  t = new Tracer();
}

void draw(){
  t.trace();
}

 void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        println("hit");
        t.isTraceable = true;
        t.data.add(new ArrayList<PVector>());
      } else if (keyCode == DOWN) {
        t.isTraceable = false;
      }
    }
  }