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
		Reg.tilemap.setTileProperties(1, FlxObject.NONE);
		Reg.tilemap.setTileProperties(2, FlxObject.NONE);
		Reg.tilemap.setTileProperties(3, FlxObject.NONE);
		Reg.tilemap.setTileProperties(4, FlxObject.ANY);
		Reg.tilemap.setTileProperties(5, FlxObject.ANY);
		Reg.tilemap.setTileProperties(6, FlxObject.ANY);
		Reg.tilemap.setTileProperties(7, FlxObject.ANY);
		Reg.tilemap.setTileProperties(8, FlxObject.ANY);
		Reg.tilemap.setTileProperties(9, FlxObject.NONE);
		Reg.tilemap.setTileProperties(10, FlxObject.NONE);
		Reg.tilemap.setTileProperties(11, FlxObject.NONE);
		Reg.tilemap.setTileProperties(12, FlxObject.NONE);
		Reg.tilemap.setTileProperties(13, FlxObject.NONE);
		Reg.tilemap.setTileProperties(14, FlxObject.ANY);
		
		
		add(Reg.tilemap);
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
		if (FlxG.keys.justPressed.F)		
		{
			Reg.enemigoa == new Spine(FlxG.width / 2, FlxG.height);
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
	}
}
