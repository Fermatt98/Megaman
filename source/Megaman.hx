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
	private var jumpStart:Int;
	private var jumpUp:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(24, 24);
		FlxG.state.add(this);
		maxVelocity.y = Reg.megamanMaxVelocityY;
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
		if (FlxG.keys.justPressed.Z && FlxG.collide(this, Reg.tilemap) && !isJumping)
		{
			jumpTimer = 0;
			jumpUp = true;
			isJumping = true;
			y--;
			velocity.y = -Reg.megamanMaxVelocityY;
		}
		if ((FlxG.keys.pressed.Z && jumpTimer < Reg.megamanJumpTime) && isJumping)
		{
			velocity.y = -Reg.megamanMaxVelocityY;
		}
		else
		{
			acceleration.y = Reg.megamanAccelerationY;
			jumpUp = false;
		}
		if (FlxG.collide(this, Reg.tilemap) && !jumpUp)
		{
			trace(0);
			isJumping = false;
		}
		if (FlxG.keys.justPressed.X && Reg.cantDisparos < Reg.maxCantDisparos)
		{
			var disparo = new Disparo(x, y, _left);
			Reg.cantDisparos++;
		}
		trace(jumpTimer);
	}
}