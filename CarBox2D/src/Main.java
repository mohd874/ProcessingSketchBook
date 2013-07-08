import pbox2d.PBox2D;
import processing.core.PApplet;

public class Main extends PApplet {

	PBox2D box2d;
	Box box;
	Surface surface;
	Car car;

	public void setup() {
		size(640, 480);
		background(0);

		box2d = new PBox2D(this);
		box2d.createWorld();

		surface = new Surface(this);
		// box = new Box(this,200, 50, 100, 50);
		car = new Car(this);
	}

	public void draw() {
		background(255);
		box2d.step();

		// box.display();
		surface.display();
		car.display();
	}

	public void keyPressed() {
		if (key == CODED) {
			if (keyCode == LEFT) {
				car.motorDirection(car.LEFT);
			} else if (keyCode == RIGHT) {
				car.motorDirection(car.RIGHT);
			}
		}
	}
	
	public void keyReleased(){
		if(key == CODED){
			if(keyCode == LEFT || keyCode == RIGHT){
				car.switchMotorOff();
			}
		}
	}

	public static void main(String args[]) {
		PApplet.main(new String[] { "--present", "Main" });
	}
}