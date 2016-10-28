package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	
	override public function create():Void
	{
		super.create();
		Reg.megaman = new Megaman(FlxG.width / 2, FlxG.height - 24);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.F)		
		{
			Reg.enemigoa == new Spine(FlxG.width / 2, FlxG.height);
		}
	}
}
