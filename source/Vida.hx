package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;

class Vida extends FlxSprite
{
	var startY:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(10, 60);
		startY = Y;
		color = FlxColor.BLUE;
		FlxG.state.add(this);
		scrollFactor.set(0, 0);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		makeGraphic(10, Reg.vidas);
		y = startY + (Reg.maxVidas-Reg.vidas);
	}
}