package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

        // Create a sprite
        var backgroundSprite:FlxSprite = new FlxSprite();
        backgroundSprite.loadGraphic("assets/images/soccernet2.jpeg");

        // Add the sprite to the game state
        add(backgroundSprite);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
