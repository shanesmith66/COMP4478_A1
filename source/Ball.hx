package;

import flixel.FlxSprite;
import flixel.FlxG;

class Ball extends FlxSprite {

		var SPEED:Int = 150;

		public function new(xPos:Int=0, yPos:Int=0) {
			super(xPos, yPos);
			loadGraphic("assets/images/SoccerBall.png");
			drag.x = SPEED * 4;

	}

}