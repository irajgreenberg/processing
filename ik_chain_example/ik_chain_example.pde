int BONE_COUNT = 8;
float armLen = 400.0;
PVector[] bones = new PVector[BONE_COUNT];
float[] boneLens = new float[BONE_COUNT-1];

void setup() {
  size(1200, 900);

  float jointLen = armLen/BONE_COUNT;
  for (int i=0; i<BONE_COUNT; i++) {
    bones[i] = new PVector(jointLen*i, 0);

    if (i>0) {
      boneLens[i-1] = dist(bones[i-1].x, bones[i-1].y, bones[i].x, bones[i].y);
      println(boneLens[i-1]);
    }
  }
}


void draw() {
  background(255);
  // println(dist(mouseX, mouseY, bones[bones.length-1].x, bones[bones.length-1].y ));

  translate(width/2, height/2);
  noFill();
  beginShape();
  for (int i=0; i<BONE_COUNT; i++) {
    ellipse(bones[i].x, bones[i].y, 5, 5);
    vertex(bones[i].x, bones[i].y);
  }
  endShape();
  
  for (int i=BONE_COUNT-1; i>0; i--) {
      float theta = atan2(bones[i].y-bones[i-1].y, bones[i].x-bones[i-1].x);
      bones[i].x = bones[i-1].x+ cos(theta)* 50;
      bones[i].y = bones[i-1].y+ sin(theta)* 50;
  }


  if ( mousePressed && dist(mouseX-width/2, mouseY-height/2, bones[bones.length-1].x, bones[bones.length-1].y) < 75 ) {
    bones[bones.length-1].x = mouseX-width/2;
    bones[bones.length-1].y = mouseY-height/2;
  }
}