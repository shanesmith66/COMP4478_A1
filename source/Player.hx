package;

import flixel.FlxSprite;
import flixel.FlxG;

class Player extends FlxSprite {

	public function new(xPos:Int=0, yPos:Int=0) {
		super(xPos, yPos);
		loadGraphic("assets/images/spritesheet.png", true, 384, 632);

	}
}