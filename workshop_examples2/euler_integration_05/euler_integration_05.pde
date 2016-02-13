/**
 * Euler Integration (v03)
 * Pos  +=  spd 
 * + acceleration
 * + arrays
 * + damping & friction
 * + emitter
 */


int ballCount = 2000;
color[] cols = new color[ballCount];
EulerBall[] balls = new EulerBall[ballCount];
float emissionRate = 1.2;
float liveBallCount;

void setup() {
  size(displayWidth, displayHeight, P3D);
  background(255);
  fill(0);
 
  for (int i=0; i<ballCount; i++) {
    balls[i] = new EulerBall(new PVector(65, height/4.25), new PVector(random(-.5, .5), random(-2.7, -1)), random(1, 2));
    balls[i].setAccel(.02);
    cols[i] = color(random(180), random(70), random(20), random(5, 10));
  }
}

void draw() {
  //background(255);
   noStroke();
  for (int i=0; i<liveBallCount; i++) {
    balls[i].move();
    fill(cols[i]);
    balls[i].render();
    balls[i].boundsCollision();
  }
  if(liveBallCount < ballCount - emissionRate){
    liveBallCount += emissionRate;
  }
}

