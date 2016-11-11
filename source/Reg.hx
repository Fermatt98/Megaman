package;
import flixel.FlxSprite;
import flixel.tile.FlxTilemap;

class Reg
{
	inline static public var megamanVelocity = 100;
	inline static public var megamanAccelerationY = 2000;
	inline static public var megamanMaxVelocityY = 250;
	inline static public var megamanJumpTime = 0.2;
	inline static public var megamanLadderSpeed = 100;
	inline static public var disparoVelocityX = 300;
	inline static public var maxCantDisparos = 3;
	inline static public var enemy2Distance = 75;
	inline static public var enemy2Velocity = -50;
	inline static public var velocityEnemy = 50;
	inline static public var accelerationEnemy3 = 50;
	inline static public var platMaxTimer = 4;
	
	static public var cantDisparos = 0;
	static public var megaman:Megaman;
	static public var enemy2:FlxSprite;
	static public var enemy4:FlxSprite;
	static public var velocityEnemy3:Float = 25;
	static public var tilemap:FlxTilemap;
	static public var vidas = 15;
	static public var ladder = false;
	static public var platTimer:Float = 0;
	static public var platform1:FlxSprite;
	static public var platform2:FlxSprite;
	static public var platBool:Bool = false;
	static public var platBool2:Bool = false;
	
	static public var mierdasDelPiso:Array<Spine>;
}