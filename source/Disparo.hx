package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Disparo extends FlxSprite
{
	private var _left = false;

	public function new(?X:Float=0, ?Y:Float=0, left:Bool, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(8, 6);
		FlxG.state.add(this);
		if (left)
		{
			velocity.x = -Reg.disparoVelocityX;
		}
		else
		{
			velocity.x = Reg.disparoVelocityX;
		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (!isOnScreen())
		{
			kill();
			Reg.cantDisparos--;
		}
	}
}