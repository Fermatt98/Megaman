package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class VidaE extends FlxSprite
{

	var startY:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(10, 60);
		startY = Y;
		color = FlxColor.RED;
		FlxG.state.add(this);
		scrollFactor.set(0, 0);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		makeGraphic(10, Reg.vidasE);
		y = startY + (Reg.maxVidasE-Reg.vidasE);
	}
	
}