package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.math.FlxAngle;

/**
 * ...
 * @author ...
 */
class BossFinal extends FlxSprite
{
	private var switch1:Bool = false;
	private var _left:Bool = false;
	private var random:FlxRandom;
	private var timer:Float = 0;
	private var _angulo:Float = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(24, 24);
		loadGraphic(AssetPaths.boss0__png);
		FlxG.state.add(this);
		random = new FlxRandom();
		_angulo = FlxAngle.asRadians(180 / 5);
		Reg.disparoBossArray = new Array<DisparoBoss>();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (isOnScreen())
		{
			FlxG.collide(Reg.tilemap, this);
			timer += elapsed;
			if (timer > 1)
			{
				switch(random.int(0, 3))
				{
					case 0:
						if (Reg.megaman.x > x)
						{
							_left = false;
						}
						else
						{
							_left = true;
						}
						while (switch1)
						{
							timer += elapsed;
							if (timer > 0.1)
							{
								Reg.disparoBossArray[Reg.cantDisparosBoss] = new DisparoBoss(x, y, _left);
								Reg.cantDisparosBoss++;
								if (Reg.cantDisparosBoss >= 3)
								{
									switch1 = true;
								}
							}
						}
						
					case 1:
						for (a in 0...5)
						{
							Reg.disparoBossArray[Reg.cantDisparosBoss] = new DisparoBoss(x, y, _left, (_angulo*a + FlxAngle.asRadians(180)));
						}
						
					case 2:
						velocity.y = -Reg.maxVelocityBoss;
						acceleration.y = Reg.accelerationBoss;
						maxVelocity.y = Reg.maxVelocityBoss;
						velocity.x = (Reg.megaman.x + Reg.megaman.width / 2 - x + width / 2);
						while (FlxG.collide(Reg.tilemap, this))
						{
							
						}
						velocity.x = 0;
						velocity.y = 0;
						acceleration.y = 0;
				}
				timer = 0;
			}
		}
	}
}