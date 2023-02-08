package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;

class MenuState extends FlxState
{
    public function new()
    {
        super();

        // Create a text object to display the title of the game
        var title:FlxText = new FlxText(0, 0, FlxG.width, "My Game");
        title.setFormat(null, 32, 0xffffff, "center");
        add(title);

        // Create a button to start the game
        var playButton:FlxButton = new FlxButton(FlxG.width / 2 - 50, FlxG.height / 2 - 25, "Play", onPlay);
        playButton.label.setFormat(null, 16, 0xffffff, "center");
        add(playButton);
    }

    private function onPlay():Void
    {
        // Switch to the play state when the button is clicked
        FlxG.switchState(new PlayState());
    }
}
