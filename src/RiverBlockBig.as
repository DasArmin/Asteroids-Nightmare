package  
{
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class RiverBlockBig extends GameObject
	{
		//private var circleBlockBig:CircleBlock;
		
		public function RiverBlockBig() 
		{
		//	circleBlockBig = new CircleBlock;
			//addChild(circleBlockBig);
			
			collisionType = "Circle";
			
			width = height = customWidth = 75;
			alpha = 0;
		}
		
	}

}