package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Megaman extends FlxSprite
{
	private var isJumping:Bool = false;
	private var jumpTimer:Float = 0;
	private var _left = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(4, 4);
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		jumpTimer += (elapsed);
		velocity.x = 0;
		if (FlxG.keys.pressed.LEFT)
		{
			_left = true;
			velocity.x = -Reg.megamanVelocity;
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			_left = false;
			velocity.x = Reg.megamanVelocity;
		}
		if (FlxG.keys.justPressed.Z && !isJumping)
		{
			jumpTimer = 0;	
			isJumping = true;
			velocity.y = -Reg.megamanMaxVelocityY;
		}
		if ((FlxG.keys.justReleased.Z && isJumping) || (isJumping && jumpTimer > Reg.megamanJumpTime))
		{
			acceleration.y = Reg.megamanAccelerationY;
			maxVelocity.y = Reg.megamanMaxVelocityY;
			/*
			if (y + height > FlxG.height)
			{
				isJumping = false;
				velocity.y = 0;
				acceleration.y = 0;
			}
			*/
		}
		if (FlxG.keys.justPressed.X && Reg.cantDisparos < Reg.maxCantDisparos)
		{
			var disparo = new Disparo(x, y, _left);
			Reg.cantDisparos++;
		}
	}
}