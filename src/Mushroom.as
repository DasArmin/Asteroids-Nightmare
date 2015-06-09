package  
{
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Mushroom extends GameObject
	{
		private var mushroom:Paddenstoeltje;
		
		public function Mushroom() 
		{
			mushroom = new Paddenstoeltje;
			addChild(mushroom);
			
			anchored = true;
		}
		
		public override function collidingWith(collideObject:GameObject):Boolean {
			if (collideObject is Player && super.collidingWith(collideObject))
			{
				(collideObject as Player).hiding = true;
				
			}
			return super.collidingWith(collideObject);
		}
		
	}

}