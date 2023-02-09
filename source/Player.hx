package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

class Player extends FlxSprite {

	final SPEED:Int = 200;

	// create new function
	public function new(xPos:Int=0, yPos:Int=0) {
		super(xPos, yPos);
		loadGraphic("assets/images/playersprite.png", true, 139, 95);
		drag.x = SPEED*4;
		drag.y = SPEED*4;
		animation.add("fly", [0,1,2,3,4,5], 12);

		// determine which direction player is facing
		setFacingFlip(LEFT, true, false);
		setFacingFlip(RIGHT, false, false);

	}

	// function which defines player movement
	private function movement():Void {

		// define necessary movement
		var up:Bool = false;
		var left:Bool = false;
		var right:Bool = false;
		var down:Bool = false;

		animation.play("fly");

		// define allowed movement keys
		up = FlxG.keys.anyPressed([UP, W, SPACE]);
		left = FlxG.keys.anyPressed([A, LEFT]);
		right = FlxG.keys.anyPressed([D, LEFT]);
		down = FlxG.keys.anyPressed([S, DOWN]);

		// define left and right movement
		if (left && right) {
			velocity.x = 0;
		}
		else if (right) {
			velocity.x = SPEED;
			facing = RIGHT;
		} 
		else if (left) {
			velocity.x = -SPEED;
			facing = LEFT;
		}

		// define up and down movement
		if (up && down) {
			velocity.y = 0;
		}
		else if (down) {
			velocity.y = SPEED;
		} 
		else if (up) {
			velocity.y = -SPEED;
		}

		// ensure player does not walk out of bounds of soccer net
		// soccer net bounded from x = 115->685, and y = 262->554px
		if(this.x <= 115) this.x = 115;
		if(this.x >= 685-this.width) this.x = 685-this.width;
		if(this.y <= 262) this.y = 262;
		if(this.y >= 554-this.height) this.y = 554-this.height;

	}

	override function update(elapsed) {
		super.update(elapsed);
		movement();
	}

}