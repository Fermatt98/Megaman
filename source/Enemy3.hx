package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class Enemy3 extends FlxSprite
{
	
	private var movement:Bool = false;
	private var maxAcceleration:Int = 200;
	private var wasOnScreen:Bool = false;
		
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
					Reg.megaman.kill();
				}
			}
		}
		else if (wasOnScreen)
		{
			kill();
		}
	}
	
}