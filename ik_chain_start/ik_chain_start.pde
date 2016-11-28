final int BONE_COUNT = 8;
PVector[] bones = new PVector[BONE_COUNT];
float armLen = 300;
void setup() {
  size(1200, 900);
  float boneLen = armLen/BONE_COUNT;
  for (int i=0; i<bones.length; i++) {
    bones[i] = new PVector(boneLen*i, 0);
  }
}


void draw() {
  background(255);
  noFill();

  translate(width/2, height/2);
  beginShape();
  for (int i=0; i<bones.length - 1; i+=2) {
    vertex(bones[i].x, bones[i].x);
  }
  endShape();

  for (int i=0; i<bones.length - 1; i+=2) {
    ellipse(bones[i].x, bones[i].x, 5, 5);
  }
}