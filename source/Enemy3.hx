package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemy3 extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		super(X, Y, SimpleGraphic);
		makeGraphic(12, 12);
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (isOnScreen())
		{
			wasOnScreen = true;
			if (velocity.y > maxAcceleration || velocity.y < -maxAcceleration)
			{
				if (movement)
				{
					movement = false;
				}
				else
				{
					movement = true;
				}
			}
			if (movement)
			{
				velocity.y += Reg.accelerationEnemy3;
			}
			else
			{
				velocity.y -= Reg.accelerationEnemy3;
			}
			velocity.x = Reg.velocityEnemy3 *-1;
			if (FlxG.overlap(this, Reg.megaman))
			{
				Reg.vidas -= 1;
				if (Reg.vidas == 0)
				{
					Reg.player.kill();
				}
			}
		}
		else if (wasOnScreen)
		{
			kill();
		}
	}
	
}