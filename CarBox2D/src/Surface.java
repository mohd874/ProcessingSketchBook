import java.util.ArrayList;

import org.jbox2d.collision.shapes.ChainShape;
import org.jbox2d.common.Vec2;
import org.jbox2d.dynamics.Body;
import org.jbox2d.dynamics.BodyDef;

class Surface {
	ArrayList<Vec2> surface;
	Main p;
	Surface(Main p_) {
		p = p_;
		surface = new ArrayList<Vec2>();
		surface.add(new Vec2(0, p.height / 2 + 50));
		surface.add(new Vec2(p.width / 2, p.height / 2 + 50));
		surface.add(new Vec2(p.width, p.height / 2));

		ChainShape chain = new ChainShape();

		Vec2[] vertices = new Vec2[surface.size()];

		for (int i = 0; i < vertices.length; i++) {
			vertices[i] = p.box2d.coordPixelsToWorld(surface.get(i));
		}

		chain.createChain(vertices, vertices.length);

		BodyDef bd = new BodyDef();
		Body body = p.box2d.world.createBody(bd);
		body.createFixture(chain, 1);
	}

	void display() {
		p.strokeWeight(1);
		p.stroke(0);
		p.noFill();

		p.beginShape();
		for (Vec2 v : surface) {
			p.vertex(v.x, v.y);
		}
		p.endShape();
	}
}