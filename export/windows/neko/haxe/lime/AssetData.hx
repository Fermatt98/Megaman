package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Level1.oel", "assets/data/Level1.oel");
			type.set ("assets/data/Level1.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Megaman.oep", "assets/data/Megaman.oep");
			type.set ("assets/data/Megaman.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/gonzalo re piola.oep", "assets/gonzalo re piola.oep");
			type.set ("assets/gonzalo re piola.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/gonzalo.oel", "assets/gonzalo.oel");
			type.set ("assets/gonzalo.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/boss0.png", "assets/images/boss0.png");
			type.set ("assets/images/boss0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/boss1.png", "assets/images/boss1.png");
			type.set ("assets/images/boss1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/boss2.png", "assets/images/boss2.png");
			type.set ("assets/images/boss2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Cuerpo1.png", "assets/images/Cuerpo1.png");
			type.set ("assets/images/Cuerpo1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Cuerpo2.png", "assets/images/Cuerpo2.png");
			type.set ("assets/images/Cuerpo2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Enemy1.png", "assets/images/Enemy1.png");
			type.set ("assets/images/Enemy1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Enemy2.png", "assets/images/Enemy2.png");
			type.set ("assets/images/Enemy2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Enemy3.png", "assets/images/Enemy3.png");
			type.set ("assets/images/Enemy3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Enemy4.png", "assets/images/Enemy4.png");
			type.set ("assets/images/Enemy4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/megaman0.png", "assets/images/megaman0.png");
			type.set ("assets/images/megaman0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/megaman1.png", "assets/images/megaman1.png");
			type.set ("assets/images/megaman1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/megaman2.png", "assets/images/megaman2.png");
			type.set ("assets/images/megaman2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/megaman3.png", "assets/images/megaman3.png");
			type.set ("assets/images/megaman3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/megaman4.png", "assets/images/megaman4.png");
			type.set ("assets/images/megaman4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/MegamanTiles.png", "assets/images/MegamanTiles.png");
			type.set ("assets/images/MegamanTiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/NewPiskel.png", "assets/NewPiskel.png");
			type.set ("assets/NewPiskel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
