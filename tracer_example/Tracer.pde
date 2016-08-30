class Tracer {

  PImage p;
  ArrayList< ArrayList<PVector> > data = new ArrayList< ArrayList<PVector> >();
  boolean isTraceable;

  Tracer() {
  }


  Tracer(String img) {
    p = loadImage(img);
  }

  void trace() {
    if (mousePressed && isTraceable) {
      data.get(data.size()-1).add(new PVector(mouseX, mouseY));
      println(data);
    }
  }

 
}