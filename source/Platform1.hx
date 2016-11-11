package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Platform1 extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16);
		FlxG.state.add(this);
		immovable = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (Reg.platTimer < Reg.platMaxTimer/2)
		{
			set_visible(true);
		}
		else
		{
			set_visible(false);
		}
		if (visible)
		{
			if(FlxG.collide(this, Reg.megaman))
			{
				Reg.megaman.setJumping();
			}
		}
	}
}