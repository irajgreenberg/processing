class EulerBall {

  PVector pos;
  PVector spd;
  float radius;
  float accel;
  PVector wind;
  float damping, friction;

  EulerBall() {
  }

  EulerBall(PVector pos, PVector spd, float radius) {
    this.pos = pos;
    this.spd = spd;
    this.radius = radius;
    wind = new PVector(random(.001, .02),random(-.002, .001));
    damping = random(.65,.75);
    friction = random(.75,.95);
  }

  void move() {
    spd.x+= wind.x;
    spd.y+=accel;
    spd.y+= wind.y;
    pos.add(spd);
  }

  void render() {
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  void boundsCollision() {
    if (pos.x>width-radius) {
      pos.x = width-radius;
      spd.x *=-1;
    } 
    else if (pos.x<radius) {
      pos.x = radius;
      spd.x *=-1;
    }

    if (pos.y<radius) {
      pos.y = radius;
      spd.y *=-1;
    } 

    if (pos.y>height-radius) {
      pos.y = height-radius;
      spd.y *=-1;
      spd.y += damping;
      spd.x *= friction;
    }
  }
  
  void setAccel(float accel){
    this.accel = accel;
  }
  
  void setDamping(float damping){
    this.damping = damping;
  }
  
  void setFriction(float friction){
    this.friction = friction;
  }
}

