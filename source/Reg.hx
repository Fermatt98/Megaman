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
	
	static public var cantDisparos = 0;
	static public var megaman:FlxSprite;
	static public var enemy2:FlxSprite;
	static public var enemigoa:Spine;
	static public var tilemap:FlxTilemap;
	static public var vidas = 15;
	static public var ladder = false;
}