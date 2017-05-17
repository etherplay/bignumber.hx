package bignumberjs;

import haxe.extern.EitherType;

@:jsRequire("bignumber.js")
@:native("BigNumber")
private extern class BigNumberExtern{
	public function new(value:Dynamic);
	public function equals(value : BigNumberExtern) : Bool;
	public function plus(value:BigNumberExtern) : BigNumberExtern;
	public function minus(value:BigNumber) : BigNumberExtern;
	public function dividedBy(value:BigNumberExtern) : BigNumberExtern;
	public function dividedToIntegerBy(value:BigNumberExtern) : BigNumberExtern;
	public function times(value:BigNumber) : BigNumberExtern;
	public function lt(value:BigNumberExtern) : Bool;
	public function gt(value:BigNumberExtern) : Bool;
	public function toString(base:Int):String;
	public function toPrecision(precision:Int):String;
	public function toNumber() : Float;
	public function toPower(pow : Int) : BigNumberExtern;
	public function floor() : BigNumberExtern;

	static public function random() : BigNumberExtern;
}

@:forward
abstract BigNumber(BigNumberExtern) to(BigNumberExtern) from(BigNumberExtern){
	inline public function new(value : Dynamic){
		this = new BigNumberExtern(value);
	}
		
	@:from inline static public function fromInt(value : Int) : BigNumber{
		return new BigNumber(new BigNumberExtern(value));
	}
	
	@:from inline static public function fromFloat(value : Float) : BigNumber{
		return new BigNumber(new BigNumberExtern(value));
	}
	
	@:from inline static public function fromString(value : String) : BigNumber{
		return new BigNumber(new BigNumberExtern(value));
	}
	
	static public function random() : BigNumber{
		return BigNumberExtern.random();
	}
}