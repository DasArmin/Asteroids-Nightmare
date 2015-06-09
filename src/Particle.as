package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Particle extends GameObject
	{
		
		public function Particle() 
		{
			addChild(new Bush);
			
			speedDividor = Infinity;
			moveDirection = Main.fromAngleToPos(Math.random() * 360);
		}
		
		public override function onEnterFrame():void
		{
			super.onEnterFrame();
			alpha -= 0.03;
			if (alpha > 1)
				Main.destroyChild(this);
		}
	}

}