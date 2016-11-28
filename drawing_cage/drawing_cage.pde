float theta = 0;
float phi = 0;

int ptCount = 300;
float counter1 = 0;
float rate1 = 3.95;

float counter2 = 0;
float rate2 = 5.55;

float counter3 = 0;
float rate3 = 5.125;

float counter4 = 0;
float rate4 = 5.125;

float counter5 = 0;
float rate5 = 6.125;

//Red Core
float counter6 = 0;
float rate6 = 5.125;

ArrayList<PVector> vecs = new ArrayList<PVector>();
ArrayList<PVector> bandVecs = new ArrayList<PVector>();
ArrayList<PVector> middleEarthVecs = new ArrayList<PVector>();
ArrayList<PVector> noiseVecs = new ArrayList<PVector>();
ArrayList<PVector> asteroidBeltVecs = new ArrayList<PVector>();
ArrayList<PVector> coreVecs = new ArrayList<PVector>();


ArrayList<PVector> allVecs = new ArrayList<PVector>();

void setup() {
 // size(2000, 1600, P3D);
  size(1920, 1080, P3D);

  sphereDetail(6);

  // path 1
  for (int i=0; i< ptCount; i++) {
    float r = random(14, 30)+i;
    r = 200;
    float x = sin(theta) * (r);
    float y = 0;
    float z = cos(theta) * (r);
    float tx = x;
    float ty = cos(phi)*y - sin(phi)*z;
    float tz = sin(phi)*y + cos(phi)*z;
    vecs.add(new PVector(tx, ty, tz));

    phi += TWO_PI/ random(.15, 1);
    theta += TWO_PI /random(12, 18);
  }

  //nucleous 
  theta = phi = 0;
  ptCount = 400;
  for (int i=0; i<=ptCount; i++) {
    float r = min(i*.35, 185);
    //r = 250;
    float x = sin(theta) * (r);
    float y = 0;
    float z = cos(theta) * (r);
    float tx = x;
    float ty = cos(phi)*y - sin(phi)*z;
    float tz = sin(phi)*y + cos(phi)*z;
    bandVecs.add(new PVector(tx, ty, tz));

    phi += TWO_PI/ random(.15, 1);
    theta += TWO_PI /random(12, 18);
  }


  //middleEarth  
  theta = phi = 0;
  ptCount = 600;
  for (int i=0; i<=ptCount; i++) {
    float r = min(i*.35, 185);
    r = random(135, 195);
    float x = sin(theta) * (r);
    float y = 0;
    float z = cos(theta) * (r);
    float tx = x;
    float ty = cos(phi)*y - sin(phi)*z;
    float tz = sin(phi)*y + cos(phi)*z;
    middleEarthVecs.add(new PVector(tx, ty, tz));

    phi += TWO_PI/ random(.15, 1);
    theta += TWO_PI /random(12, 18);
  }

  //noise  
  theta = phi = 0;
  ptCount = 600;
  for (int i=0; i<=ptCount; i++) {
    float r = min(i*.35, 185);
    r = random(250);
    r = 250;
    float x = sin(theta) * (r);
    float y = 0;
    float z = cos(theta) * (r);
    float tx = x;
    float ty = cos(phi)*y - sin(phi)*z;
    float tz = sin(phi)*y + cos(phi)*z;
    noiseVecs.add(new PVector(tx, ty, tz));

    phi += TWO_PI/ random(.15, 1);
    theta += TWO_PI /random(12, 18);
  }

  // asteroid belt (White)
  theta = phi = 0;
  ptCount = 5000;
  for (int i=0; i<=ptCount; i++) {
    float r = min(i*.35, 185);
    r = random(200, 275);
    //r = 250;
    float x = sin(theta) * (r);
    float y = 0;
    float z = cos(theta) * (r);
    float tx = x;
    float ty = cos(phi)*y - sin(phi)*z;
    float tz = sin(phi)*y + cos(phi)*z;
    asteroidBeltVecs.add(new PVector(tx, ty, tz));

    phi += TWO_PI/ random(.15, 1);
    theta += TWO_PI /random(12, 18);
  }

  // Core 
  theta = phi = 0;
  ptCount = 600;
  for (int i=0; i<=ptCount; i++) {
    float r = min(i*.35, 185);
    r = random(25, 65);
    //r = 250;
    float x = sin(theta) * (r);
    float y = 0;
    float z = cos(theta) * (r);
    float tx = x;
    float ty = cos(phi)*y - sin(phi)*z;
    float tz = sin(phi)*y + cos(phi)*z;
    coreVecs.add(new PVector(tx, ty, tz));

    phi += TWO_PI/ random(.15, 1);
    theta += TWO_PI /random(12, 18);
  }
}


void draw() {
  background(0);
  lights();
  noFill();
  strokeWeight(1.25);
  stroke(255, 145);
  translate(width/2, height/2, 335);
  rotateY(frameCount*PI/540.0);
  rotateX(frameCount*PI/720);
  //strokeWeight(frameCount); 
  //lights();
  sphereDetail(6);

  beginShape();
  for (int i=0; i<counter1; i++) {
    curveVertex(vecs.get(i).x, vecs.get(i).y, vecs.get(i).z);
  }
  endShape();

  noStroke();
  fill(250, 185, 255, 147);
  for (int i=1; i<counter1-1; i++) {
    pushMatrix();
    translate(vecs.get(i).x, vecs.get(i).y, vecs.get(i).z);
    sphere(3);
    popMatrix();
  }


  if (counter1 < vecs.size() - rate1) {
    counter1+=rate1;
  }


  //nucleous 
  strokeWeight(12.25);
  noFill();
  stroke(255, 27);
  beginShape();
  for (int i=0; i<counter2; i++) {
    curveVertex(bandVecs.get(i).x, bandVecs.get(i).y, bandVecs.get(i).z);
  }
  endShape();

  fill(255, 255, 0, 255);
  noStroke();
  for (int i=1; i<counter2-1; i++) {
    pushMatrix();
    translate(bandVecs.get(i).x, bandVecs.get(i).y, bandVecs.get(i).z);
    sphere(2);
    point(0, 0, 0);
    popMatrix();
  }

  if (counter1>vecs.size()-rate1 && counter2 < bandVecs.size() - rate2) {
    counter2+=rate2;
  }


  //MiddleEarth 
  strokeWeight(.75);
  noFill();
  stroke(130);
  beginShape();
  for (int i=0; i<counter3; i++) {
    curveVertex(middleEarthVecs.get(i).x, middleEarthVecs.get(i).y, middleEarthVecs.get(i).z);
  }
  endShape();

  fill(0, 200, 255, 255);
  noStroke();
  for (int i=1; i<counter3-1; i++) {
    pushMatrix();
    translate(middleEarthVecs.get(i).x, middleEarthVecs.get(i).y, middleEarthVecs.get(i).z);
    sphere(1);
    popMatrix();
  }

  if (counter2 > bandVecs.size()-rate2 && counter3 < middleEarthVecs.size() - rate3) {
    counter3+=rate3;
  }


  // Orange noise
  strokeWeight(4.75);
  noFill();
  stroke(30, 200, 200, 55);
  beginShape();
  for (int i=0; i<counter4; i++) {
    curveVertex(noiseVecs.get(i).x, noiseVecs.get(i).y, noiseVecs.get(i).z);
  }
  endShape();


  fill(255, 127, 0, 235);
  noStroke();
  for (int i=1; i<counter4-1; i++) {
    pushMatrix();
    translate(noiseVecs.get(i).x, noiseVecs.get(i).y, noiseVecs.get(i).z);
    sphere(3);
    popMatrix();
  }

  if (counter3 > middleEarthVecs.size()-counter3 && counter4 < noiseVecs.size() - rate4) {
    counter4+=rate4;
  }


  // white asteroid belt
  strokeWeight(.5);
  noFill();
  stroke(160, 90, 255, 215);
  beginShape();
  for (int i=0; i<counter5; i++) {
    if(i%4==0)
    curveVertex(asteroidBeltVecs.get(i).x, asteroidBeltVecs.get(i).y, asteroidBeltVecs.get(i).z);
  }
  endShape();

  sphereDetail(2);
  fill(230, 255, 230, 215);
  noStroke();
  for (int i=1; i<counter5-1; i++) {
    pushMatrix();
    translate(asteroidBeltVecs.get(i).x, asteroidBeltVecs.get(i).y, asteroidBeltVecs.get(i).z);
    sphere(random(.5, 1.25));
    popMatrix();
  }

  if (counter4 > noiseVecs.size()-rate4 && counter5 < asteroidBeltVecs.size() - rate5) {
    counter5+=rate5;
  }

  sphereDetail(6);
  // Core
  fill(255, 0, 0, 255);
  noStroke();
  for (int i=1; i<counter6-1; i++) {
    pushMatrix();
    translate(coreVecs.get(i).x, coreVecs.get(i).y, coreVecs.get(i).z);
    sphere(1);
    popMatrix();
  }

  if (counter5 > noiseVecs.size()-rate5 && counter6 < coreVecs.size() - rate6) {
    counter6+=rate6;
  }
}

void mousePressed(){
  saveFrame();
}