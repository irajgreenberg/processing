PImage p;
void setup() {
  p = loadImage("soccer.jpg");
  size(p.width*2, p.height);
  background(255);
  // box filter
  // Convolution factos should add up to 1
 float[] vals3_edgeDetect = {
    -.5, -.5, -.5, 
    -.5, 4, -.5, 
    -.5, -.5, -.5
  };


  image(p, 0, 0);
  // must be odd
  Matrix  m = new Matrix(vals3_edgeDetect);
  Filter f = new Filter(p, m, p.width, p.height, 3);
  f.mult();
  image(p, p.width, 0);
  // now draw p again
}

class Matrix {
  // 1d 9 len arr
  float[] vals;

  Matrix(float[] vals) {
    this.vals = vals;
  }
}

class Filter {
  PImage p;
  Matrix m;
  int w, h;
  int matDepth;

  Filter(PImage p, Matrix m, int w, int h, int matDepth) {
    this.p = p;
    this.m = m;
    this.w = w;
    this.h = h;
    this.matDepth = matDepth;
  }


  void mult() {
    color[] filteredPixels = new color[w*h];
    int offset = (matDepth-3)/2+1;
    // access pixels
    p.loadPixels();
    for (int i=0; i<h; i++) { // pixels h
      for (int j=0; j<w; j++) { // pixels w
        int ind = i*w + j; // pixel counter
        if (i>offset && i<h-offset && j>offset && j<w-offset) { // avoid boundaries
          float r=0, g=0, b=0;
          for (int k=0; k<matDepth; k++) {
            for (int l=0; l<matDepth; l++) {
              int matrixInd = k*matDepth+l;
              int pixelOffsetInd = (i - offset) * w + (j - offset) + l + w * k;
              r += red(p.pixels[pixelOffsetInd])*m.vals[matrixInd];
              g += green(p.pixels[pixelOffsetInd])*m.vals[matrixInd];
              b += blue(p.pixels[pixelOffsetInd])*m.vals[matrixInd];
            }
          }
          filteredPixels[ind] = color(constrain(r, 0, 255), constrain(g, 0, 255), constrain(b, 0, 255));
        } 
        else {
          filteredPixels[ind] = color(p.pixels[ind]);
        }
      }
    }
    p.pixels = filteredPixels;
    p.updatePixels();
  }
}

