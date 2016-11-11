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
		loadGraphic(AssetPaths.Enemy1__png);
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
		if (isOnScreen())
		{
			FlxG.collide(Reg.tilemap, this);
			justTurned--;
			if (Reg.megaman.y == y + height - Reg.megaman.height)
			{
				if (movingRight)
				{
					velocity.x = Reg.velocityEnemy * -2;
				}
				else
				{
					velocity.x = Reg.velocityEnemy * 2;
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
			if (!Reg.megamanJustHit)
			{
				if (FlxG.overlap(this, Reg.megaman))
				{
					Reg.vidas -= 2;
					Reg.megamanJustHit = true;
					if (Reg.vidas <= 0)
					{
						Reg.megaman.kill();
					}
				}
			}
		}
		else
		{
			velocity.x = 0;
		}
	}
}