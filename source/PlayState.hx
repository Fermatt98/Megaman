package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.FlxBasic;
import flixel.system.FlxSound;

class PlayState extends FlxState
{
	
	override public function create():Void
	{
		super.create();
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Level1__oel);
		Reg.tilemap = loader.loadTilemap(AssetPaths.MegamanTiles__png);
		FlxG.worldBounds.set(0, 0, Reg.tilemap.width, Reg.tilemap.height);
		
		Reg.tilemap.setTileProperties(0, FlxObject.NONE);
		Reg.tilemap.setTileProperties(1, FlxObject.NONE, offStairs);
		Reg.tilemap.setTileProperties(2, FlxObject.NONE, offStairs);
		Reg.tilemap.setTileProperties(3, FlxObject.NONE, offStairs2);
		Reg.tilemap.setTileProperties(4, FlxObject.ANY, spineRotation);
		Reg.tilemap.setTileProperties(5, FlxObject.ANY, spineRotation);
		Reg.tilemap.setTileProperties(6, FlxObject.ANY);
		Reg.tilemap.setTileProperties(7, FlxObject.ANY, pinchesRip);
		Reg.tilemap.setTileProperties(8, FlxObject.NONE);
		Reg.tilemap.setTileProperties(9, FlxObject.NONE);
		Reg.tilemap.setTileProperties(10, FlxObject.NONE, spineRotation);
		Reg.tilemap.setTileProperties(11, FlxObject.NONE);
		Reg.tilemap.setTileProperties(12, FlxObject.NONE, upStairs);
		Reg.tilemap.setTileProperties(13, FlxObject.ANY, pinchesRip);
		
		add(Reg.tilemap);
		Reg.mierdasDelPiso = new Array<Spine>();
		Reg.megaman = new Megaman();
		Reg.megaman.kill();
		FlxG.camera.setScrollBounds(0, Reg.tilemap.width, 0, Reg.tilemap.height);
		loader.loadEntities(placeEntities, "entities");
		FlxG.camera.follow(Reg.megaman);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(Reg.tilemap, Reg.megaman);
		Reg.platTimer += elapsed;
		if (Reg.platTimer > Reg.platMaxTimer)
		{
			Reg.platTimer = 0;
		}
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player")
		{
			if (!Reg.megaman.exists)
			{
				Reg.megaman = new Megaman(x, y);
			}
		}
		if (entityName == "mierdadelpiso")
		{
			Reg.mierdasDelPiso.push(new Spine(x, y));
		}
		if (entityName == "mierdaqueaparece1")
		{
			Reg.platform1 = new Platform1(x, y);
		}
		if (entityName == "mierdaqueaparece2")
		{
			Reg.platform2 = new Platform2(x, y);
		}
	}
	
	private function upStairs(a:FlxObject, b:FlxObject):Void
	{
		if (b == Reg.megaman &&FlxG.keys.justPressed.UP && !Reg.ladder)
		{
			Reg.megaman.makeGraphic(10, 24);
			Reg.megaman.velocity.x = 0;
			Reg.megaman.x = a.x;
			Reg.megaman.x += Reg.megaman.width - a.width / 2;
			Reg.megaman.y-=5;
			Reg.ladder = true;
		}
	}
	
	private function offStairs(a:FlxObject, b:FlxObject):Void
	{
		if (b == Reg.megaman)
		{
			if (Reg.ladder)
			{
				Reg.ladder = false;
				Reg.megaman.y -= Reg.megaman.height;
				Reg.megaman.makeGraphic(24, 24);
			}
		}
	}
	private function offStairs2(a:FlxObject, b:FlxObject):Void
	{
		if (b == Reg.megaman)
		{
			if (Reg.ladder)
			{
				Reg.ladder = false;
				Reg.megaman.y -= Reg.megaman.height;
				Reg.megaman.makeGraphic(24, 24);
			}
		}
		for (s in 0...Reg.mierdasDelPiso.length)
		{
			if (b == Reg.mierdasDelPiso[s] && Reg.mierdasDelPiso[s].justTurned <= 0)
			{
				if (Reg.mierdasDelPiso[s].movingRight)
				{
					Reg.mierdasDelPiso[s].movingRight = false;
				}
				else
				{
					Reg.mierdasDelPiso[s].movingRight = true;
				}					
				Reg.mierdasDelPiso[s].justTurned = 45;
			}
		}
	}
	
	private function spineRotation(a:FlxObject, b:FlxObject):Void
	{
		for (s in 0...Reg.mierdasDelPiso.length)
		{
			if (b == Reg.mierdasDelPiso[s] && Reg.mierdasDelPiso[s].justTurned <= 0)
			{
				if (Reg.mierdasDelPiso[s].movingRight)
				{
					Reg.mierdasDelPiso[s].movingRight = false;
				}
				else
				{
					Reg.mierdasDelPiso[s].movingRight = true;
				}					
				Reg.mierdasDelPiso[s].justTurned = 45;
			}
		}
	}
	private function pinchesRip(a:FlxObject, b:FlxObject):Void
	{
		for (s in 0...Reg.mierdasDelPiso.length)
		{
			if (b == Reg.mierdasDelPiso[s] && Reg.mierdasDelPiso[s].justTurned <= 0)
			{
				if (Reg.mierdasDelPiso[s].movingRight)
				{
					Reg.mierdasDelPiso[s].movingRight = false;
				}
				else
				{
					Reg.mierdasDelPiso[s].movingRight = true;
				}					
				Reg.mierdasDelPiso[s].justTurned = 45;
			}
		}
	}
}