package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

class Spine extends FlxSprite
{
	var movingRight:Bool = true;
	inline static var distanceSpeed:Int = 80;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 8, FlxColor.WHITE);
		y = y - height;
		velocity.x = Reg.velocityEnemy * -1;
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float) 
	{
		super.update(elapsed);
		if (isOnScreen())
		{
			if (x > FlxG.width - width && movingRight == false)
			{
				movingRight = true;
				velocity.x = Reg.velocityEnemy * -1;
			}
			else if(x < 1 && movingRight == true)
			{
				movingRight = false;
				velocity.x = Reg.velocityEnemy;
			}
			if (Reg.megaman.y == y-Reg.megaman.height+height)
			{
				if(movingRight == false)
					velocity.x = Reg.velocityEnemy * 3;
				else
					velocity.x = Reg.velocityEnemy * -3;
			}
			else
			{
				if(movingRight == false)
					velocity.x = Reg.velocityEnemy;
				else
					velocity.x = Reg.velocityEnemy * -1;
			}
			if (FlxG.overlap(this, Reg.megaman))
			{
				//hp--
			}
		}
		else
		{
			kill();
		}
	}
}