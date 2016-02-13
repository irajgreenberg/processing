class VerletBall {

  PVector pos, posOld;
  PVector push;
  float radius;

  VerletBall() {
  }

  VerletBall(PVector pos, PVector push, float radius) {
    this.pos = pos;
    this.push = push;
    this.radius = radius;
    this.posOld  = new PVector(pos.x, pos.y);

    // start motion
    pos.add(push);
    //pos.add(new PVector(2.1, 2.1));
  }

  void verlet() {
    PVector posTemp = new PVector(pos.x, pos.y);
    pos.x += (pos.x-posOld.x);
    pos.y += (pos.y-posOld.y);
    posOld.set(posTemp);
  }

  void render() {
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  void boundsCollision() {
    if (pos.x>width/2-radius) {
      pos.x = width/2-radius;
      posOld.x = pos.x;
      pos.x -= push.x;
    } else if (pos.x< -width/2+radius) {
      pos.x = -width/2+radius;
      posOld.x = pos.x;
      pos.x += push.x;
    }

    if (pos.y>height/2-radius) {
      pos.y = height/2-radius;
      posOld.y = pos.y;
      pos.y -= push.y;
    } else if (pos.y<-height+radius) {
      pos.y = -height+radius;
      posOld.y = pos.y;
      pos.y += push.y;
    }
  }
}