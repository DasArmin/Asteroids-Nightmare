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
		private var effect:Bulletfade;
		
		public function Particle() 
		{
			effect = new Bulletfade;
			addChild(effect);
			this.alpha = 0.5;
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