package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

class Player extends FlxSprite {

	override public function update(elapsed) {
		movement();
		super.update(elapsed);
	}

	// create new function
	public function new(xPos:Int=0, yPos:Int=0) {
		super(xPos, yPos);
		makeGraphic(16, 16, FlxColor.BLUE);
		drag.x = drag.y = 1600;
	}

	// function which defines player movement
	private function movement():Void {

		// define necessary movement; down won't be needed
		var up:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		// define allowed movement keys
		up = FlxG.keys.anyPressed([UP, W, SPACE]);
		left = FlxG.keys.anyPressed([A, LEFT]);
		right = FlxG.keys.anyPressed([D, LEFT]);

	}
}