abstract class VerletObj {

  VerletBall[] balls;
  ArrayList<VerletStick> sticks = new ArrayList<VerletStick>();
  float stiffness;

  VerletObj() {
  }

  VerletObj(float stiffness) {
    this.stiffness = stiffness;
  }



  void push(PVector push) {
    balls[0].pos.add(push);
  }

  // move object to a new place - MLee
  void move(float x, float y) {
    balls[0].pos.x = x;
    balls[0].pos.y = y;
  }

  void verlet() {
    for (VerletBall b : balls) {
      b.verlet();
    }

    for (VerletStick s : sticks) {
      s.constrainLen();
    }

    //collide();
  }

  void collide() {
    float jolt = 3.0;
    for (VerletBall b : balls) {
      if (b.pos.x > width/2) {
        b.pos.x = width/2;
        b.pos.x -= jolt;
      } else if (b.pos.x < -width/2) {
        b.pos.x = -width/2;
        b.pos.x += jolt;
      }

      if (b.pos.y > height/2) {
        b.pos.y = height/2;
        b.pos.y -= jolt;
      } else if (b.pos.y < -height/2) {
        b.pos.y = -height/2;
        b.pos.y += jolt;
      }

      if (b.pos.z > 250) {
        b.pos.z = 250;
        b.pos.z -= jolt;
      } else if (b.pos.z < -250) {
        b.pos.z = -250;
        b.pos.z += jolt;
      }
    }
  }
}

class VerletBall {

  PVector pos, posOld, push;
  float radius;

  VerletBall() {
  }

  VerletBall(PVector pos) {
    this.pos = pos;
    this.posOld  = new PVector(pos.x, pos.y, pos.z);
  }

  VerletBall(PVector pos, PVector push, float radius) {
    this.pos = pos;
    this.push = push;
    this.radius = radius;
    this.posOld  = new PVector(pos.x, pos.y);

    // start motion
    //pos.add(push);
    pos.add(new PVector(2.1, 2.1));
  }

  void verlet() {
    PVector posTemp = new PVector(pos.x, pos.y, pos.z);
    pos.x += (pos.x-posOld.x);
    pos.y += (pos.y-posOld.y);
    pos.z += (pos.z-posOld.z);
    posOld.set(posTemp);
  }

  void boundsCollision() {
    if (pos.x>width-radius) {
      pos.x = width-radius;
      posOld.x = pos.x;
      pos.x -= push.x;
    } else if (pos.x<radius) {
      pos.x = radius;
      posOld.x = pos.x;
      pos.x += push.x;
    }

    if (pos.y<radius) {
      pos.y = radius;
      posOld.y = pos.y;
      pos.y += push.y;
    } 

    if (pos.y>height-radius) {
      pos.y = height-radius;
      posOld.y = pos.y;
      pos.y -= push.y;
    }
  }
}

class Vec2 {
  float x, y;

  Vec2() {
  }
  Vec2(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

class VerletStick {

  VerletBall b1, b2;
  float stiffness;

  PVector vecOrig;
  float len;
  Vec2 bias;
  boolean isVisible;

  VerletStick() {
  }

  VerletStick(VerletBall b1, VerletBall b2, float stiffness, boolean isVisible) {
    this.b1 = b1;
    this.b2 = b2;
    this.stiffness = stiffness;
    bias = new Vec2(.5, .5);
    this.isVisible = isVisible;
    vecOrig  = new PVector(b2.pos.x-b1.pos.x, b2.pos.y-b1.pos.y, b2.pos.z-b1.pos.z);
    len = dist(b1.pos.x, b1.pos.y, b1.pos.z, b2.pos.x, b2.pos.y, b2.pos.z);
  }

  VerletStick(VerletBall b1, VerletBall b2, float stiffness, Vec2 bias, boolean isVisible) {
    this.b1 = b1;
    this.b2 = b2;
    this.stiffness = stiffness;
    this.bias = bias;
    this.isVisible = isVisible;
    vecOrig  = new PVector(b2.pos.x-b1.pos.x, b2.pos.y-b1.pos.y, b2.pos.z-b1.pos.z);
    len = dist(b1.pos.x, b1.pos.y, b1.pos.z, b2.pos.x, b2.pos.y, b2.pos.z);
  }


  // constrainVal needs to be changed for anchors
  void constrainLen() {
    for (int i=0; i<2; i++) {
      PVector delta = new PVector(b2.pos.x-b1.pos.x, b2.pos.y-b1.pos.y, b2.pos.z-b1.pos.z);
      float deltaLength = delta.mag();
      float difference = ((deltaLength - len) / deltaLength);
      b1.pos.x += delta.x * (bias.x * stiffness * difference);
      b1.pos.y += delta.y * (bias.x * stiffness * difference);
      b1.pos.z += delta.z * (bias.x * stiffness * difference);
      b2.pos.x -= delta.x * (bias.y * stiffness * difference);
      b2.pos.y -= delta.y * (bias.y * stiffness * difference);
      b2.pos.z -= delta.z * (bias.y * stiffness * difference);
    }
  }



  void display() {
    if (isVisible) {
//      beginShape();
//      vertex(b1.pos.x, b1.pos.y, b1.pos.z);
//      //curveVertex(b1.pos.x, b1.pos.y, b1.pos.z);
//      //curveVertex(b2.pos.x, b2.pos.y, b2.pos.z);
//      vertex(b2.pos.x, b2.pos.y, b2.pos.z);
//      endShape();
      line(b1.pos.x, b1.pos.y, b1.pos.z, b2.pos.x, b2.pos.y, b2.pos.z);
    }
  }
}




class VerletBlock extends VerletObj {

  PVector sz;

  VerletBlock() {
  }

  VerletBlock(PVector sz, float stiffness) {
    super(stiffness);
    balls = new VerletBall[8];
    sphereDetail(3);
    this.sz = sz;

    // top balls
    balls[0] = new VerletBall(new PVector(-sz.x/2, -sz.y/2, sz.z/2)); //LF
    balls[1] = new VerletBall(new PVector(sz.x/2, -sz.y/2, sz.z/2)); //RF
    balls[2] = new VerletBall(new PVector(sz.x/2, -sz.y/2, -sz.z/2)); //RB
    balls[3] = new VerletBall(new PVector(-sz.x/2, -sz.y/2, -sz.z/2)); //LB

    // bottom balls
    balls[4] = new VerletBall(new PVector(-sz.x/2, sz.y/2, sz.z/2)); //LF
    balls[5] = new VerletBall(new PVector(sz.x/2, sz.y/2, sz.z/2)); //RF
    balls[6] = new VerletBall(new PVector(sz.x/2, sz.y/2, -sz.z/2)); //RB
    balls[7] = new VerletBall(new PVector(-sz.x/2, sz.y/2, -sz.z/2)); //LB

    // sticks
    // top
    sticks.add(new VerletStick(balls[0], balls[1], stiffness, true));
    sticks.add(new VerletStick(balls[1], balls[2], stiffness, true));
    sticks.add(new VerletStick(balls[2], balls[3], stiffness, true));
    sticks.add(new VerletStick(balls[3], balls[0], stiffness, true));
    //crosses
    sticks.add(new VerletStick(balls[0], balls[2], stiffness, false));

    //bottom
    sticks.add(new VerletStick(balls[4], balls[5], stiffness, true));
    sticks.add(new VerletStick(balls[5], balls[6], stiffness, true));
    sticks.add(new VerletStick(balls[6], balls[7], stiffness, true));
    sticks.add(new VerletStick(balls[7], balls[4], stiffness, true));
    //crosses
    sticks.add(new VerletStick(balls[4], balls[6], stiffness, false));

    // vertical rails
    sticks.add(new VerletStick(balls[0], balls[4], stiffness, true));
    sticks.add(new VerletStick(balls[1], balls[5], stiffness, true));
    sticks.add(new VerletStick(balls[2], balls[6], stiffness, true));
    sticks.add(new VerletStick(balls[3], balls[7], stiffness, true));

    // diagnols
    sticks.add(new VerletStick(balls[0], balls[6], stiffness, false));
    sticks.add(new VerletStick(balls[1], balls[7], stiffness, false));
    sticks.add(new VerletStick(balls[2], balls[4], stiffness, false));
    sticks.add(new VerletStick(balls[5], balls[3], stiffness, false));

    // side crosses
    sticks.add(new VerletStick(balls[3], balls[4], stiffness, false));
    sticks.add(new VerletStick(balls[1], balls[6], stiffness, false));
  }

  void display() {

    noFill();
    beginShape();
    for (VerletBall b : balls) {
      //pushMatrix();
      //translate(b.pos.x, b.pos.y);
      //stroke(255, 75);
      //box(5);
      //popMatrix();
    }


    
    strokeWeight(1.5);
    stroke(255, 255, 51);
    for (VerletStick s : sticks) {
      s.display();
    }
  }
}




class VerletRay extends VerletObj {
  int joints;
  float radius;

  VerletRay() {
  }

  VerletRay(int joints, float radius, float stiffness) {
    super(stiffness);
    this.joints = joints;
    this.radius = radius;
    balls = new VerletBall[joints];

    float theta = 0.0;
    float randomDepth = random(-200, -50);
    for (int i=0; i<joints; i++) {
      balls[i] = new VerletBall(new PVector(cos(theta)*radius, sin(theta)*radius, randomDepth));
      theta += TWO_PI/joints;
    }

    for (int i=0; i<joints; i++) {
      if (i < joints-1) {
        sticks.add(new VerletStick(balls[i], balls[i+1], stiffness, true));
      } else {
        sticks.add(new VerletStick(balls[i], balls[0], stiffness, true));
      }
      if (i < joints/2) {
        sticks.add(new VerletStick(balls[i], balls[i+joints/2], stiffness, true));
      }
    }
  }

  void display() {
//    fill(105, 75, 105, 15);
//    beginShape();
//    for (VerletBall b : balls) {
//      curveVertex(b.pos.x, b.pos.y, b.pos.z);
//    }
//    endShape(CLOSE);

    strokeWeight(1.5);
    stroke(255,102,178);
    for (VerletStick s : sticks) {
      s.display();
    }
  }
}




class VerletSpider extends VerletObj {
  int legs;
  int joints;
  float radius;
  float bodyRadius = 6;
  float legGap = 0.0;

  VerletSpider() {
  }

  VerletSpider(int legs, int joints, float radius, float stiffness) {
    super(stiffness);
    this.legs = legs;
    this.joints = joints;
    this.radius = radius;
    balls = new VerletBall[legs*(joints-1)+1];

    float theta = 0.0;
    legGap = radius/joints;
    // lead node
    balls[0] = new VerletBall(new PVector(0, 0, 0));
    for (int i=0, k=0; i<legs; i++) {
      for (int j=1; j<joints; j++) {
        k = i*(joints-1)+j;
        //println(k);
        balls[k] = new VerletBall(new PVector(bodyRadius+cos(theta)*legGap*j, bodyRadius+sin(theta)*legGap*j, 0));
        if (j==1) {
          sticks.add(new VerletStick(balls[0], balls[k], stiffness, true));
        } else {
          sticks.add(new VerletStick(balls[k-1], balls[k], stiffness, true));
        }
      }
      theta += TWO_PI/legs;
    }
  }

  void display() {
    strokeWeight(2.5);
    stroke(102,255,102);
    for (VerletStick s : sticks) {
      s.display();
    }

    //body
    //strokeWeight(1.75);
    //pushMatrix();
    //translate(balls[0].pos.x, balls[0].pos.y);
    //stroke(175, 195, 175);
    //fill(#aabbcc);
    //sphere(legGap);
    //popMatrix();

    strokeWeight(1.75);
    for (int i=0; i<balls.length; i++) {
      pushMatrix();
      translate(balls[i].pos.x, balls[i].pos.y);
      fill(125, 135, 190, 25);
      ellipse(0, 0, 7, 7);
      popMatrix();
    }
  }
}
