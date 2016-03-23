// may include both concrete and abstract methods
// class that extends, must override abstract build method
// utlizes cstr chaining

abstract class Hat {
  PVector loc;
  float headRadius;
  color col;
  float price;

  PVector[][] hatData;

  Hat() {
    // call fully parameterized cstr
    this(new PVector(), 5.25, color(255, 127, 185), 39.50);
  }


  Hat(PVector loc, float headRadius) {
    // call fully parameterized cstr
    this(loc, headRadius, color(255, 127, 185), 39.50);
  }


  Hat(PVector loc, float headRadius, color col, float price) {
    this.loc = loc;
    this.headRadius = headRadius;
    this.col = col;
    this.price = price;
  }

  abstract void build();

  void display() {
    noFill();
    stroke(col);
    pushMatrix();
    translate(loc.x, loc.y);
    scale(headRadius);

    for (int i=0; i<hatData.length; i++) {
      beginShape();
      for (int j=0; j<hatData[i].length; j++) {
        vertex(hatData[i][j].x, hatData[i][j].y);
      }
      endShape();
    }
  }
  
}