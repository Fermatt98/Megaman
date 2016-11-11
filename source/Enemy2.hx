package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;
/**
 * ...
 * @author ...
 */
class Enemy2 extends FlxSprite
{
	private var _attack:Bool = false;
	private var _down:Bool = false;
	private var _startY:Float;
	private var megaDown:Bool = false;
	private var megaY:Float;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16);
		loadGraphic(AssetPaths.Enemy2__png);
		_startY = y;
		velocity.x = Reg.enemy2Velocity;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (isOnScreen())
		{
			for (i in 0...Reg.disparoArray.length)
			{
				if (FlxG.overlap(this, Reg.disparoArray[i]))
				{
					color = FlxColor.BLUE;
					Reg.score += Reg.scoreEnemigo1;
					kill();
					Reg.disparoArray[i].kill();
				}
			}
			if (((Reg.megaman.x + Reg.megaman.width / 2) - (x + width / 2) < Reg.enemy2Distance && (Reg.megaman.x + Reg.megaman.width / 2) - (x + width / 2) > -Reg.enemy2Distance) && !_attack)
			{
				_attack = true;
				_down = true;
				velocity.x = (Reg.megaman.x + Reg.megaman.width / 2 - x + width / 2)*2;
				velocity.y = (Reg.megaman.y + Reg.megaman.height / 2 - y + height / 2)*2;
				megaY = Reg.megaman.y + Reg.megaman.height;
				if (megaY > y + height)
				{
					megaDown = true;
				}
				else
				{
					megaDown = false;
				}
			}
			if (_attack)
			{
				if (megaDown)
				{
					if ((megaY <= y + height) && _down)
					{
						_down = false;
						velocity.y *= -1;
					}
					else if(!_down && _startY >= y)
					{
						velocity.y = 0;
						if (Reg.megaman.x > x)
						{
							velocity.x = Reg.enemy2Velocity *-1;
						}
						else
						{
							velocity.x = Reg.enemy2Velocity;
						}
						_attack = false;
					}
				}
				else
				{
					if ((megaY >= y + height) && _down)
					{
						_down = false;
						velocity.y *= -1;
					}
					else if(!_down && _startY <= y)
					{
						velocity.y = 0;
						if (Reg.megaman.x > x)
						{
							velocity.x = Reg.enemy2Velocity *-1;
						}
						else
						{
							velocity.x = Reg.enemy2Velocity;
						}
						_attack = false;
					}
				}
			}

			if (!Reg.megamanJustHit)
			{
				if (FlxG.overlap(this, Reg.megaman))
				{
					Reg.vidas -= 2;
					Reg.megamanJustHit = true;
					if (Reg.vidas <= 0)
					{
						Reg.megaman.kill();
					}
				}
			}
		}
	}
}