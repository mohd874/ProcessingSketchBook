import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

PBox2D box2d;

ArrayList<Box> boxes;

void setup() {
  size(640,480);
  
  box2d = new PBox2D(this);

  //Create Body Definition
  BodyDef bd = new BodyDef();
  Vec2 center = box2d.coordPixelsToWorld(width/2, height/2);

  bd.position.set(center);

  //Create Body
  Body body = box2d.createBody(bd);
  body.setLinearVelocity(new Vec2(0, 3));
  body.setAngularVelocity(1.2);

  //Create Shape
  PolygonShape ps = new PolygonShape();

  float box2dW = box2d.scalarPixelsToWorld(150);
  float box2dH = box2d.scalarPixelsToWorld(100);
  ps.setAsBox(box2dW, box2dH);

  //Create Fixture Definition
  FixtureDef fd = new FixtureDef();
  fd.shape = ps;
  fd.friction = 0.3;
  fd.restitution = 0.5;
  fd.density = 1.0;

  //Attach Fixture Definition to Body
  body.createFixture(fd);

  //Initializes a Box2D world with default settings
  box2d.createWorld();
  boxes = new ArrayList<Box>();
}

void draw() {
  background(255);
  
  box2d.step();

  if (mousePressed) {
    Box p = new Box(mouseX, mouseY);
    boxes.add(p);
  }
  
  for(Box p : boxes){
    p.display();
  }
}
class Box {
  float x,y;
  float w,h;
  
  Box(float x_, float y_){
    x = x_;
    y = y_;
    
    w = 16;
    h = 16;
  }
  
  void display() {
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}

