public class TutorialController extends Controller {

    public SpringObject object;

    ComposedSpringObject cso;

    /* These are the agents senses (inputs) */
	DoubleFeature x; /* Positions */
	DoubleFeature y;
	DoubleFeature vx; /* Velocities */
	DoubleFeature vy;
	DoubleFeature angle; /* Angle */

    /* Example:
     * x.getValue() returns the vertical position of the rocket 
     */

	/* These are the agents actuators (outputs)*/
	RocketEngine leftRocket;
	RocketEngine middleRocket;
	RocketEngine rightRocket;

    /* Example:
     * leftRocket.setBursting(true) turns on the left rocket 
     */
	public static int discretize(double value, int nrValues, double min,
			double max) {
		if (nrValues < 2) {
			return 0;
		}

		double diff = max - min;

		if (value < min) {
			return 0;
		}
		if (value > max) {
			return nrValues - 1;
		}

		double tempValue = value - min;
		double ratio = tempValue / diff;

		return (int) (ratio * (nrValues - 2)) + 1;
	}
	
	public void init() {
		cso = (ComposedSpringObject) object;
		x = (DoubleFeature) cso.getObjectById("x");
		y = (DoubleFeature) cso.getObjectById("y");
		vx = (DoubleFeature) cso.getObjectById("vx");
		vy = (DoubleFeature) cso.getObjectById("vy");
		angle = (DoubleFeature) cso.getObjectById("angle");

		leftRocket = (RocketEngine) cso.getObjectById("rocket_engine_left");
		rightRocket = (RocketEngine) cso.getObjectById("rocket_engine_right");
		middleRocket = (RocketEngine) cso.getObjectById("rocket_engine_middle");
	}

    public void tick(int currentTime) {
    	Double cur_angle = angle.getValue();
		Double cur_vx = vx.getValue();
		Double cur_vy = vy.getValue();
		
		int state_angle = discretize(cur_angle, 8, -3.5, 3.5);
		int state_vy = discretize(cur_vy, 8, -10, 10);
		int state_vx = discretize(cur_vx, 16, -10, 10);
		//System.out.println(state_vy);
		//System.out.println(state_vx);
		String state = Integer.toString(state_angle) + ":" + Integer.toString(state_vx) + ":" + Integer.toString(state_vy);
		System.out.println("State: " + state);
		
		System.out.println(currentTime + " : " + 
		"Angle: " + cur_angle + " VX: " + cur_vx + " VY: " + cur_vy);
		/*if (cur_vy > 0) {
			middleRocket.setBursting(true);
		}
		else {
			middleRocket.setBursting(false);
		}
		if (cur_angle < 0) {
			if (cur_vy < 0) {
				leftRocket.setBursting(false);
				rightRocket.setBursting(false);
			}
			else {
				leftRocket.setBursting(true);
				rightRocket.setBursting(false);
			}
		}
		else {
			leftRocket.setBursting(false);
			rightRocket.setBursting(true);
		}*/
    	
    }
    
}
