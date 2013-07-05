import org.jbox2d.collision.shapes.PolygonShape;
import org.jbox2d.common.Vec2;
import org.jbox2d.dynamics.Body;
import org.jbox2d.dynamics.BodyDef;
import org.jbox2d.dynamics.BodyType;
import org.jbox2d.dynamics.FixtureDef;

class Box {
	Body body;
	Main p;
	
	float w, h;

	Box(Main p_, float x, float y, float w_, float h_) {
		p = p_;
		w = w_;
		h = h_;

		BodyDef bd = new BodyDef();
		bd.type = BodyType.DYNAMIC;
		bd.position.set(p.box2d.coordPixelsToWorld(400, 50));
		body = p.box2d.createBody(bd);

		PolygonShape ps = new PolygonShape();

		float box2dW = p.box2d.scalarPixelsToWorld(w / 2);
		float box2dH = p.box2d.scalarPixelsToWorld(h / 2);

		ps.setAsBox(box2dW, box2dH);

		FixtureDef fd = new FixtureDef();
		fd.shape = ps;
		fd.density = 1;
		fd.friction = 0.3f;
		fd.restitution = 0.5f;

		body.createFixture(fd);
	}

	void display() {
		Vec2 pos = p.box2d.getBodyPixelCoord(body);
		float a = body.getAngle();

		p.pushMatrix();
		p.translate(pos.x, pos.y);
		p.rotate(-a);
		p.fill(175);
		p.stroke(0);
		p.rectMode(p.CENTER);
		p.rect(0, 0, w, h);
		p.popMatrix();
	}
}