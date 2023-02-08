package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class MenuState extends FlxState
{
    override public function create()
    {

    	this.bgColor = FlxColor.WHITE;

    	// Create background sprite
        var backgroundSprite:FlxSprite = new FlxSprite();
        backgroundSprite.loadGraphic("assets/images/soccernet2.jpeg");
        add(backgroundSprite);

        // Create a text object to display the title of the game
        var title:FlxText = new FlxText(0, 100, FlxG.width, "Cow Ball");
        title.setFormat(null, 64, FlxColor.BLACK, "center");
        add(title);

        // Create a button to start the game
        var playButton:FlxButton = new FlxButton(0, 0, "Play", onPlay);
        playButton.screenCenter();
        add(playButton);

        super.create();
    }

    private function onPlay():Void
    {
        // Switch to the play state when the button is clicked
        FlxG.switchState(new PlayState());
    }

    override public function update(elapsed) {
    	super.update(elapsed);
    }
}
