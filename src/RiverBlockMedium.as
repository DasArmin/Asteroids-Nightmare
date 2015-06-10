package  
{
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class RiverBlockMedium extends GameObject
	{
		private var circleBlockMedium:CircleBlock;
		
		public function RiverBlockMedium() 
		{
			circleBlockMedium = new CircleBlock;
			addChild(circleBlockMedium);
			
			
			collisionType = "Circle";
			
			width = height = customWidth = 50;
			alpha = 0;
		}
		
	}

}