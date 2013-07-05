import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


PBox2D box2d;
Boundry boundry;
Surface surface;
Concave concave;
ArrayList<Box> boxes;

void setup() {
  size(640, 480);

  box2d = new PBox2D(this);
  //Initializes a Box2D world with default settings
  box2d.createWorld();

  boundry = new Boundry(width/2, height/2, 300, 200);
  surface = new Surface();
  boxes = new ArrayList<Box>();
  
  Vec2[] points = new Vec2[5];
  points[0] = new Vec2(40,40);
  points[1] = new Vec2(40,20);
  points[2] = new Vec2(20,20);
  points[3] = new Vec2(20,40);
  points[4] = new Vec2(50,50);
  concave = new Concave(points);
}

void draw() {
  background(255);

  box2d.step();

  if (mousePressed) {
    Box p = new Box();
    boxes.add(p);
  }
  boundry.display();
  surface.display();  
  for (Box p : boxes) {
    p.display();
  }
  concave.display();
}
