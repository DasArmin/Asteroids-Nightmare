package  
{
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class RiverBlockSmall extends GameObject
	{
		private var circleBlockSmall:CircleBlock;
		
		public function RiverBlockSmall() 
		{
			circleBlockSmall = new CircleBlock;
			addChild(circleBlockSmall);
			
			
			collisionType = "Circle";
			
			width = height = customWidth = 25;
			alpha = 0;
		}
		
	}

}