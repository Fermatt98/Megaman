package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class Enemy4 extends FlxSprite
{
	private var body:Cuerpo; 
	private var _time:Float = 0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(20, 20);
		FlxG.state.add(this);
		body = new Cuerpo(x, y - height);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		_time += elapsed;
		if (Reg.megaman.x < x)
		{
			velocity.x = -50;
		}
		else
		{
			velocity.x = 50;
		}
		if (_time > 2)
		{
			destroy();
		}
	}
	
}