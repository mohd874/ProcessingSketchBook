import org.jbox2d.collision.shapes.CircleShape;
import org.jbox2d.common.Vec2;
import org.jbox2d.dynamics.Body;
import org.jbox2d.dynamics.BodyDef;
import org.jbox2d.dynamics.BodyType;
import org.jbox2d.dynamics.FixtureDef;

//The Nature of Code
//<http://www.shiffman.net/teaching/nature>
//Spring 2010
//PBox2D example

//A circular particle

class Circle {

	Body body;
	Main p;

	float r;

	Circle(Main p_, float x, float y, float r_) {
		p = p_;
		r = r_;
		makeBody(x, y, r);
		body.setUserData(this);
	}

	void killBody() {
		p.box2d.destroyBody(body);
	}

	boolean done() {
		Vec2 pos = p.box2d.getBodyPixelCoord(body);
		if (pos.y > p.height + r * 2) {
			killBody();
			return true;
		}
		return false;
	}

	void display() {
		Vec2 pos = p.box2d.getBodyPixelCoord(body);
		float a = body.getAngle();
		
		p.pushMatrix();
		p.translate(pos.x, pos.y);

		p.rotate(-a);
		p.fill(127);
		p.stroke(0);
		p.strokeWeight(2);
		p.ellipse(0, 0, r * 2, r * 2);

		p.line(0, 0, r, 0);
		p.popMatrix();
	}

	void makeBody(float x, float y, float r) {
		BodyDef bd = new BodyDef();

		bd.position = p.box2d.coordPixelsToWorld(x, y);
		bd.type = BodyType.DYNAMIC;

		body = p.box2d.world.createBody(bd);

		// Make the body's shape a circle
		CircleShape cs = new CircleShape();
		cs.m_radius = p.box2d.scalarPixelsToWorld(r);

		FixtureDef fd = new FixtureDef();
		fd.shape = cs;

		fd.density = 2.0f;
		fd.friction = 0.3f;
		fd.restitution = 0.3f; // Restitution is bounciness

		body.createFixture(fd);
	}
}