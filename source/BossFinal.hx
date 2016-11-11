package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxRandom;

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
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(24, 24);
		FlxG.state.add(this);
		random = new FlxRandom();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
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
					timer += elapsed
					if (timer > 0.1)
					{
						Reg.disparoArray[Reg.cantDisparosBoss] = new Disparo(x, y, _left);
						Reg.cantDisparosBoss++;
						if (Reg.cantDisparosBoss >= 3)
						{
							switch1 = true;
						}
					}
				}
		}
	}
}