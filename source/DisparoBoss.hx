package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxMath;

/**
 * ...
 * @author ...
 */
class DisparoBoss extends FlxSprite
{
	private var _left = false;

	public function new(?X:Float=0, ?Y:Float=0, left:Bool, ?angulo:Float = -1, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(8, 6);
		FlxG.state.add(this);
		if (angulo == -1)
		{
			if (left)
			{
				velocity.x = -Reg.disparoVelocityX;
			}
			else
			{
				velocity.x = Reg.disparoVelocityX;
			}
		}
		else
		{
			angle = angulo;
			velocity.x = Reg.disparoVelocityX * FlxMath.fastCos(angle);
			velocity.y = Reg.disparoVelocityX * FlxMath.fastSin(angle);
		}
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (!isOnScreen())
		{
			kill();
			Reg.cantDisparosBoss--;
		}
	}
	override public function kill():Void 
	{
		super.kill();
		Reg.cantDisparosBoss--;
	}
}