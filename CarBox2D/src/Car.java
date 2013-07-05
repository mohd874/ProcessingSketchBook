import org.jbox2d.dynamics.Body;
import org.jbox2d.dynamics.joints.RevoluteJoint;
import org.jbox2d.dynamics.joints.RevoluteJointDef;

public class Car {

	Main p;

	Box chassis;
	Circle LWheel;
	Circle RWheel;

	RevoluteJoint LJoint;
	RevoluteJoint RJoint;

	final int LEFT = 0;
	final int RIGHT = 1;
	
	private final float MAX_SPEED = p.PI * 2;

	Car(Main p_) {
		p = p_;

		chassis = new Box(p, 400, 50, 200, 50);
		LWheel = new Circle(p, 350, 75, 25);
		RWheel = new Circle(p, 450, 75, 25);

		LJoint = makeJoint(chassis.body, LWheel.body);
		RJoint = makeJoint(chassis.body, RWheel.body);
	}

	private RevoluteJoint makeJoint(Body box1, Body box2) {
		RevoluteJointDef rjd = new RevoluteJointDef();

		rjd.initialize(box1, box2, box2.getWorldCenter());

		rjd.motorSpeed = p.PI * 2; // how fast?
		rjd.maxMotorTorque = 1000.0f; // how powerful?
		rjd.enableMotor = false; // is it on?

		return (RevoluteJoint) p.box2d.world.createJoint(rjd);
	}

	public void display() {
		chassis.display();
		RWheel.display();
		LWheel.display();
	}

	public void motorDirection(int direction) {
		if (!isMotorOn()) {
			switchMotorOn();
		}

		switch (direction) {
			case LEFT:
				LJoint.setMotorSpeed(MAX_SPEED);
				RJoint.setMotorSpeed(MAX_SPEED);
				break;
			case RIGHT:
				LJoint.setMotorSpeed(-MAX_SPEED);
				RJoint.setMotorSpeed(-MAX_SPEED);
				break;
		}
	}

	public void switchMotorOff() {
		LJoint.m_enableMotor = false;
		RJoint.m_enableMotor = false;
	}

	public void switchMotorOn() {
		LJoint.m_enableMotor = true;
		RJoint.m_enableMotor = true;
	}

	public boolean isMotorOn() {
		return (RJoint.isMotorEnabled() && LJoint.isMotorEnabled());
	}
}
