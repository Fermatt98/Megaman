package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class BossFinal extends FlxSprite
{
	private var switch1:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(24, 24);
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		switch(random.int(0, 3))
		{
			case 0:
				while (switch1)
				{
					Reg.disparoArray[Reg.cantDisparos] = new Disparo(x, y, _left);
					Reg.cantDisparos++;
				}
		}
	}
}