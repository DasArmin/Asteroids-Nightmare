package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Kogel extends GameObject
	{
		private var particleObject:Particle;
		
		public function Kogel() 
		{
			addChild(new Bullet());
			speedDividor = 150;
			collisionType = "circle";
			moveSpeed = 10;
			canCollide = false;
			
			width = height = 20;
		}
		
		public override function onEnterFrame():void {
			super.onEnterFrame();
			
			if (Math.random() < 0.15)
			{
				particleObject = new Particle();
				
				particleObject.x = this.x;
				particleObject.y = this.y;
				
				Main.updateFrame.push(stage.addChild(particleObject)); 
			}
		}
		
	}

}