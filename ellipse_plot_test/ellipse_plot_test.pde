int stacks = 36;
int slices = 36;
int totalBodyVecs = slices*(stacks-2);
int totalFaces = slices*2 + (stacks-3)*slices*2;

PVector[] vecs = new PVector[totalBodyVecs];
PVector top, bottom;
Face[] faces = new Face[totalFaces];
void setup() {
  size(600, 600, P3D);
  float radius = 200.0;
  float theta = -PI/2.0f;
  noStroke();
  top = new PVector(0, -radius, 0);
  bottom = new PVector(0, radius, 0);

  // strokeWeight(5);
  for (int i=0, k=0; i<stacks; i++) {
    float phi = 0.0f;
    float x = cos(theta)*radius;
    float y = sin(theta)*radius;
    float z = 0;
    for (int j=0; j<slices; j++) {
      float pz = cos(phi)*z - sin(phi)*x;
      float px = sin(phi)*z + cos(phi)*x;
      if (i>0 && i< stacks-1) {
        vecs[k++] = new PVector(px, y, pz);
      }
      phi += TWO_PI/slices;
    }
    theta += PI/(stacks-1);
  }

  //strokeWeight(5);
  for (int i=0, ii=0; i<stacks-3; i++) {
    for (int j=0; j<slices; j++) {
      int k = i*slices+j;
      int l = (i+1)*slices+j;
      int m = (i+1)*slices+j+1;
      int n = i*slices+j+1;
      // for closing seam
      int o = (i+1)*slices;
      int p = i*slices;

      if (j<slices-1) {
        // top cap
        if (i==0) {
          faces[ii++] = new Face(vecs[k], top, vecs[n]);
        }
        // body
        faces[ii++] = new Face(vecs[k], vecs[l], vecs[m]);
        faces[ii++] = new Face(vecs[k], vecs[m], vecs[n]);
        // bottom cap
        if (i==stacks-4) {
          faces[ii++] = new Face(vecs[m], bottom, vecs[l]);
        }
      } else {
        // top cap 
        if (i==0) {
          faces[ii++] = new Face(vecs[k], top, vecs[p]);
        }
        // body
        faces[ii++] = new Face(vecs[k], vecs[l], vecs[o]);
        faces[ii++] = new Face(vecs[k], vecs[o], vecs[p]);
        // bottom cap 
        if (i==stacks-4) {
          faces[ii++] = new Face(vecs[o], bottom, vecs[l]);
        }
      }
    }
  }
}


void draw() {
  background(255);

  ambientLight(85, 85, 85);
  emissive(30, 0, 0);
  lightSpecular(255, 255, 255);
  pointLight(255, 255, 255, -10, -10, 100);
  pointLight(150, 150, 150, 0, 100, 800);
  specular(255, 255, 255);
  shininess(25);

  translate(width/2, height/2);
  rotateY(frameCount*PI/780);
  rotateX(frameCount*PI/390);
  //strokeWeight(5);
  for (int i=0; i<vecs.length-2; i++) {
    point(vecs[i].x, vecs[i].y, vecs[i].z);
  }

  for (int i=0; i<faces.length; i++) {
    faces[i].display();
  }
}


class Face {
  PVector v0, v1, v2;

  Face(PVector v0, PVector v1, PVector v2) {
    this.v0 = v0;
    this.v1 = v1;
    this.v2 = v2;
  }

  void display() {
    beginShape();
    vertex(v0.x, v0.y, v0.z);
    vertex(v1.x, v1.y, v1.z);
    vertex(v2.x, v2.y, v2.z);
    endShape(CLOSE);
  }
}
