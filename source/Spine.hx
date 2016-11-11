package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

class Spine extends FlxSprite
{
	public var movingRight:Bool = true;
	public var justTurned:Int = 10;
	private var startX:Float;
	private var startY:Float;
	inline static var distanceSpeed:Int = 80;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 8, FlxColor.WHITE);
		y = y + height;
		startX = x;
		startY = y;
		velocity.x = Reg.velocityEnemy * -1;
		movingRight = false;
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float) 
	{
		super.update(elapsed);
		FlxG.collide(Reg.tilemap, this);
		justTurned--;
		if (Reg.megaman.y == y - height)
		{
			if (movingRight)
			{
				velocity.x = Reg.velocityEnemy * -3;
			}
			else
			{
				velocity.x = Reg.velocityEnemy * 3;
			}		
		}
		else
		{
			if (movingRight)
			{
				velocity.x = Reg.velocityEnemy * -1;
			}
			else
			{
				velocity.x = Reg.velocityEnemy * 1;
			}
		}
		if (FlxG.overlap(this, Reg.megaman))
		{
			//hp--
		}
	}
}