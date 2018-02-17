class Pie {

  float[] vals;
  float radius;
  float depth;
  color col;
  Wedge[] wedges;

  Pie() {
  }

  Pie(float[] vals, float radius, float depth, color col) {
    this.vals = vals;
    this.radius = radius;
    this.depth = depth;
    this.col = col;
    float r = red(col);
    float g = green(col);
    float b = blue(col);
    wedges = new Wedge[vals.length];

    for (int i=0; i<wedges.length; i++) {
      wedges[i] = new Wedge(vals[i], radius, depth*vals[i], color(r*(vals[i]*wedges.length), g*(vals[i]*wedges.length), b*(vals[i]*wedges.length)));
    }
  }

  void display() {
    float theta = 0;
    noStroke();
    for (int i=0; i<wedges.length; i++) {
      pushMatrix();
      rotateZ(theta);
      wedges[i].display();
      theta+=vals[i]*TWO_PI;
      popMatrix();
    }
  }
}