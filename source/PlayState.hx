package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import Player;
import Ball;

class PlayState extends FlxState
{

        // define sprites
        var player:Player;
        var ball:Ball;

        // define globally required variables
        var timer:Float = 3;
        var saved:Bool = false;
        var score:Int = 0;
        var scoreText:FlxText;
        var strikeText:FlxText;
        var chancesLeft:Int = 3;
        var displayText:FlxText;


        // function to update the ball so that not too many exist in the playstate - we will only be using one
        function updateBall() {
                ball.x = FlxG.random.float(115, 585);
                ball.y = FlxG.random.float(554, FlxG.height-ball.height);
        }

        // function used to display messages on the screen
        function displayMessage(message:String, color:FlxColor = FlxColor.WHITE) {
                displayText.text = message;
                displayText.setFormat(null, 156, FlxColor.WHITE, "center");
                displayText.screenCenter();
        }


	override public function create()
	{

        // Create a sprite
        var backgroundSprite:FlxSprite = new FlxSprite();
        backgroundSprite.loadGraphic("assets/images/soccernet2.jpeg");

        // Add the sprite to the game state
        add(backgroundSprite);

        // create player
        player = new Player();
        add(player);

        // create ball
        ball = new Ball();
        updateBall();
        add(ball);

        // create text which tracks score in top right
        scoreText = new FlxText(0, 0, 0, "Score: ");
        scoreText.size = 24;
        add(scoreText);

        // create text which tracks amount of missed balls remaining
        strikeText = new FlxText(FlxG.width-325, 0, 0, "");
        strikeText.text = "Chances Remaining: " + chancesLeft;
        strikeText.size = 24;

        strikeText.color = FlxColor.RED;
        add(strikeText);

        add(displayText);

        super.create();
	}

        var ballSpeed:Int;

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
                ballSpeed = FlxG.random.int(-150, -350);
                timer -= elapsed;
                saved = FlxG.overlap(player, ball);


                // if ball saved, update score
                if (saved) {
                        score += 1;
                        // displayMessage("Saved!");
                        timer = 3;
                        updateBall();
                }

                if (chancesLeft>0 && timer<0) {

                        // reset the ball
                        updateBall();

                        // reset timer
                        chancesLeft -= 1;

                        timer = 3;

                }

                if (chancesLeft <= 0) {
                        timer = 50000;
                        var loserText:FlxText = new FlxText(0, 0, FlxG.width, "You Lost!\nScore: " + score);
                        loserText.setFormat(null, 156, FlxColor.RED, "center");
                        loserText.screenCenter();
                        add(loserText);
                        while (timer > 0) {
                                timer -= elapsed;
                        }
                        FlxG.switchState(new MenuState());
                }



                strikeText.text = "Chances Remaining: " + chancesLeft;
                scoreText.text = "Score: " + score;

                // move ball
                if (timer <= 3) {
                        ball.velocity.y = ballSpeed;
                }

                if (ball.y <= 262) {
                        timer = 0;
                }

	}
}
